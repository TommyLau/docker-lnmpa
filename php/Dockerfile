FROM php:fpm

MAINTAINER Tommy Lau <tommy@gen-new.com>

# Install other needed extensions
RUN docker-php-ext-install \
	mbstring \
	mysql \
	mysqli

# Setup timezone to Asia/Shanghai
RUN cat /usr/src/php/php.ini-production | sed 's/^;\(date.timezone.*\)/\1 \"Asia\/Shanghai\"/' > /usr/local/etc/php/php.ini

# Disable cgi.fix_pathinfo in php.ini
RUN sed -i 's/;\(cgi\.fix_pathinfo=\)1/\10/' /usr/local/etc/php/php.ini

