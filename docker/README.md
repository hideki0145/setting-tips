# docker

Tips for **Docker** settings.

## Install

- Debian, Ubuntu

  ```sh
  # Docker Engineのインストール(https://docs.docker.com/engine/install/ubuntu/)
  sudo apt update
  sudo apt install -y ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  # Docker Engine動作検証
  docker --version
  # Docker Compose動作検証
  docker compose version

  # Dockerグループに一般ユーザ追加
  sudo usermod -aG docker $USER
  cat /etc/group | grep docker
  ```
