# code

Tips for **Visual Studio Code** settings.

## Install

- Debian, Ubuntu
  - <https://code.visualstudio.com/Download>からdebパッケージをダウンロード

  ```sh
  cd (debパッケージダウンロード先)

  # パッケージが足りない場合は適宜インストール
  # 以下は例
  # sudo apt install libgconf-2-4 -y
  # sudo apt --fix-broken install

  sudo dpkg -i filename.deb
  ```

## Setting

- Debian, Ubuntu
  - `~/.config/Code/User/settings.json`の設定

- 拡張機能のインストール
  - Japanese Language Pack for Visual Studio Code
  - markdownlint
  - Python
  - Ruby
- global .gitignoreの設定
  - `.vscode`ディレクトリを常に除外するよう設定

  ```config:~/.config/git/ignore
    .
    .
  /.vscode/
    .
    .
  ```