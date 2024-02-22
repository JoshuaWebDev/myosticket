#!/bin/bash

workdir=/var/www/html/osticket

echo "Configurando usuário e grupo www-data no diretório $workdir"

if chown -R www-data:www-data $workdir
then
    echo "Usuário e grupo www-data configurados configurados com sucesso!"
else
    echo "Não foi possível configurar o usuário e grupo www-data"
fi

echo "Criando o arquivo de configuração (include/ost-config.php)"

if cp upload/include/ost-sampleconfig.php upload/include/ost-config.php
then
    echo "Configurações criadas com sucesso!"
else
    echo "Não foi possível realizar as configurações"
fi

echo "Configurando permissões de acesso ao diretório $workdir"

if chmod -R 775 $workdir
then
    echo "Permissões de acesso ao diretório $workdir configuradas com sucesso!"
else
    echo "Não foi possível configurar as permissões de acesso ao diretório $workdir"
fi