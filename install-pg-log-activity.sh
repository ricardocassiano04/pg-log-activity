#!/bin/bash
#
#
# Executa a criação do banco pg_log_activity e seus objetos


read -r -p "Digite o endereço do servidor postgres ": SERVIDOR

read -r -p "Digite a porta de conexão ao servidor postgres ": PORTA

read -r -p "Digite o nome do usuário ": USUARIO


psql -h ${SERVIDOR} -p ${PORTA} -d postgres -U ${USUARIO} -W -f criar-pg-log-activity.sql


