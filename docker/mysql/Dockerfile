FROM mysql:8.0
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

RUN apt update && \
    apt install -y locales && \
    rm -rf /var/lib/apt/lists/* && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 \
    && groupmod -g 1000 mysql && usermod -u 1000 -g 1000 mysql && \
    mkdir /var/log/mysql && \
    chown mysql:mysql /var/log/mysql

ENV LC_ALL ja_JP.UTF-8

COPY ./my.cnf /etc/mysql/conf.d/my.cnf
