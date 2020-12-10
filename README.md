# Laravel用の開発環境
## 使い方
```
git clone https://github.com/seiyu-nico/laravel_dev.git
cd laravel_dev
make init
```
- バージョンを指定する場合は./docker/php/Dockerfileを修正してください
```
- RUN composer create-project "laravel/laravel=6.*" --prefer-dist .
+ RUN composer create-project "laravel/laravel=7.*" --prefer-dist .
```
- make initで余計なファイルの削除 && イメージビルト && 起動までを行う
  - 下記動作を行っている感じ

```
rm -rf 各種.gitkeep
docker-compose build 
docker-compose up -d 
```

- make init後の使い方は基本変わらないので調べてください

## 設定の変更
### URL
- ./docker/nginx/server.conf
  - server_nameを修正
- ./docker-compose.yml
  - https-portal -> environment -> DOMAINSをserver_nameに合わせて修正
 
## SSLについて
- 開発環境でもSSL化しないといけないときがあるので基本はSSL化してある
  - mixed contentでリソースがブロックされる
  - FacebookのOAuthで設定するredirect URIはhttpsでないと動かない
  - Geolocation APIで位置情報を取得する時にhttpsでないと動かない

- Chromeで警告を無視する
  - Enabledにすると localhost に限り自己署名証明書であっても警告が出なくなる。
```
chrome://flags/#allow-insecure-localhost
```
