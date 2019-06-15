# code

Tips for **Visual Studio Code** settings.

## Install

- Windows
  - <https://code.visualstudio.com/Download>からWindowsパッケージ(User Installer)をダウンロード

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
