# redis

Tips for **Redis** settings.

## Install

- Debian, Ubuntu

  ```sh
  # Redisのインストール
  sudo add-apt-repository ppa:chris-lea/redis-server
  sudo apt update
  sudo apt install -y redis
  # 自動起動の設定
  sudo systemctl enable redis-server.service
  ```
