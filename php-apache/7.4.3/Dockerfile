FROM php:7.4.3-apache

WORKDIR /var/www/html

RUN apt-get update
RUN apt-get install -y libmemcached-dev zlib1g-dev vim libicu-dev g++ wget git zip unzip
RUN apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev libwebp-dev libjpeg62-turbo-dev libxpm-dev
RUN apt-get install -y libsqlite3-dev libsqlite3-0 sqlite3

RUN pecl install xdebug
RUN pecl install redis
RUN pecl install memcached


RUN docker-php-ext-install mysqli
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install sockets
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd


RUN docker-php-ext-enable xdebug
RUN docker-php-ext-enable redis
RUN docker-php-ext-enable memcached

ENV APACHE_DOCUMENT_ROOT /var/www/html

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN a2enmod rewrite

COPY php.ini $PHP_INI_DIR/conf.d/
