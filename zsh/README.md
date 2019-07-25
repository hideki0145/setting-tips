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

- `~/.zpreztorc`の修正

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
    # ----- ここから追加 ----- #
    'git' \
    'ruby' \
    'rails' \
    'syntax-highlighting' \
    'history-substring-search' \
    'autosuggestions' \
    # ----- ここまで追加 ----- #
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
  #
  # Utility
  #

  # Enabled safe options. This aliases cp, ln, mv and rm so that they prompt
  # before deleting or overwriting files. Set to 'no' to disable this safer
  # behavior.
  zstyle ':prezto:module:utility' safe-ops 'no'
  ```

- `~/.zshrc`の修正

  ```config:~/.zshrc
    .
    .
  # Customize to your needs...
  export EDITOR='vim'
  export VISUAL='vim'
    .
    .
  ```
