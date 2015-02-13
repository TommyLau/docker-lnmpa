# lnmpa-nginx

lnmpa-nginx is a Nginx Server boxed in a Docker image built by [Tommy Lau](http://tommy.net.cn/).

## What is in this image?

This image is a nginx web server cooked based on the offical docker image `nginx`, and with the following modifications.

- Switch system timezone to **Asia/Shanghai**, which is CST(China Standard Time)
- Use `/var/www/html` as the web root instead of `/user/share/nginx/html`
- PHP-FPM ready

## How to use this image

### Single instance mode

Get the docker image by running the following commands:

```bash
docker pull tommylau/nginx
```

Start an instance:

```bash
docker run --name nginx -v /path/to/web:/var/www/html -p 80:80 -p 443:443 -d tommylau/nginx
```

This will start an instance, and you are ready to go.

### Linking with other containers

For example, if I like to link to a php-fpm server with the name `php5.6` and named the host as `php` in container. For more information about php-fpm in Docker, please refer to [tommylau/php](https://registry.hub.docker.com/u/tommylau/php/).

```bash
docker run --name nginx -v /path/to/web:/var/www/html --link php5.6:php -p 80:80 -d tommylau/apache
```

Then in the instance, you can use the hostname `php` to connect to the php-fpm server, however you still have to modify the nginx config file to connect to php-fpm server `php`.
