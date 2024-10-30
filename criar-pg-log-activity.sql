/*

Criação das tabelas e procedures para armazenar
as atividades do banco de dados

*/


CREATE DATABASE pg_log_activity ;

\c pg_log_activity


--
-- Tabela pg_log_atividade para armazenar a cada minuto estado das transações
-- e quantidade de conexões

create table pg_log_atividade (
    id bigserial not null primary key,
    banco text,
    nome_aplicacao text,
    estado_transacao text,
    qtde_conexoes bigint,
    criado_em timestamp(0) default current_timestamp(0),
    data date default current_date
) ;




-- procedure para os inserts

create procedure sp_pg_log_atividade()
LANGUAGE PLPGSQL
AS

$$

BEGIN

    insert into pg_log_atividade 
    (
        banco,
        nome_aplicacao,
        estado_transacao,
        qtde_conexoes
    )
    select 
        datname,
        application_name,
        state,
        count(pid)
    from pg_stat_activity
    where backend_type = 'client backend'
    group by datname, application_name, state ;


END;
$$;


--
-- Tabela pg_log_banco para armazenar tamanho dos bancos de dados
--


create table pg_log_load (
    id bigserial not null primary key,
    total_conexoes_ativas bigint,
    load numeric(17,2),
    criado_em timestamp(0) default current_timestamp(0),
    data date default current_date
);




--
-- Tabela pg_log_banco para armazenar tamanho dos bancos de dados
--

create table pg_log_banco
(
  id bigserial not null primary key,
  banco text,
  tamanho_banco bigint,
  criado_em timestamp(0) default CURRENT_TIMESTAMP(0)
);