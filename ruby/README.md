# ruby

Tips for **Ruby** settings.

## Install

- Debian, Ubuntu

  ```sh
  # rbenv/ruby-buildのインストール
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  # .bashrcの修正
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  # シェルを再読み込み
  source ~/.bashrc
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