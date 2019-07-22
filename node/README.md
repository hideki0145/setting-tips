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
  # nvmで使用するNode.jsバージョンの設定
  nvm use x.x.x
  node -v
  
  # yarnのインストール(https://yarnpkg.com/ja/docs/install#debian-stable)
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
  sudo apt install --no-install-recommends yarn
  # yarn動作検証
  yarn --version
  ```
