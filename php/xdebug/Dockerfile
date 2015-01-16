FROM php:apache

MAINTAINER Tommy Lau <tommy@gen-new.com>

# Setup the Xdebug version to install
ENV XDEBUG_VERSION 2.2.6
ENV XDEBUG_MD5 f216356861e27284580d0208060ea7fa

# Install other needed extensions
RUN docker-php-ext-install \
	mbstring \
	mysql \
	mysqli

# Install Xdebug
RUN set -x \
	&& curl -SL "http://www.xdebug.org/files/xdebug-$XDEBUG_VERSION.tgz" -o xdebug.tgz \
	&& echo $XDEBUG_MD5 xdebug.tgz > xdebug.md5 \
	&& md5sum -c xdebug.md5 \
	&& mkdir -p /usr/src/xdebug \
	&& tar -xf xdebug.tgz -C /usr/src/xdebug --strip-components=1 \
	&& rm xdebug.* \
	&& cd /usr/src/xdebug \
	&& phpize \
	&& ./configure \
	&& make -j"$(nproc)" \
	&& make install \
	&& make clean

COPY ext-xdebug.ini /usr/local/etc/php/conf.d/

# Enable Apache2 rewrite module
RUN a2enmod rewrite

# Setup timezone to Asia/Shanghai
RUN cat /usr/src/php/php.ini-development | sed 's/^;\(date.timezone.*\)/\1 \"Asia\/Shanghai\"/' > /usr/local/etc/php/php.ini

