# Ubuntu 18.04 LTS Desktop 日本語 Remix 設定

## Install

- インストールウィザードの内容に沿ってセットアップ
  - キーボードレイアウト
    - 日本語-日本語⇒(使用する環境に合わせて任意に設定)
      > インストールウィザード上で設定できなかった場合、以下のコマンドで設定する

      `sudo dpkg-reconfigure keyboard-configuration`

  - アップデートと他のソフトウェア
    - あらかじめどのアプリケーションをインストールしますか?：最小インストール
    - グラフィックスとWi-Fiハードウェアと追加の…：チェックなし

セットアップ完了後...

- お気に入りの追加/削除
  - 端末追加
  - Ubuntuソフトウェア削除
  - ヘルプ削除
- ネットワークの設定

  ```sh
  sudo vi /etc/netplan/01-network-manager-all.yaml
  ```

  ```yml:/etc/netplan/01-network-manager-all.yaml
  # Let NetworkManager manage all devices on this system
  network:
    version: 2
    renderer: NetworkManager

    ethernets:
      eth0:
        dhcp4: false
        addresses: [xxx.xxx.xxx.xxx/xx]
        gateway4: xxx.xxx.xxx.xxx
        nameservers:
          addresses: [xxx.xxx.xxx.xxx]
  ```

  ```sh
  sudo netplan apply
  ```

- 不完全な言語サポートの実行

  ```sh
  # 不完全な言語サポートを実行する前に以下を実行
  $ sudo apt update
  ```

- ホームディレクトリの英語化

  ```sh
  LANG=C xdg-user-dirs-gtk-update
  # 表示されるダイアログ上で
  # [*]Don't ask me this again としてから
  # [Update Names]を押下

  # 元に戻す場合は以下のコマンドを実行
  xdg-user-dirs-update --force
  ```

- linux-azureのインストール(Hyper-Vの場合)

  > <https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/supported-ubuntu-virtual-machines-on-hyper-v>

  ```sh
  sudo apt update
  sudo apt install -y linux-azure
  ```

- linux-vm-toolsのインストール(Hyper-Vの場合)

  ```sh
  cd
  wget https://raw.githubusercontent.com/microsoft/linux-vm-tools/master/ubuntu/18.04/install.sh
  sudo chmod +x install.sh
  sudo ./install.sh
  sudo reboot

  cd
  sudo ./install.sh
  sudo apt install -y xorg-video-abi-23 xserver-xorg-core
  sudo apt install -y xorgxrdp
  sudo shutdown now
  ```

  ```powershell
  Set-VM -VMName <your_vm_name> -EnhancedSessionTransportType HvSocket
  ```

- システムの更新

  ```sh
  sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
  ```

- fcitx-mozcのインストール(使用する環境に合わせて任意に設定)

  ```sh
  sudo apt install -y fcitx-mozc
  ```

  - fcitxの[設定]-[全体の設定]-[Show Advanced Options]
    - 入力メソッドのオンオフ：(使用する環境に合わせて任意に設定)
    - 入力メソッドをオンに：(使用する環境に合わせて任意に設定)
    - 入力メソッドをオフに：(使用する環境に合わせて任意に設定)
  - fcitxの[設定]-[アドオン]-[Clipboard]-[設定]
    - クリップボード履歴リストのトリガーキー：Ctrl+;⇒(使用する環境に合わせて任意に設定)

- [Dock]
  - アイコンのサイズ：48⇒(使用する環境に合わせて任意に設定)
  - 表示位置：Left⇒(使用する環境に合わせて任意に設定)
- [地域と言語]-[入力ソース]
  - 日本語 又は 英語(US)：登録済⇒(使用する環境に合わせて任意に設定)
- [地域と言語]-[インストールされている言語の管理]
  - キーボード入力に使うIMシステム：IBus⇒fcitx
- [電源]-[省電力]
  - ブランクスクリーン：5分⇒(使用する環境に合わせて任意に設定)
- [デバイス]-[マウスとタッチパッド]-[タッチパッド]
  - ナチュラルスクロール：オン⇒(使用する環境に合わせて任意に設定)
  - エッジスクロール：オフ⇒(使用する環境に合わせて任意に設定)

- 一旦再起動

  ```sh
  sudo reboot
  ```

- fcitxの[設定]-[入力メソッド]
  1. Keyboard - Japanese：(使用する環境に合わせて任意に設定)
  2. Keyboard - English(US)：(使用する環境に合わせて任意に設定)
  3. Mozc - 既定のキーボードレイアウト：既定⇒(使用する環境に合わせて任意に設定)

- [ソフトウェアとアップデート]-[アップデート]
  - アップデートの自動確認：毎日⇒なし

## Setting

- OpenSSH Serverのインストール

  ```sh
  sudo apt install -y openssh-server
  sudo vi /etc/ssh/sshd_config
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
  sudo systemctl restart ssh
  exit
  # 以降、SSHパスワード認証にて作業
  ```

- 鍵の転送

  ```sh
  # Ubuntu側操作
  mkdir ~/.ssh && chmod 700 ~/.ssh
  # クライアントOS側操作
  scp -P 22 ~/.ssh/* username@xxx.xxx.xxx.xxx:~/.ssh
  # Ubuntu側操作
  chmod 644 ~/.ssh/config
  chmod 600 ~/.ssh/id*
  cp ~/.ssh/id_rsa_filename.pub ~/.ssh/authorized_keys
  exit
  # 以降、SSH公開鍵認証にて作業
  ```

- 日本語化(使用する環境に合わせて任意に設定)

  ```sh
  # 日本国内のリポジトリを参照
  sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
  sudo apt install -y language-pack-ja
  sudo update-locale LANG=ja_JP.UTF-8
  exit # 一旦閉じる
  locale # ロケールの確認
  sudo apt install -y manpages-ja manpages-ja-dev
  ```
