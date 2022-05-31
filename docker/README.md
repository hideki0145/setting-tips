# docker

Tips for **Docker** settings.

## Install

- Debian, Ubuntu

  ```sh
  # Docker Engineのインストール(https://docs.docker.com/engine/install/ubuntu/)
  sudo apt update
  sudo apt install -y ca-certificates curl gnupg lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io
  # Docker Engine動作検証
  docker --version

  # Dockerグループに一般ユーザ追加
  sudo usermod -aG docker $USER
  cat /etc/group | grep docker

  # Docker Composeのインストール(https://docs.docker.com/compose/install/)
  sudo mkdir -p /usr/local/lib/docker/cli-plugins/
  compose_version="$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | sed -e 's/^.*"tag_name".*"\(.*\)".*$/\1/g')"
  sudo curl -SL "https://github.com/docker/compose/releases/download/${compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/lib/docker/cli-plugins/docker-compose
  sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose
  # Docker Compose動作検証
  docker compose version
  ```
