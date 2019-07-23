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

- SSH Agentの設定
  > Remote Development拡張機能を使用する際に必要
  > <https://code.visualstudio.com/docs/remote/troubleshooting#_setting-up-the-ssh-agent>

  ```PowerShell
  # Make sure you're running as an Administrator
  Set-Service ssh-agent -StartupType Automatic
  Start-Service ssh-agent
  Get-Service ssh-agent
  ```
