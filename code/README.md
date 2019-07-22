# code

Tips for **Visual Studio Code** settings.

## Install

- Windows
  - <https://code.visualstudio.com/Download>からWindowsパッケージ(User Installer)をダウンロード

- Debian, Ubuntu
  - <https://code.visualstudio.com/Download>からdebパッケージをダウンロード

    ```sh
    cd (debパッケージダウンロード先)
    sudo apt install ./filename.deb
    ```

## Setting

- 拡張機能のインストール
  - Settings Sync

- global .gitignoreの設定
  - `.vscode`ディレクトリを常に除外するよう設定

    ```config:~/.config/git/ignore
      .
      .
    /.vscode/
      .
      .
    ```
