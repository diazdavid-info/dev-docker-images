FROM php:5.6-apache

RUN apt-get update \
    && apt-get install -y \
        libmemcached-dev zlib1g-dev vim libicu-dev g++ wget git zip unzip \
        libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev libjpeg62-turbo-dev libxpm-dev \
        python-minimal \
        mysql-client

RUN pecl install \
    xdebug-2.5.5 \
    redis-4.3.0 \
    memcached-2.2.0


RUN docker-php-ext-install mysqli
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install sockets
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir
RUN docker-php-ext-install gd


RUN docker-php-ext-enable xdebug \
     && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN docker-php-ext-enable redis
RUN docker-php-ext-enable memcached

ENV APACHE_DOCUMENT_ROOT /var/www/html

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN a2enmod rewrite

COPY php.ini $PHP_INI_DIR/conf.d/
