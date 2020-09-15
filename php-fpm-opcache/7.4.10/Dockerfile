FROM diazdavid/dev-php-fpm:7.4.10

RUN docker-php-ext-install opcache

ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
ENV PHP_OPCACHE_REVALIDATE_FREQ="0"
COPY opcache.ini "$PHP_INI_DIR/conf.d/opcache.ini"
