# genie

Tips for **genie** settings.

## Install

- Debian, Ubuntu

  ```sh
  # wsl-transdebianのセットアップ(https://arkane-systems.github.io/wsl-transdebian/)
  sudo wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg
  sudo chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg
  echo "deb https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/wsl-transdebian.list > /dev/null
  echo "deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/wsl-transdebian.list > /dev/null

  # genieのインストール(https://github.com/arkane-systems/genie)
  sudo apt update
  sudo apt install -y systemd-genie
  # 設定ファイルの修正
  sudo sed -i -e "s/systemd-timeout=.*/systemd-timeout=30/g" /etc/genie.ini
  # genie動作検証
  genie -s

  # 警告の対処(https://github.com/arkane-systems/genie/wiki/WSLg-FAQ)
  sudo systemctl set-default multi-user.target
  # エラーの対処(https://github.com/arkane-systems/genie/wiki/Systemd-units-known-to-be-problematic-under-WSL)
  sudo ssh-keygen -A
  sudo e2label $(df / | awk '/\//{print $1}') cloudimg-rootfs
  sudo systemctl disable multipathd.service
  echo '#!/bin/sh' | sudo tee /etc/rc.local > /dev/null
  echo 'ls /proc/sys/fs/binfmt_misc > /dev/null 2>&1 || mount -t binfmt_misc binfmt_misc /proc/sys/fs/binfmt_misc' | sudo tee -a /etc/rc.local > /dev/null
  sudo chmod +x /etc/rc.local

  # シェルの設定
  # [bashの場合]
  echo '# Are we in the bottle?' >> ~/.bashrc && \
  echo 'if [[ ! -v INSIDE_GENIE ]]; then' >> ~/.bashrc && \
  echo '  read -t 3 -p "* Preparing to enter genie bottle (in 3s); abort? " yn' >> ~/.bashrc && \
  echo '  echo' >> ~/.bashrc && \
  echo '' >> ~/.bashrc && \
  echo '  if [[ $yn != "y" ]]; then' >> ~/.bashrc && \
  echo '    echo "Starting genie:"' >> ~/.bashrc && \
  echo '    exec /usr/bin/genie -c "bash"' >> ~/.bashrc && \
  echo '  fi' >> ~/.bashrc && \
  echo 'fi' >> ~/.bashrc
  # [zshの場合]
  echo '# Are we in the bottle?' >> ~/.zshrc && \
  echo 'if [[ ! -v INSIDE_GENIE ]]; then' >> ~/.zshrc && \
  echo '  read -t 3 -q "yn? * Preparing to enter genie bottle (in 3s); abort? "' >> ~/.zshrc && \
  echo '  echo' >> ~/.zshrc && \
  echo '' >> ~/.zshrc && \
  echo '  if [[ $yn != "y" ]]; then' >> ~/.zshrc && \
  echo '    echo "Starting genie:"' >> ~/.zshrc && \
  echo '    exec /usr/bin/genie -c "zsh"' >> ~/.zshrc && \
  echo '  fi' >> ~/.zshrc && \
  echo 'fi' >> ~/.zshrc
  ```
