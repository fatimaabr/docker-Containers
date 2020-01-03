FROM php

RUN apt-get update -y && apt-get install -y nginx

COPY --chown=www-data:www-data . /var/www/laravel

COPY ./docker/default.conf /etc/nginx/sites-enabled/default.conf

COPY entrypoint.sh /etc/entrypoint.sh


WORKDIR /var/www/laravel

EXPOSE 80 443

ENTRYPOINT ["/etc/entrypoint.sh"]