FROM php:alpine

RUN apk add bash

# setup php
RUN apk add php-bcmath \ 
    php8-ctype \
    php8-fileinfo \
    php8-json \
    php8-mbstring \
    php8-openssl \
    php8-pdo \
    php8-tokenizer \
    php8-xml \
    php8-dom \
    php8-xmlwriter \
    php8-session
    
# install & configuire fpm
RUN apk add php8-fpm
RUN mkdir -p /var/run/php/
RUN chmod 777 /var/run/php/
RUN printf "listen = /var/run/php/php8-fpm.sock\n" >> /etc/php8/php-fpm.conf
RUN printf "listen.owner=www-data\n" >> /etc/php8/php-fpm.conf
RUN printf "listen.group=www-data\n" >> /etc/php8/php-fpm.conf
RUN printf "listen.mode=0660" >> /etc/php8/php-fpm.conf

# configure nginx
COPY ./nginx/default.conf /etc/nginx/http.d/default.conf

WORKDIR /app

CMD ["/bin/bash", "-c", "php-fpm8 && nginx -g 'daemon off;'"]

EXPOSE 3000
