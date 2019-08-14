# anyenv

Tips for **anyenv** settings.

## Install

- Debian, Ubuntu

  ```sh
  # anyenvのインストール(https://github.com/anyenv/anyenv)
  git clone https://github.com/anyenv/anyenv ~/.anyenv

  # シェルの設定
  # [bashの場合]
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bashrc
  # [zshの場合]
  echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.zshrc
  # 以下のコマンドで印刷された指示に従って設定
  ~/.anyenv/bin/anyenv init
  # 以下は一例
  # [bashの場合]
  echo 'eval "$(anyenv init -)"' >> ~/.bashrc
  # [zshの場合]
  echo 'eval "$(anyenv init -)"' >> ~/.zshrc

  # シェルを再読み込み
  source ~/.bashrc # or ~/.zshrc
  # anyenvの初期化
  anyenv install --init
  # anyenv-updateのインストール(https://github.com/znz/anyenv-update)
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  # anyenv-gitのインストール(https://github.com/znz/anyenv-git)
  git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
  # 推奨されるrbenvビルド環境の構築(https://github.com/rbenv/ruby-build/wiki)
  sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev

  # インストールできる**envの確認
  anyenv install --list
  # 任意の**envをインストール
  anyenv install **env
  # インストールできたことを確認
  anyenv versions
  ```
