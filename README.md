# Dockerテンプレート

以下のコマンドで起動できます

```sh
docker-compose up
```

- 起動後以下のコマンドでmysqlにアクセスしてみてください
- passwordが聞かれると思うので、`docker-compose.yaml`で`MYSQL_ROOT_PASSWORD`に設定したパスワードを入力してください

```sh
mysql -u root -p --host 127.0.0.1 -P 4306 < initial.sql
```

以上のコマンドで新しいデータベースとusersテーブルが作られます
