# laravel-php
Docker container image for hosting laravel applications in

## How to use this image

### About this image

This image is based on [php:8.1-alpine](https://hub.docker.com/layers/php/library/php/8.1-alpine/images/sha256-6340f86b1dc4325d09cd8311d8c40e36ab54061d0d25ea1491c100578bc50ae1?context=explore).

The following php-extensions are included:
- bcmath 
- ctype
- fileinfo
- json
- mbstring
- openssl
- pdo
- tokenizer
- xml
- dom
- xmlwriter
- session

This image comes with preconfigured nginx listening on port `3000`.

You should deploy or mount your app to `/app` since nginx serves `/app/public`.

### Via Docker-compose

```docker-compose.yml
version: "3.0"
services:
  laravel:
    image: waryor/laravel-php:latest
    ports:
      - 80:3000
    volumes:
      - /project:/app/
```

### Via Dockerfile

```Dockerfile
FROM ghcr.io/waryor/laravel-php:latest

# continue here
```


