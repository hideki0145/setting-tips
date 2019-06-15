# vim

Tips for **Vim** settings.

## Install

- Debian, Ubuntu

  ```sh
  # CLI版
  sudo apt install -y vim
  # GUI版
  sudo apt install -y vim-gnome
  ```

## Setting

- Debian, Ubuntu
  - `~/.vimrc`の設定
  - vim-plugのセットアップ

    ```sh
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

    ```vim
    " プラグインのインストール
    :PlugInstall
    " プラグインのアップデート
    :PlugUpdate PluginName
    " プラグインのアンインストール
    :PlugClean
    ```
