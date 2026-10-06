-- Script: Auditoria MySQL
-- Autor: Josue Santos
-- Descricao: Monitora acessos e 
--            atividades suspeitas

-- Ver todos os usuarios e privilegios
SELECT 
    user,
    host,
    authentication_string,
    password_expired,
    account_locked
FROM mysql.user;

-- Ver privilegios de um usuario
SHOW GRANTS FOR 'app_user'@'%';

-- Ver conexoes ativas
SELECT 
    ID,
    USER,
    HOST,
    DB,
    COMMAND,
    TIME,
    STATE
FROM information_schema.PROCESSLIST
WHERE COMMAND != 'Sleep'
ORDER BY TIME DESC;

-- Ver tentativas de login falhas
SELECT 
    user,
    host,
    FAILED_LOGIN_ATTEMPTS
FROM information_schema.USER_ATTRIBUTES
WHERE FAILED_LOGIN_ATTEMPTS > 0;

-- Ativar auditoria (Enterprise)
-- INSTALL PLUGIN audit_log 
--   SONAME 'audit_log.so';
-- SET GLOBAL audit_log_policy = 'ALL';
