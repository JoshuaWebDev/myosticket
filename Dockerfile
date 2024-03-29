FROM php:8.2-apache

ENV PROJECTNAME osticket

RUN echo "Atualizando dependências do sistema"
RUN apt-get update

RUN echo "Instalando dependências do sistema Linux"
RUN apt-get install -y build-essential gcc g++ libicu-dev libpq-dev \
    libc-client-dev libkrb5-dev libzip-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    zip unzip curl wget vim

RUN echo "Limpando cache do APT-GET"
RUN rm -r /var/lib/apt/lists/*

RUN echo "Configurando extensões do PHP"
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg

RUN echo "Instalando dependências do PHP"
RUN docker-php-ext-install zip mysqli pdo_mysql imap gd intl

RUN echo "Habilitando ACPU CLI"
RUN pecl install apcu-5.1.23
RUN docker-php-ext-enable apcu

RUN echo "Habilitando otimizações no OPcache"
RUN docker-php-ext-configure opcache --enable-opcache
RUN docker-php-ext-install opcache

COPY ./docker/install.sh /usr/local/bin
COPY ./docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY ./docker/apache/start-apache /usr/local/bin
COPY ./docker/php/php.ini ${PHP_INI_DIR}

RUN mkdir /var/www/html/${PROJECTNAME}
COPY ./${PROJECTNAME} /var/www/html/${PROJECTNAME}

WORKDIR /var/www/html/${PROJECTNAME}