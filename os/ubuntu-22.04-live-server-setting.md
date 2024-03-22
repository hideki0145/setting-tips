# Ubuntu 22.04 LTS Live Server 設定

## Install

- インストールウィザードの内容に沿ってセットアップ

1. Try on Install Ubuntu Server
2. Select a language
   - English
3. Keyboard configuration
   - Layout
     - (使用する環境に合わせて任意に設定)
   - Variant
     - (使用する環境に合わせて任意に設定)
4. Choose type of install
   - Ubuntu Server
5. Network connections
   - (使用する環境に合わせて任意に設定)
6. Configure proxy
   - Done
7. Configure Ubuntu archive mirror
   - Mirror address
     - `http://jp.archive.ubuntu.com/ubuntu`
8. Installer update available
   - Update to the new installer
9. Guided storage configuration
   - Use an entire disk
     - Set up this disk as an LVM group
       - [X] ⇒ [ ]
10. Storage configuration
    - Done
11. Confirm destructive action
    - Continue
12. Profile setup
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
13. SSH Setup
    - Done
14. Featured Server Snaps
    - Done
15. Install complete!
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
        addresses:
          - xxx.xxx.xxx.xxx/xx
        routes:
          - to: default
            via: xxx.xxx.xxx.xxx
        nameservers:
          addresses:
            - xxx.xxx.xxx.xxx
          search: []
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

  # タイムゾーンの設定
  sudo timedatectl set-timezone Asia/Tokyo
  ```

- needrestartの設定(使用する環境に合わせて任意に設定)

  ```sh
  echo "\$nrconf{restart} = 'a';" | sudo tee /etc/needrestart/conf.d/50-local.conf
  ```

- UnattendedUpgradesの設定(使用する環境に合わせて任意に設定)

  ```sh
  sudo vi /etc/apt/apt.conf.d/50unattended-upgrades
  ```

  ```config:/etc/apt/apt.conf.d/50unattended-upgrades
    .
    .
  //Unattended-Upgrade::Mail "";
  Unattended-Upgrade::Mail "username@example.com";
    .
    .
  //Unattended-Upgrade::Automatic-Reboot "false";
  Unattended-Upgrade::Automatic-Reboot "true";
    .
    .
  //Unattended-Upgrade::Automatic-Reboot-Time "02:00";
  Unattended-Upgrade::Automatic-Reboot-Time "02:30";
    .
    .
  ```
