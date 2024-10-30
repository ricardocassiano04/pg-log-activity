# pg_log_activity


### Para Linux

Cria um histórico de quantidade de conexões, tamanho dos bancos de dados e load do PostgreSQL


Para configurar, executar no terminal o script install-pg-log-activity.sh e preencher os dados de conexão.


Depois colocar no cron os scripts:

        pg-log-activity.sh - executar a cada minuto

        pg-log-dataabse.sh - executar uma vez no dia
