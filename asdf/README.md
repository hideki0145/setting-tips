# asdf

Tips for **asdf** settings.

## Install

- Debian, Ubuntu

  ```sh
  # 依存関係のインストール
  sudo apt install -y curl git
  # asdfのインストール(https://asdf-vm.com/#/core-manage-asdf?id=install)
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf
  cd ~/.asdf
  git checkout "$(git describe --abbrev=0 --tags)"

  # シェルの設定
  # [bashの場合]
  echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
  echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
  # [zshの場合]
  echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc
  echo '# append completions to fpath' >> ~/.zshrc
  echo 'fpath=(${ASDF_DIR}/completions $fpath)' >> ~/.zshrc
  echo '# initialise completions with ZSH''s compinit' >> ~/.zshrc
  echo 'autoload -Uz compinit' >> ~/.zshrc
  echo 'compinit' >> ~/.zshrc

  # シェルを再読み込み
  source ~/.bashrc # or ~/.zshrc
  # asdf動作検証
  asdf --version

  # 推奨されるrubyビルド環境の構築(https://github.com/rbenv/ruby-build/wiki)
  # Depending on your version of Ubuntu/Debian/Mint, libgdbm6 won't be available.
  # In that case, try an earlier version such as libgdbm5.
  sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
  # 推奨されるpythonビルド環境の構築(https://github.com/pyenv/pyenv/wiki)
  sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
  # Node.js plugin要件の構築(https://github.com/asdf-vm/asdf-nodejs)
  sudo apt install -y dirmngr gpg curl gawk

  # インストールできるpluginの確認
  asdf plugin list all
  # 任意のpluginをインストール
  asdf plugin add ***
  # インストールできたことを確認
  asdf plugin list
  ```
