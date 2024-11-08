#!/bin/bash
#
#
# Armazena tamanho dos bancos de dados do cluster
#
# Executar esse arquivo num cron do linux com u usuário postgres 
#  uma vez no dia ou na frequência desejada



BANCO=pg_log_activity


psql -d "${BANCO}" -t -c "
insert into pg_log_banco (banco, tamanho_banco)
select 
 datname, 
 pg_database_size(datname) as tamanho_banco
from pg_database
where datistemplate = false
    and datname <> 'postgres' 
order by datname;
"


