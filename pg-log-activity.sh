#!/bin/bash
#
# Armazena load do servidor e de conexões do postgres.
# 
# Executar esse arquivo num cron do linux com o usuário postgres



BANCO=pg_log_activity

LOAD_SERVIDOR=$(uptime | awk -F'load average: ' '{ print $2 }' | cut -d',' -f1 | awk -F'.' '{ print $1 }')



psql -d "${BANCO}" -t -c "CALL sp_pg_log_atividade()"  ;


psql -d "${BANCO}" -t -c "insert into pg_log_load (total_conexoes_ativas, load)
select
	count(pid) as total_conexoes_ativas,    
	"${LOAD_SERVIDOR}"::bigint as load
from pg_stat_activity
where backend_type = 'client backend' ;
"



