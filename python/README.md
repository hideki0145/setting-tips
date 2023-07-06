# python

Tips for **Python** settings.

## Install

- Debian, Ubuntu

  ```sh
  # pyenvのインストール(https://github.com/pyenv/pyenv)
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv

  # シェルの設定
  # [bashの場合]
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
  # [zshの場合]
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
  # 以下のコマンドで印刷された指示に従って設定
  ~/.pyenv/bin/pyenv init
  # 以下は一例
  # [bashの場合]
  echo 'eval "$(pyenv init -)"' >> ~/.bashrc
  # [zshの場合]
  echo 'eval "$(pyenv init -)"' >> ~/.zshrc

  # シェルを再読み込み
  source ~/.bashrc # or ~/.zshrc
  # pyenv動作検証
  pyenv --version

  # インストールできるPythonバージョンの確認
  pyenv install --list
  # 推奨されるビルド環境の構築(https://github.com/pyenv/pyenv/wiki)
  # If you are going build PyPy from source or install other Python flavors that require CLang, also install llvm.
  sudo apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
  # 任意のバージョンをインストール
  pyenv install x.x.x
  # インストールできたことを確認
  pyenv versions
  # pyenvで使用するPythonバージョンの設定
  pyenv global x.x.x
  python -v
  ```
