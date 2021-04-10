FROM php:8.0.3-fpm-alpine3.13

WORKDIR /var/www/html

ENV PHP_WWW_DIR /usr/local/etc/php-fpm.d

RUN apk add --update
RUN apk add --no-cache $PHPIZE_DEPS
RUN apk add libmemcached-dev zlib-dev vim icu-dev g++ wget git zip unzip openssh
RUN apk add libpng-dev jpeg-dev jpeg-dev freetype-dev libwebp-dev libjpeg-turbo-dev \
    libxpm-dev php7-exif libxml2-dev libunwind-dev poppler-utils libxslt-dev
RUN apk add sqlite-dev sqlite

RUN pecl install xdebug
RUN pecl install redis
RUN pecl install memcached
RUN pecl install memcache
RUN pecl install xmlrpc-1.0.0RC2

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install sockets
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-install exif
RUN docker-php-ext-install soap
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install xsl

RUN docker-php-ext-enable xdebug
RUN docker-php-ext-enable redis
RUN docker-php-ext-enable memcached
RUN docker-php-ext-enable memcache

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

COPY php.ini $PHP_INI_DIR/conf.d/