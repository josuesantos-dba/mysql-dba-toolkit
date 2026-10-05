- Script: Verificar Locks e Deadlocks
-- Autor: Josue Santos
-- Descricao: Monitora locks e deadlocks 
--            no MySQL 8.0

-- Locks ativos no MySQL 8.0
SELECT 
    ENGINE_LOCK_ID,
    ENGINE_TRANSACTION_ID,
    OBJECT_SCHEMA,
    OBJECT_NAME,
    LOCK_TYPE,
    LOCK_MODE,
    LOCK_STATUS
FROM performance_schema.data_locks;

-- Processos em execucao
SHOW PROCESSLIST;

-- Matar processo bloqueador
-- KILL [numero_do_processo];
-- Exemplo: KILL 123;
