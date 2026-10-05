 Script: Verificar Status da Replicacao
-- Autor: Josue Santos
-- Descricao: Monitora saude da replicacao MySQL

-- Status geral da replicacao
SHOW REPLICA STATUS\G

-- Verifica atraso da replica
SELECT 
    CHANNEL_NAME,
    SERVICE_STATE,
    LAST_ERROR_MESSAGE,
    LAST_HEARTBEAT_TIMESTAMP
FROM performance_schema.replication_connection_status;

-- Verifica threads de replicacao
SELECT 
    CHANNEL_NAME,
    THREAD_ID,
    SERVICE_STATE
FROM performance_schema.replication_applier_status;
