# postgresql

Tips for **PostgreSQL** settings.

## Install

- Debian, Ubuntu

  ```sh
  # PostgreSQLのインストール(https://www.postgresql.org/download/linux/ubuntu/)
  sudo apt install -y curl ca-certificates gnupg
  curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/apt.postgresql.org.gpg >/dev/null
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  sudo apt update
  sudo apt install -y postgresql
  ```

## Setting

- 開発環境用PostgreSQLロール作成

  ```sh
  sudo su postgres -c "createuser -s $LOGNAME"
  ```
