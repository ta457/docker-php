FROM php:8.3-fpm-alpine

RUN apk --no-cache add \
    nodejs \
    npm \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    freetype \
    freetype-dev \
    nano

RUN docker-php-ext-configure gd --with-jpeg=/usr/include/ --with-freetype=/usr/include/

RUN docker-php-ext-install pdo pdo_mysql gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
