-- Script: Queries Mais Lentas
-- Autor: Josue Santos
-- Descricao: Identifica as queries 
--            mais lentas do servidor

-- Top 10 queries mais lentas
SELECT 
    DIGEST_TEXT AS query,
    COUNT_STAR AS total_execucoes,
    ROUND(AVG_TIMER_WAIT/1000000000, 2) 
        AS media_segundos,
    ROUND(MAX_TIMER_WAIT/1000000000, 2) 
        AS max_segundos,
    ROUND(SUM_TIMER_WAIT/1000000000, 2) 
        AS total_segundos
FROM performance_schema
    .events_statements_summary_by_digest
WHERE DIGEST_TEXT IS NOT NULL
ORDER BY AVG_TIMER_WAIT DESC
LIMIT 10;

-- Queries sem indice
SELECT 
    DIGEST_TEXT AS query,
    COUNT_STAR AS total_execucoes,
    SUM_NO_INDEX_USED AS sem_indice
FROM performance_schema
    .events_statements_summary_by_digest
WHERE SUM_NO_INDEX_USED > 0
ORDER BY SUM_NO_INDEX_USED DESC
LIMIT 10;
