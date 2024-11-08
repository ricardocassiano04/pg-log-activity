#!/bin/bash
#
# Autor: Ricardo Cassiano
#
#
# Crontab para os scripts do pg-log-activity
#
# https://github.com/ricardocassiano04/pg-log-activy
#   


# Executa o cron que armazena load do servidor e de conexões do postgres.
*/1 * * * * postgres /opt/pg-log-activity/pg-log-activity.sh

# Executa o cron que armazena tamanho dos bancos de dados do cluster
55 23 * * * postgres /opt/pg-log-activity/pg-log-database.sh

