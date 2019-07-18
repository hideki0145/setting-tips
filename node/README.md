# node

Tips for **Node.js** settings.

## Install

- Debian, Ubuntu

  ```sh
  # nvmのインストール(https://github.com/nvm-sh/nvm)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
  # シェルを再読み込み
  source ~/.bashrc
  # nvm動作検証
  nvm --version

  # インストールできるNode.jsバージョンの確認
  nvm ls-remote
  nvm ls-remote --lts
  # 任意のバージョンをインストール
  nvm install x.x.x
  nvm install --lts
  # インストールできたことを確認
  nvm ls
  # rbenvで使用するRubyバージョンの設定
  rbenv use x.x.x
  node -v
  ```
