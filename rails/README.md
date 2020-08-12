# rails

Tips for **Ruby on Rails** settings.

## Install

- Debian, Ubuntu

  ```sh
  # Railsに必要なパッケージのインストール
  sudo apt install -y libsqlite3-dev
  # (libpq-devはPostgreSQLを使用しないのであれば不要)
  sudo apt install -y libpq-dev
  # (nodejsはnvmで別途インストール済みであれば不要)
  sudo apt install -y nodejs

  # 事前にrbenvを使用してRubyのセットアップを行う
  # Rubyが参照しているgemのパスを念の為確認
  gem env home
  # 以下、Railsをローカルインストールする手順を記す
  # Bundlerのインストール
  gem install bundler
  # インストールされたことを確認
  gem list
  gem which bundler

  # Railsプロジェクトの作成(ローカルインストール)
  # Railsプロジェクト用のディレクトリを作成しGemfileを用意
  mkdir expmple && cd $_
  bundle init
  vi Gemfile # gem "rails"をアンコメントする
  ```

  ```Gemfile
  # frozen_string_literal: true

  source "https://rubygems.org"

  git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

  gem "rails"
  ```

  ```sh
  # Railsをvender/bundleディレクトリ以下にインストール
  bundle install --path vendor/bundle
  # インストールしたgemを確認
  bundle list
  # Railsでプロジェクトを作成
  # ([options]は適宜調整すること)
  bundle exec rails new . [options]
  # Gemfileは上書きする
  Overwrite /home/miyamoto/Develop/example/Gemfile? (enter "h" for help) [Ynaqdhm] y

  # Gitの管理対象からvendor/bundleディレクトリを外す
  echo '/vendor/bundle' >> .gitignore
  # Railsプロジェクトの起動
  bin/rails server
  ```
