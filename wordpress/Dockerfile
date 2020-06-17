FROM php:7.3-fpm-buster
LABEL maintainer="Marcos Trotti <marcostrotti@gmail.com>"

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update && apt-get install -y nginx libmagickwand-dev --no-install-recommends  && pecl install imagick && docker-php-ext-enable imagick
RUN apt-get install -y supervisor
COPY config/nginx.conf /etc/nginx/nginx.conf

COPY config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY config/php.ini /usr/local/etc/php/conf.d/custom.ini

COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/www/html
RUN mkdir -p /var/log/supervisor/nginx
RUN mkdir -p /var/log/supervisor/php-fpm

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]