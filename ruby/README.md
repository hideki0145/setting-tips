# ruby

Tips for **Ruby** settings.

## Install

- Debian, Ubuntu

  ```sh
  # rbenvのインストール(https://github.com/rbenv/rbenv)
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  # ruby-buildのインストール(https://github.com/rbenv/ruby-build)
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

  # シェルの設定
  # [bashの場合]
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  # [zshの場合]
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  # 以下のコマンドで印刷された指示に従って設定
  ~/.rbenv/bin/rbenv init
  # 以下は一例
  # [bashの場合]
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  # [zshの場合]
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc

  # シェルを再読み込み
  source ~/.bashrc # or ~/.zshrc
  # rbenv-doctorでrbenv動作検証
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

  # インストールできるRubyバージョンの確認
  rbenv install --list
  # 推奨されるビルド環境の構築(https://github.com/rbenv/ruby-build/wiki)
  sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
  # 任意のバージョンをインストール
  rbenv install x.x.x
  # インストールできたことを確認
  rbenv versions
  # rbenvで使用するRubyバージョンの設定
  rbenv global x.x.x
  ruby -v
  ```
