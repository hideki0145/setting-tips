# postgresql

Tips for **PostgreSQL** settings.

## Install

- Debian, Ubuntu

  ```sh
  # PostgreSQLのインストール(https://www.postgresql.org/download/linux/ubuntu/)
  sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
  sudo apt update
  sudo apt install -y postgresql
  ```

## Setting

- 開発環境用PostgreSQLロール作成

  ```sh
  sudo su postgres -c "createuser -s $LOGNAME"
  ```
