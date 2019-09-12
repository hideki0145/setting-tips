# docker

Tips for **Docker** settings.

## Install

- Debian, Ubuntu

  ```sh
  # Docker Engineのインストール(https://docs.docker.com/install/linux/docker-ce/ubuntu/)
  sudo apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io
  # Docker Engine動作検証
  docker --version

  # Dockerグループに一般ユーザ追加
  sudo gpasswd -a ${USER} docker
  cat /etc/group | grep docker
  sudo chmod 666 /var/run/docker.sock

  # Docker Composeのインストール(https://docs.docker.com/compose/install/)
  compose_version="$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | sed -e 's/[^0-9\.]//g')"
  sudo curl -L "https://github.com/docker/compose/releases/download/${compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  # Docker Compose動作検証
  docker-compose --version
  ```
