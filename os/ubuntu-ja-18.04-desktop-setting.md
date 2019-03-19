# Ubuntu 18.04 LTS Desktop 日本語 Remix 設定

## Install

- インストールウィザードの内容に沿ってセットアップ
  - アップデートと他のソフトウェア  
    あらかじめどのアプリケーションをインストールしますか?：最小インストール  
    グラフィックスとWi-Fiハードウェアと追加の…：チェックなし

セットアップ完了後...

- お気に入りの追加/削除
  - 端末追加
  - Ubuntuソフトウェア削除
  - ヘルプ削除
- ネットワークの設定
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
- [地域と言語]-[インストールされている言語の管理]  
  キーボード入力に使うIMシステム：IBus⇒fcitx
- [電源]-[省電力]  
  ブランクスクリーン：5分⇒(使用する環境に合わせて任意に設定)
- [デバイス]-[マウスとタッチパッド]-[タッチパッド]  
  ナチュラルスクロール：オン⇒(使用する環境に合わせて任意に設定)  
  エッジスクロール：オフ⇒(使用する環境に合わせて任意に設定)

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