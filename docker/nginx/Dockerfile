FROM nginx:latest
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

# 設定ファイルを指定の場所に置く
COPY ./server.conf /etc/nginx/nginx.conf
CMD ["nginx", "-g", "daemon off;"]
