# Ubuntu 18.04 LTS Desktop 日本語 Remix 設定

## Install

- インストールウィザードの内容に沿ってセットアップ
  - キーボードレイアウト  
    日本語-日本語⇒(使用する環境に合わせて任意に設定)
    > インストールウィザード上で設定できなかった場合、以下のコマンドで設定する

    `sudo dpkg-reconfigure keyboard-configuration`

  - アップデートと他のソフトウェア  
    あらかじめどのアプリケーションをインストールしますか?：最小インストール  
    グラフィックスとWi-Fiハードウェアと追加の…：チェックなし

セットアップ完了後...

- お気に入りの追加/削除
  - 端末追加
  - Ubuntuソフトウェア削除
  - ヘルプ削除
- ネットワークの設定

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

- 不完全な言語サポートの実行
- ホームディレクトリの英語化

  ```sh
  LANG=C xdg-user-dirs-gtk-update
  # 表示されるダイアログ上で
  # [*]Don't ask me this again としてから
  # [Update Names]を押下

  # 元に戻す場合は以下のコマンドを実行
  xdg-user-dirs-update --force
  ```

- システムの更新

  ```sh
  sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
  # 必要に応じて実行する
  sudo apt dist-upgrade -y
  ```

- fcitx-mozcのインストール

  ```sh
  sudo apt install -y fcitx-mozc
  ```

  - fcitxの[設定]-[全体の設定]-[Show Advanced Options]  
    入力メソッドのオンオフ：(使用する環境に合わせて任意に設定)  
    入力メソッドをオンに：(使用する環境に合わせて任意に設定)  
    入力メソッドをオフに：(使用する環境に合わせて任意に設定)
  - fcitxの[設定]-[アドオン]-[Clipboard]-[設定]  
    クリップボード履歴リストのトリガーキー：Ctrl+;⇒(使用する環境に合わせて任意に設定)

- [Dock]  
  アイコンのサイズ：48⇒(使用する環境に合わせて任意に設定)  
  表示位置：Left⇒(使用する環境に合わせて任意に設定)
- [地域と言語]-[入力ソース]  
  日本語 又は 英語(US)：登録済⇒(使用する環境に合わせて任意に設定)
- [地域と言語]-[インストールされている言語の管理]  
  キーボード入力に使うIMシステム：IBus⇒fcitx
- [電源]-[省電力]  
  ブランクスクリーン：5分⇒(使用する環境に合わせて任意に設定)
- [デバイス]-[マウスとタッチパッド]-[タッチパッド]  
  ナチュラルスクロール：オン⇒(使用する環境に合わせて任意に設定)  
  エッジスクロール：オフ⇒(使用する環境に合わせて任意に設定)

- 一旦再起動

  ```sh
  sudo reboot
  ```

- fcitxの[設定]-[入力メソッド]
  1. Keyboard - Japanese：(使用する環境に合わせて任意に設定)
  2. Keyboard - English(US)：(使用する環境に合わせて任意に設定)
  3. Mozc  
     既定のキーボードレイアウト：既定⇒(使用する環境に合わせて任意に設定)

## Setting

- Vimのインストール

  ```sh
  # CLI版
  sudo apt install -y vim
  # GUI版
  sudo apt install -y vim-gnome
  ```

- Gitのインストール

  ```sh
  sudo apt install -y git
  # 基本設定
  git config --global user.name "User Name"
  git config --global user.email "username@example.com"
  git config --global color.ui auto
  git config --global core.editor "code --wait"
  # global .gitignore設定
  vi ~/.config/git/ignore
  ```

  ```config:~/.config/git/ignore
  /.vscode/
  .solargraph.yml
  ```

  ```sh
  # deffツール設定
  sudo apt install -y meld
  vi ~/.gitconfig
  ```

  ```config:~/.gitconfig
  [diff]
    tool = meld
  [difftool "meld"]
    cmd = meld $LOCAL $REMOTE
  [merge]
    tool = meld
  [mergetool "meld"]
    cmd = meld $LOCAL $BASE $REMOTE --auto-merge
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
  sudo systemctl restart ssh
  ```
