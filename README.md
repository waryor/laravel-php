# laravel-php
Docker container image for hosting laravel applications in

## How to use this image

### About this image

This image comes with preconfigured nginx listening on port `3000`.

You should deploy or mount your app to `app` since nginx serves `app/public`.

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


