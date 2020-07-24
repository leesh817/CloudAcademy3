#!/bin/bash

mkdir test
cd test
vi stack.yml
    #  version: '3.1'
    #    services:
    #      wordpress:
    #        image: wordpress
    #        restart: always
    #        ports:
    #          - 8080:80
    #        environment:
    #          WORDPRESS_DB_HOST: db
    #          WORDPRESS_DB_USER: wp-admin
    #          WORDPRESS_DB_PASSWORD: dkagh1.
    #          WORDPRESS_DB_NAME: wordpress
    #        volumes:
    #          - wordpress:/var/www/html
    #      db:
    #        image: mysql:5.7
    #        restart: always
    #        environment:
    #          MYSQL_DATABASE: wordpress
    #          MYSQL_USER: wp-admin
    #          MYSQL_PASSWORD: dkagh1.
    #          MYSQL_ROOT_PASSWORD: dkagh1.
    #        volumes:
    #          - db:/var/lib/mysql
    #    volumes:
    #      wordpress:
    #      db:
docker-compose -f stack.yml up