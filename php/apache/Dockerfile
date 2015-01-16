FROM php:apache

MAINTAINER Tommy Lau <tommy@gen-new.com>

# Enable Apache2 rewrite module
RUN a2enmod rewrite

# Install other needed extensions
RUN docker-php-ext-install \
	mbstring \
	mysql \
	mysqli

# Setup timezone to Asia/Shanghai
RUN cat /usr/src/php/php.ini-development | sed 's/^;\(date.timezone.*\)/\1 \"Asia\/Shanghai\"/' > /usr/local/etc/php/php.ini

