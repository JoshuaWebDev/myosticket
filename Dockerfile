FROM php:8.2-apache

ENV PROJECTNAME osticket

RUN echo "Atualizando dependências do sistema"
RUN apt-get update

RUN echo "Instalando dependências do sistema Linux"
RUN apt-get install -y vim g++ libzip-dev zip curl wget

COPY ./docker/install.sh /usr/local/bin
COPY ./docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./docker/apache/start-apache /usr/local/bin
COPY ./docker/php/php.ini-development /usr/local/etc/php/php.ini-development
COPY ./docker/php/php.ini-production /usr/local/etc/php/php.ini-production

RUN mkdir /var/www/html/${PROJECTNAME}
COPY ./${PROJECTNAME} /var/www/html/${PROJECTNAME}

WORKDIR /var/www/html/${PROJECTNAME}