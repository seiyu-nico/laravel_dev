# FROM php:7.4.12-fpm-alpine3.12 AS build-env

# RUN apk upgrade --update && apk --no-cache add icu-dev autoconf make g++ gcc curl && \
#     curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# WORKDIR /var/www
# RUN composer create-project laravel/laravel --prefer-dist laravel8

# FROM php:7.4.12-fpm-alpine3.12 

# この辺で下記と同じ処理

# COPY --from=build-env /usr/local/bin/composer /usr/local/bin/composer
# COPY --from=build-env /var/www /var/www
# これで容量が小さくなるかわからないけどやってみた
# 20MBぐらいしか変わらなかった・・・

FROM php:7.4.12-fpm-alpine3.12 
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

RUN apk upgrade --update && \
    apk --no-cache --update add icu-dev autoconf make g++ gcc oniguruma-dev  && \
    docker-php-ext-install  -j$(nproc) iconv intl mbstring pdo_mysql opcache && \
    pecl install xdebug-2.9.8 && \
    docker-php-ext-enable xdebug && \
    set -eux && \
    apk add --update --no-cache git autoconf g++ libtool make libzip-dev libpng-dev libjpeg-turbo-dev freetype-dev && \
    pecl install redis && \
    docker-php-ext-configure gd --with-jpeg=/usr && \
    docker-php-ext-configure opcache --enable-opcache && \
    docker-php-ext-install opcache bcmath pdo_mysql gd exif zip && \
    docker-php-ext-enable redis && \
    apk del autoconf g++ libtool make && \
    rm -rf /tmp/* && \
    apk upgrade --update && apk --no-cache add icu-dev autoconf make g++ gcc curl && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /var/www/app
RUN composer create-project "laravel/laravel=6.*" --prefer-dist .
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

ENV user tech
ENV group tech
RUN deluser --remove-home www-data && \
    adduser -u 1000 -h /home/${user} --disabled-password ${user} && \
    chown -R ${user}:${group} /home/${user} && \
    chown -R ${user}:${group} /var/www/ && \
    chown -R ${user}:${group} /var/run/ && \
    chown -R ${user}:${group} /var/log/

USER ${user}

