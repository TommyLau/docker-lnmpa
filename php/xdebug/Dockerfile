FROM php:apache

MAINTAINER Tommy Lau <tommy@gen-new.com>

ENV XDEBUG_VERSION 2.2.6
ENV XDEBUG_MD5 f216356861e27284580d0208060ea7fa

RUN docker-php-ext-install mbstring mysql mysqli

RUN set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
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

