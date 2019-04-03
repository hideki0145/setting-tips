# rails

Tips for **Ruby on Rails** settings.

## Install

- Debian, Ubuntu

  ```sh
  # Railsに必要なパッケージのインストール
  sudo apt install -y libsqlite3-dev nodejs

  # 事前にrbenvを使用してRubyのセットアップを行う
  # Rubyが参照しているgemのパスを念の為確認
  gem env home
  # 以下、Railsをローカルインストールする手順を記す
  # Bundlerのインストール
  gem install bundler
  # インストールされたことを確認
  gem list
  gem which bundler

  # RailsのローカルインストールとRailsプロジェクトの作成
  # (新規Railsプロジェクトを作るときは常に行う)
  # Railsプロジェクトを作りたいディレクトリに移動しGemfileを作成
  cd xxx
  vi Gemfile # bundle initでも可
  ```

  ```Gemfile
  source 'https://rubygems.org'
  
  gem 'rails'
  ```

  ```sh
  # Railsをvender/bundleディレクトリ以下にインストール
  bundle install --path vendor/bundle
  # インストールしたgemを確認
  bundle list
  # Railsでプロジェクトを作成
  #--skip-bundleを忘れないように
  bundle exec rails new example --skip-bundle
  # Railsプロジェクトを作成する為に使用したbundlerとRailsの環境を削除
  rm -f Gemfile
  rm -f Gemfile.lock
  rm -rf .bundle
  rm -rf vendor

  # 作成したRailsプロジェクトのディレクトリに移動し、Railsとgemをvender/bundleディレクトリ以下にインストール
  cd example
  bundle install --path vendor/bundle
  # Gitの管理対象からvendor/bundleディレクトリを外す
  echo '/vendor/bundle' >> .gitignore
  # Railsプロジェクトの起動
  bundle exec rails server
  ```