# Ubuntu 20.04 LTS Live Server 設定

## Install

- インストールウィザードの内容に沿ってセットアップ

1. Install Ubuntu Server
2. Select a language
   - English
3. Keyboard configuration
   - Layout
     - (使用する環境に合わせて任意に設定)
   - Variant
     - (使用する環境に合わせて任意に設定)
4. Network connections
   - Done
5. Configure proxy
   - Done
6. Configure Ubuntu archive mirror
   - Mirror address
     - `http://jp.archive.ubuntu.com/ubuntu`
7. Guided storage configuration
   - Use an entire disk
     - Set up this disk as an LVM group
       - [X] ⇒ [ ]
8. Storage configuration
   - Done
9. Confirm destructive action
   - Continue
10. Profile setup
    - Your name
      - (使用する環境に合わせて任意に設定)
    - Your server's name
      - (使用する環境に合わせて任意に設定)
    - Pick a username
      - (使用する環境に合わせて任意に設定)
    - Choose a password
      - (使用する環境に合わせて任意に設定)
    - Confirm your password
      - (使用する環境に合わせて任意に設定)
11. SSH Setup
    - Done
12. Featured Server Snaps
    - Done
13. Install complete!
    - Reboot Now

セットアップ完了後...

- ネットワークの設定

  ```sh
  sudo vi /etc/netplan/00-installer-config.yaml
  ```

  ```yml:/etc/netplan/00-installer-config.yaml
  # This is the network config written by 'subiquity'
  network:
    ethernets:
      eth0:
        dhcp4: false
        addresses: [xxx.xxx.xxx.xxx/xx]
        gateway4: xxx.xxx.xxx.xxx
        nameservers:
          addresses: [xxx.xxx.xxx.xxx]
    version: 2
  ```

  ```sh
  sudo netplan apply
  ```

- システムの更新

  ```sh
  sudo apt update && sudo apt upgrade -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
  ```

- 一旦再起動

  ```sh
  sudo reboot
  ```

## Setting

- OpenSSH Serverのインストール

  ```sh
  sudo apt install -y openssh-server
  sudo vi /etc/ssh/sshd_config
  ```

  ```config:/etc/ssh/sshd_config
    .
    .
  # アンコメントする
  AuthorizedKeysFile     .ssh/authorized_keys .ssh/authorized_keys2
    .
    .
  ```

  ```sh
  # SSHサービス再起動
  sudo systemctl restart ssh.service
  exit
  # 以降、SSHパスワード認証にて作業
  ```

- 公開鍵の転送

  ```sh
  # Ubuntu側操作
  mkdir ~/.ssh && chmod 700 ~/.ssh
  # クライアントOS側操作
  scp -P 22 ~/.ssh/* username@xxx.xxx.xxx.xxx:~/.ssh
  # Ubuntu側操作
  chmod 644 ~/.ssh/config
  chmod 600 ~/.ssh/id*
  cp ~/.ssh/id_rsa_filename.pub ~/.ssh/authorized_keys
  exit
  # 以降、SSH公開鍵認証にて作業
  ```

- 日本語化(使用する環境に合わせて任意に設定)

  ```sh
  sudo apt install -y language-pack-ja
  sudo update-locale LANG=ja_JP.UTF-8
  # 一旦閉じる
  exit
  # ロケールの確認
  locale
  sudo apt install -y manpages-ja manpages-ja-dev
  ```
