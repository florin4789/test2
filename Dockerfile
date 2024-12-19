FROM php:8.2-apache

# Instalează extensii necesare
RUN docker-php-ext-install pdo pdo_mysql

# Activează module Apache, dacă e cazul
RUN a2enmod rewrite

# Copiază codul în container
COPY . /var/www/html

# Setează directorul de lucru
WORKDIR /var/www/html

COPY public/php.ini /usr/local/etc/php/

RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf
RUN sed -ri -e 's!/var/www!/var/www/html/public!g' /etc/apache2/apache2.conf
