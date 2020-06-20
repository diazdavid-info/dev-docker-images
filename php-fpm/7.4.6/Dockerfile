FROM php:7.4.6-fpm-alpine3.11

WORKDIR /var/www/html

RUN apk add --update
RUN apk add --no-cache $PHPIZE_DEPS
RUN apk add libmemcached-dev zlib-dev vim icu-dev g++ wget git zip unzip openssh
RUN apk add libpng-dev jpeg-dev freetype-dev libwebp-dev libjpeg-turbo-dev libxpm-dev php7-exif libxml2-dev
RUN apk add sqlite-dev sqlite

RUN pecl install xdebug
RUN pecl install redis
RUN pecl install memcached
RUN pecl install memcache

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install sockets
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-configure gd
RUN docker-php-ext-install gd
RUN docker-php-ext-install exif
RUN docker-php-ext-install xmlrpc

RUN docker-php-ext-enable xdebug
RUN docker-php-ext-enable redis
RUN docker-php-ext-enable memcached
RUN docker-php-ext-enable memcache

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir=/usr/bin --filename=composer && \
    php -r "unlink('composer-setup.php');"

COPY php.ini $PHP_INI_DIR/conf.d/
