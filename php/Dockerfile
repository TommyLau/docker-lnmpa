FROM php:5.6-fpm

MAINTAINER Tommy Lau <tommy@gen-new.com>

# Fix docker-php-ext-install script error
RUN sed -i 's/docker-php-\(ext-$ext.ini\)/\1/' /usr/local/bin/docker-php-ext-install

# Install other needed extensions
RUN apt-get update && apt-get install -y libfreetype6 libjpeg62-turbo libmcrypt4 libpng12-0 sendmail --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN buildDeps=" \
		libfreetype6-dev \
		libjpeg-dev \
		libldap2-dev \
		libmcrypt-dev \
		libpng12-dev \
		zlib1g-dev \
	"; \
	set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --enable-gd-native-ttf --with-jpeg-dir=/usr/lib/x86_64-linux-gnu --with-png-dir=/usr/lib/x86_64-linux-gnu --with-freetype-dir=/usr/lib/x86_64-linux-gnu \
	&& docker-php-ext-install gd \
	&& docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
	&& docker-php-ext-install ldap \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install mcrypt \
	&& docker-php-ext-install mysql \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install zip \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& cd /usr/src/php \
	&& make clean

# Install Composer for Laravel
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Setup timezone to Etc/UTC
RUN cat /usr/src/php/php.ini-production | sed 's/^;\(date.timezone.*\)/\1 \"Etc\/UTC\"/' > /usr/local/etc/php/php.ini

# Disable cgi.fix_pathinfo in php.ini
RUN sed -i 's/;\(cgi\.fix_pathinfo=\)1/\10/' /usr/local/etc/php/php.ini

WORKDIR /var/www

