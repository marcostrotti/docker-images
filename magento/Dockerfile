FROM php:7.1-fpm
RUN apt-get update && apt-get install -y \
  cron \
  git \
  gzip \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libmcrypt-dev \
  libpng-dev \
  libxslt1-dev \
  libsodium-dev \
  lsof \
  mysql-client \
  vim \
  zip \
  nginx \
  sudo


RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install \
  bcmath \
  gd \
  mbstring \
  opcache \
  pdo_mysql \
  soap \
  xsl \
  zip \
  mcrypt \
  bcmath \
  intl \
  xml

RUN pecl install -f libsodium-1.0.17 && echo "extension=sodium.so" > /usr/local/etc/php/conf.d/sodium.ini
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN chown -R www-data:www-data /var/www/
RUN chmod -R g+w /var/www/
RUN apt-get clean
RUN apt-get autoclean
EXPOSE 80
