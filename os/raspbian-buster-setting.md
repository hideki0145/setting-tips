# Raspbian buster 設定

## Install

- SDカードのフォーマット
  - Windows
    - SD Card Formatterを使用
- Raspbianのダウンロード
  - <http://ftp.jaist.ac.jp/pub/raspberrypi/raspbian_lite/images/>
  - <http://ftp.jaist.ac.jp/pub/raspberrypi/raspbian/images/>
- ダウンロードしたファイルをSDカードに書き込み
  - Windows
    - balenaEtcherを使用
- SSHの有効化
  - 「/boot/ssh」ファイルを作成
    - エクスプローラーからSDカードのbootフォルダに直接作成

インストール完了後...

- 固定IPアドレスの設定
  - /etc/dhcpcd.confの編集
    - 設定ファイルの末尾に以下を追加

      ```conf:/etc/dhcpcd.conf
        .
        .
      interface wlan0
      static ip_address=xxx.xxx.xxx.xxx/xx
      static routers=xxx.xxx.xxx.xxx
      static domain_name_servers=xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx
      ```

- raspi-configを使用した設定

  ```sh
  sudo raspi-config
  ```

  - ロケール/タイムゾーン/キーボードレイアウト変更
    - [4 Localisation Options]-[I1 Change Locale]
      1. [ja_JP.UTF-8 UTF-8]を追加で選択する
      2. Default localeとして[ja_JP.UTF-8]を選択する

    - [4 Localisation Options]-[I2 Change Timezone]
      - [Asia]-[Tokyo]を選択する

    - [4 Localisation Options]-[I3 Change Keyboard Layout]
      1. [Generic 105-key (Intl) PC]を選択する
      2. [Other]を選択する
      3. [English (US)]を選択する
      4. [English (US)]を選択する
      5. その後の設定は全てデフォルト値を選択する

    - [4 Localisation Options]-[I4 Change Wi-fi Country]
      - [JP Japan]を選択する

  - ホスト名の変更
    - [2 Network Options]-[N1 Hostname]から変更
  - piユーザのパスワード変更
    - [1 Change User Password]から変更

  最後に再起動

  ```sh
  sudo reboot
  ```

- Wi-Fiの設定
  - /etc/wpa_supplicant/wpa_supplicant.confの編集

    ```conf:/etc/wpa_supplicant/wpa_supplicant.conf
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    country=JP

    network={
            ssid="xxxxxxxxxx"
            psk="xxxxxxxxxx"
            scan_ssid=1
    }
    ```

  > [参考]ステルスSSIDへの接続
  > <http://frontier-of-curiosity.org/2016/04/03/raspberry-pi%E3%82%92%E5%AE%B6%E3%81%AEwifi%E3%81%AB%E6%8E%A5%E7%B6%9A%E3%81%99%E3%82%8B/>

- パッケージの更新

  ```sh
  sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
  ```

## Setting

- Vimのインストール

  ```sh
  sudo apt install -y vim
  ```

- Gitのインストール

  ```sh
  sudo apt install -y git
  # 基本設定
  git config --global user.name "User Name"
  git config --global user.email "username@example.com"
  # global .gitignore設定
  vi ~/.config/git/ignore
  ```

- SSH鍵の作成

  ```sh
  ssh-keygen -t rsa -b 4096 -f id_rsa_filename -C "username@example.com"
  ```

  ```config:~/.ssh/config
  Host sample.com
      HostName sample.com
      User user
      IdentityFile ~/.ssh/id_rsa_filename
      IdentitiesOnly yes
  ```

- OpenSSH Serverのインストール

  ```sh
  sudo apt install -y openssh-server
  ```

  ```config:/etc/ssh/sshd_config
    .
    .
  # アンコメントする
  AuthorizedKeysFile     .ssh/authorized_keys .ssh/authorized_keys2
    .
    .
  ```

  ```sh
  # SSHサービス再起動
  sudo systemctl restart ssh.service
  ```

- リモートデスクトップ接続の準備

  ```sh
  sudo apt install -y tightvncserver
  sudo apt install -y xrdp
  ```
