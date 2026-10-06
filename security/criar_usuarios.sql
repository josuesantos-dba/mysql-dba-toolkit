-- Script: Criar Usuarios MySQL
-- Autor: Josue Santos
-- Descricao: Cria usuarios seguros
--            seguindo boas praticas

-- Usuario somente leitura
CREATE USER 'leitura'@'%' 
IDENTIFIED BY 'SenhaForte@123';

GRANT SELECT ON *.* 
TO 'leitura'@'%';

-- Usuario da aplicacao
CREATE USER 'app_user'@'%'
IDENTIFIED BY 'SenhaForte@456';

GRANT SELECT, INSERT, UPDATE 
ON meu_banco.* 
TO 'app_user'@'%';

-- Usuario de backup
CREATE USER 'backup_user'@'localhost'
IDENTIFIED BY 'SenhaForte@789';

GRANT SELECT, LOCK TABLES, 
      SHOW VIEW, EVENT, TRIGGER 
ON *.* 
TO 'backup_user'@'localhost';

-- Verificar usuarios criados
SELECT user, host 
FROM mysql.user;
