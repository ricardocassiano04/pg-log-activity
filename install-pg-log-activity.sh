#!/bin/bash
#
#
# Executa a criação do banco pg_log_activity e seus objetos
#
# TODO: verificar se o pg_log_activity já está instalado


read -r -p "Digite o endereço do servidor postgres ": SERVIDOR

read -r -p "Digite a porta de conexão ao servidor postgres ": PORTA

read -r -p "Digite o nome do usuário ": USUARIO

read -r -p "Digite o nome do banco de dados onde ficarão os logs ": BANCO



function instalar_script () {

    echo "Digite agora a senha do usuário linux: "

    sudo apt -y install cron 
    sudo mkdir -p /opt/pg-log-activity
    sudo chown -R postgres:postgres /opt/pg-log-activity
    sudo cp -rf pg-log-activity.sh /opt/pg-log-activity/
    sudo cp -rf pg-log-database.sh /opt/pg-log-activity/
    sudo chmod +x /opt/pg-log-activity/pg-log-activity.sh
    sudo chmod +x /opt/pg-log-activity/pg-log-database.sh
    sudo cp -rf pg-log-cron.sh /etc/cron.d/
    sudo chmod +x /etc/cron.d/pg-log-cron.sh
    
    echo "Digite agora somente a senha do usuário postgres: "

    psql -h ${SERVIDOR} -p ${PORTA} -d postgres -U ${USUARIO} -d ${BANCO} -W -f criar-pg-log-activity.sql
}



verificar_conexao=$(psql -h ${SERVIDOR} -p ${PORTA} -d postgres -U ${USUARIO} -W -tA -c "select count(1) from pg_database;")


if [ "${verificar_conexao}" -gt "1" ]; then
    instalar_script
    echo "pg-log-activity instalado!"
else
    echo "Não foi possível conectar ao postgresql"
    echo "Verifique os parâmetros e execute o script novamente"
    exit
fi






