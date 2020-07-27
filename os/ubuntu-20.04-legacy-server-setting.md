# Ubuntu 20.04 LTS Legacy Server 設定

## Install

- インストールウィザードの内容に沿ってセットアップ

1. Install Ubuntu Server
2. Select a language
   - English
3. Select your location
   - Asia/Japan
4. Configure locales
   - United States en_US.UTF-8
5. Configure the keyboard
   - No
   - (使用する環境に合わせて任意に設定)
6. Configure the network
   - Hostname
     - (使用する環境に合わせて任意に設定)
7. Set up users and passwords
   - Full name for the new user
     - (使用する環境に合わせて任意に設定)
   - Username for your account
     - (使用する環境に合わせて任意に設定)
   - Choose a password for the new user
     - (使用する環境に合わせて任意に設定)
   - Re-enter password to verify
     - (使用する環境に合わせて任意に設定)
8. Configure the clock
   - Asia/Tokyo
9. Partition disks
   - Guided - use entire disk
10. Configure the package manager
    - Continue
11. Configuring tasksel
    - (使用する環境に合わせて任意に設定)
12. Software selection
    - Continue
13. Finish the installation
    - Continue

セットアップ完了後...

- ネットワークの設定

  ```sh
  sudo vi /etc/netplan/01-netcfg.yaml
  ```

  ```yml:/etc/netplan/01-netcfg.yaml
  # This file describes the network interfaces available on your system
  # For more information, see netplan(5).
  network:
    version: 2
    renderer: networkd

    ethernets:
      eth0:
        dhcp4: false
        addresses: [xxx.xxx.xxx.xxx/xx]
        gateway4: xxx.xxx.xxx.xxx
        nameservers:
          addresses: [xxx.xxx.xxx.xxx]
  ```

  ```sh
  sudo netplan apply
  ```

- linux-azureのインストール(Hyper-Vの場合)

  > <https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/supported-ubuntu-virtual-machines-on-hyper-v>

  ```sh
  sudo apt update
  sudo apt install -y linux-azure
  ```

- システムの更新

  ```sh
  sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y
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
  sudo systemctl restart ssh
  exit
  # 以降、SSHパスワード認証にて作業
  ```

- 鍵の転送

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
  # 日本国内のリポジトリを参照
  sudo sed -i.bak -e "s/http:\/\/archive\.ubuntu\.com/http:\/\/jp\.archive\.ubuntu\.com/g" /etc/apt/sources.list
  sudo apt install -y language-pack-ja
  sudo update-locale LANG=ja_JP.UTF-8
  exit # 一旦閉じる
  locale # ロケールの確認
  sudo apt install -y manpages-ja manpages-ja-dev
  ```
