# zsh

Tips for **Z Shell** settings.

## Install

- Debian, Ubuntu

  ```sh
  # zshのインストール
  sudo apt install -y zsh
  # zsh動作検証
  zsh --version
  # 一旦閉じる
  exit

  # Preztoのインストール(https://github.com/sorin-ionescu/prezto#installation)
  # zsh起動
  zsh
  # zsh-newuser-installはqを選択する
  --- Type one of the keys in parentheses --- q
  # zsh関連ファイルを削除
  rm .zcompdump
  # インストール
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
  setopt EXTENDED_GLOB
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done
  # zshをデフォルトのシェルとして設定
  chsh -s $(which zsh)
  # 閉じて開き直す
  exit

  # アップデート
  cd $ZPREZTODIR && git pull && git submodule update --init --recursive
  ```

## Setting

- `~/.zpreztorc`の設定
- `~/.zshrc`の設定
