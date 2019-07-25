# zsh

Tips for **Z Shell** settings.

## Install

- Debian, Ubuntu

  ```sh
  # zshのインストール
  sudo apt install -y zsh
  # zsh動作検証
  zsh --version
  exit # 一旦閉じる

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
  exit # 閉じて開き直す

  # アップデート
  cd $ZPREZTODIR && git pull && git submodule update --init --recursive
  ```

## Setting

- ~/.zpreztorcの修正

  ```config:~/.zpreztorc
    .
    .
  # Set the Prezto modules to load (browse modules).
  # The order matters.
  zstyle ':prezto:load' pmodule \
    'environment' \
    'terminal' \
    'editor' \
    'history' \
    'directory' \
    'spectrum' \
    'utility' \
    'completion' \
    'git' \ # 追加
    'ruby' \ # 追加
    'rails' \ # 追加
    'syntax-highlighting' \ # 追加
    'history-substring-search' \ # 追加
    'autosuggestions' \ # 追加
    'prompt'
    .
    .
  #
  # Editor
  #

  # Set the key mapping style to 'emacs' or 'vi'.
  zstyle ':prezto:module:editor' key-bindings 'vi'
    .
    .
  #
  # Prompt
  #

  # Set the prompt theme to load.
  # Setting it to 'random' loads a random theme.
  # Auto set to 'off' on dumb terminals.
  zstyle ':prezto:module:prompt' theme 'pure'
    .
    .
  ```
