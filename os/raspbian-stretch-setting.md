# Raspbian stretch 設定

## Install

- SDカードのフォーマット
  - Debian, Ubuntu
    - ディスクユーティリティでディスク初期化
    - パーティションを初期化
  - Windows
    - SD Card Formatterを使用
- Raspbianのダウンロード  
  <http://ftp.jaist.ac.jp/pub/raspberrypi/raspbian_lite/images/>  
  <http://ftp.jaist.ac.jp/pub/raspberrypi/raspbian/images/>
- ダウンロードしたファイルをSDカードに書き込み  
  - Debian, Ubuntu

    ```sh
    # SDカード形式の確認(FAT32になっていること)
    sudo parted -l
    # SDカードのアンマウント
    umount /dev/xxx
    # アンマウントの確認
    df -h
    # SDカードへの書き込み
    sudo dd if=yyyy-mm-dd-raspbian-xxxxxxxx.img of=/dev/xxx bs=1M

    # [補足]
    # SDカードをイメージ化する場合
    # gpartedのインストール
    sudo apt install gparted
    # gparted起動
    sudo gparted # SDカードのリサイズを行う
    # サイズの計算
    sudo fdisk /dev/xxx
    # コマンド:p
    # イメージファイルへの書き込み
    sudo dd if=/dev/xxx of=/home/pi/yyyy-mm-dd-raspbian-raven.img bs=[セクタサイズ] count=[サイズ+1]
    ```

    > 上記手順で作成したイメージファイルをSDカードに再書き込みする場合、  
    > raspi-configで[7 Advanced Options]-[A1 Expand Filesystem]を実行すること。
  - Windows
    - Win32DiskImagerを使用

インストール完了後...

- 固定IPアドレスの設定
  - /etc/dhcpcd.confの編集  
    設定ファイルの末尾に以下を追加

    ```conf:/etc.dhcpcd.conf
    interface eth0
    static ip_address=xxx.xxx.xxx.xxx/xx
    static routers=xxx.xxx.xxx.xxx
    static domain_name_servers=xxx.xxx.xxx.xxx xxx.xxx.xxx.xxx
    ```

- SSHの有効化  
  以下のどちらかの方法で有効化

  1. raspi-configから有効化

     ```sh
     sudo raspi-config
     ```

     [5 Interfacing Options]-[P2 SSH]から有効化

  2. 「/boot/ssh」ファイルを作成  
     エクスプローラーからSDカードのbootフォルダに直接作成

- raspi-configを使用した設定

  ```sh
  sudo raspi-config
  ```

  - ロケール/タイムゾーン/キーボードレイアウト変更  
    [4 Localisation Options]-[I1 Change Locale]
    1. [ja_JP.UTF-8 UTF-8]を追加で選択する
    2. Default localeとして[ja_JP.UTF-8]を選択する

    [4 Localisation Options]-[I2 Change Timezone]
    - [Asia]-[Tokyo]を選択する

    [4 Localisation Options]-[I3 Change Keyboard Layout]
    1. [Generic 105-key (Intl) PC]を選択する
    2. [Other]を選択する
    3. [English (US)]を選択する
    4. [English (US)]を選択する
    5. その後の設定は全てデフォルト値を選択する

    [4 Localisation Options]-[I4 Change Wi-fi Country]
    - [JP Japan]を選択する

  - ホスト名の変更  
    [2 Network Options]-[N1 Hostname]から変更
  - piユーザのパスワード変更  
    [1 Change User Password]から変更

  最後に再起動  
  `sudo reboot`

- パッケージの更新

  ```sh
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
  # 必要に応じて実行する
  sudo apt dist-upgrade -y
  ```

- fcitx-mozcのインストール

  ```sh
  sudo apt install -y fcitx-mozc
  ```

  - fcitxの[設定]-[全体の設定]-[拡張オプションの表示]  
    入力メソッドのオンオフ：(使用する環境に合わせて任意に設定)  
    入力メソッドをオンに：(使用する環境に合わせて任意に設定)  
    入力メソッドをオフに：(使用する環境に合わせて任意に設定)
  - 最後に再起動  
    `sudo reboot`

- Raspberry Piの設定
  - 自動ログイン  
    現在のユーザとしてログインする：オン⇒オフ
  - 解像度  
    解像度を設定：Default⇒DMT mode 82 1920x1080 60Hz 16:9
  - 最後に再起動  
    `sudo reboot`

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

- リモートデスクトップ接続の準備

  ```sh
  sudo apt install -y tightvncserver
  sudo apt install -y xrdp
  ```

- [参考]ステルスSSIDへの接続  
  <http://frontier-of-curiosity.org/2016/04/03/raspberry-pi%E3%82%92%E5%AE%B6%E3%81%AEwifi%E3%81%AB%E6%8E%A5%E7%B6%9A%E3%81%99%E3%82%8B/>