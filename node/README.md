# node

Tips for **Node.js** settings.

## Install

- Debian, Ubuntu

  ```sh
  # nodenvのインストール(https://github.com/nodenv/nodenv)
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  # node-buildのインストール(https://github.com/nodenv/node-build)
  git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build

  # シェルの設定
  # [bashの場合]
  echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
  # [zshの場合]
  echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
  # 以下のコマンドで印刷された指示に従って設定
  ~/.nodenv/bin/nodenv init
  # 以下は一例
  # [bashの場合]
  echo 'eval "$(nodenv init -)"' >> ~/.bashrc
  # [zshの場合]
  echo 'eval "$(nodenv init -)"' >> ~/.zshrc

  # シェルを再読み込み
  source ~/.bashrc # or ~/.zshrc
  # nodenv-doctorでnodenv動作検証
  curl -fsSL https://github.com/nodenv/nodenv-installer/raw/master/bin/nodenv-doctor | bash

  # インストールできるNode.jsバージョンの確認
  nodenv install --list
  # 任意のバージョンをインストール
  nodenv install x.x.x
  # インストールできたことを確認
  nodenv versions
  # nodenvで使用するNode.jsバージョンの設定
  nodenv global x.x.x
  node -v

  # yarnのインストール(https://yarnpkg.com/ja/docs/install#debian-stable)
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update
  sudo apt install --no-install-recommends yarn
  # yarn動作検証
  yarn --version
  ```
