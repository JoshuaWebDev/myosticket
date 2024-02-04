#!/bin/bash

workdir=/var/www/html/osticket

echo "Configurando usuário e grupo www-data no diretório $workdir"

if chown -R www-data:www-data $workdir
then
    echo "Usuário e grupo www-data configurados configurados com sucesso!"
else
    echo "Não foi possível configurar o usuário e grupo www-data"
fi

echo "Configurando permissões de acesso ao diretório $workdir"

if chmod -R 775 $workdir
then
    echo echo "Permissões de acesso ao diretório $workdir configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir"
fi