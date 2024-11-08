#!/bin/bash
#
#
# Executa a criação do banco pg_log_activity e seus objetos


read -r -p "Digite o endereço do servidor postgres ": SERVIDOR

read -r -p "Digite a porta de conexão ao servidor postgres ": PORTA

read -r -p "Digite o nome do usuário ": USUARIO


psql -h ${SERVIDOR} -p ${PORTA} -d postgres -U ${USUARIO} -W -f criar-pg-log-activity.sql


sudo mkdir /opt/pg-log-activity

sudo chown -R postgres:postgres /opt/pg-log-activity

sudo cp -rf pg-log-activity.sh /opt/pg-log-activity/

sudo cp -rf pg-log-database.sh /opt/pg-log-activity/

sudo chmod +x /opt/pg-log-activity/pg-log-activity.sh

sudo chmod +x /opt/pg-log-activity/pg-log-database.sh

sudo cp -rf pg-log-cron.sh /etc/cron.d/

sudo chmod +x /etc/cron.d/pg-log-cron.sh



