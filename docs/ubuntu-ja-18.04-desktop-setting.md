# Ubuntu 18.04 LTS Desktop 日本語 Remix 設定

## インストール

- インストールウィザードの内容に沿ってセットアップ

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
  sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade && sudo apt -y autoremove && sudo apt -y autoclean
  ```

- fcitx-mozcのインストール

  ```sh
  sudo apt install fcitx-mozc -y
  ```

  - fcitxの[設定]-[全体の設定]-[Show Advanced Options]  
    入力メソッドをオンに：(使用する環境に合わせて任意に設定)  
    入力メソッドをオフに：(使用する環境に合わせて任意に設定)

- [地域と言語]-[インストールされている言語の管理]  
  キーボード入力に使うIMシステム：IBus⇒fcitx
- [電源]-[省電力]  
  ブランクスクリーン：5分⇒(使用する環境に合わせて任意に設定)
- [デバイス]-[マウスとタッチパッド]-[タッチパッド]  
  ナチュラルスクロール：オン⇒(使用する環境に合わせて任意に設定)  
  エッジスクロール：オフ⇒(使用する環境に合わせて任意に設定)

## 標準的な開発環境構築

- Vimのインストール

  ```sh
  sudo apt install vim -y
  ```

- Gitのインストール

  ```sh
  sudo apt install git -y
  git config --global user.name "User Name"
  git config --global user.email "username@example.com"
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

- VSCodeのインストール
  - <https://code.visualstudio.com/Download>からdebパッケージをダウンロード

  ```sh
  cd (debパッケージダウンロード先)

  # パッケージが足りない場合は適宜インストール
  # 以下は例
  sudo apt install libgconf-2-4 -y
  sudo apt --fix-broken install

  sudo dpkg -i filename.deb
  ```

  - VSCodeの設定
    - `~/.config/Code/User/settings.json`の設定
    - 拡張機能のインストール
      - Japanese Language Pack for Visual Studio Code