FROM debian:jessie

# Install needed packages
RUN apt-get update && apt-get install -y \
	autoconf ca-certificates curl file gcc \
	libjpeg62-turbo libmysqlclient18 libpng12-0 libxml2 \
	make pkg-config sendmail --no-install-recommends \
	&& rm -r /var/lib/apt/lists/*

ENV PHP_INI_DIR /usr/local/etc/php

RUN mkdir -p $PHP_INI_DIR/conf.d

ENV PHP_EXTRA_CONFIGURE_ARGS --enable-fastcgi --enable-fpm --enable-force-cgi-redirect

ENV PHP_VERSION 5.2.17

COPY php-5.2.17-*.patch /tmp/

RUN buildDeps=" \
		$PHP_EXTRA_BUILD_DEPS \
		bzip2 \
		libcurl4-openssl-dev \
		libjpeg-dev \
		libmysqlclient-dev \
		libpng12-dev \
		libreadline6-dev \
		libssl-dev \
		libxml2-dev \
		patch \
	"; \
	set -x \
	&& apt-get update && apt-get install -y $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
	&& curl -SL "http://museum.php.net/php5/php-$PHP_VERSION.tar.bz2" -o php.tar.bz2 \
	&& curl -SL "http://php-fpm.org/downloads/php-$PHP_VERSION-fpm-0.5.14.diff.gz" -o php-fpm.diff.gz \
	&& mkdir -p /usr/src/php \
	&& tar -xf php.tar.bz2 -C /usr/src/php --strip-components=1 \
	&& gzip -cd php-fpm.diff.gz > /tmp/php-fpm.diff \
	&& rm php* \
	&& cd /usr/src/php \
	&& patch -p1 < /tmp/php-5.2.17-libxml2.patch \
	&& patch -p1 < /tmp/php-5.2.17-openssl.patch \
	&& patch -p1 < /tmp/php-fpm.diff \
	&& ln -s /usr/lib/x86_64-linux-gnu/libjpeg.a /usr/lib/libjpeg.a \
	&& ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib/libjpeg.so \
	&& ln -s /usr/lib/x86_64-linux-gnu/libpng.a /usr/lib/libpng.a \
	&& ln -s /usr/lib/x86_64-linux-gnu/libpng.so /usr/lib/libpng.so \
	&& ln -s /usr/lib/x86_64-linux-gnu/libmysqlclient.so /usr/lib/libmysqlclient.so \
	&& ln -s /usr/lib/x86_64-linux-gnu/libmysqlclient.a /usr/lib/libmysqlclient.a \
	&& ./configure \
		--with-config-file-path="$PHP_INI_DIR" \
		--with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
		--with-fpm-conf="$PHP_INI_DIR/php-fpm.conf" \
		$PHP_EXTRA_CONFIGURE_ARGS \
		--enable-mbstring \
		--enable-pdo \
		--enable-soap \
		--with-curl \
		--with-gd \
		--with-jpeg-dir=/usr \
		--with-png-dir=/usr \
		--with-mysql \
		--with-mysqli \
		--with-openssl \
		--with-pdo-mysql \
		--with-readline \
		--with-zlib \
	&& sed -i 's/-lxml2 -lxml2 -lxml2/-lcrypto -lssl/' Makefile \
	&& make -j"$(nproc)" \
	&& make install \
	&& { find /usr/local/bin /usr/local/sbin -type f -executable -exec strip --strip-all '{}' + || true; } \
	&& apt-get purge -y --auto-remove $buildDeps \
	&& make clean

COPY docker-php-ext-* /usr/local/bin/
COPY php-fpm.conf /usr/local/etc/php/

# Setup timezone to Etc/UTC and fix extension path
RUN cat /usr/src/php/php.ini-recommended | sed 's/^;\(date.timezone.*\)/\1 \"Etc\/UTC\"/' > /usr/local/etc/php/php.ini \
	&& sed -i 's/\(extension_dir = \)\"\.\/\"/\1\"\/usr\/local\/lib\/php\/extensions\/no-debug-non-zts-20060613\/\"/' /usr/local/etc/php/php.ini

WORKDIR /var/www

# Run php-fpm
EXPOSE 9000
CMD ["php-cgi", "--fpm"]
