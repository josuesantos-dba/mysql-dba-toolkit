#!/bin/bash
# Script de Restore MySQL
# Autor: Josue Santos
# Descricao: Restaura backup do MySQL

# Configuracoes
USUARIO="root"
SENHA="sua_senha"
DATA=$(date +%Y%m%d_%H%M%S)
LOG="/var/log/restore_mysql.log"

# Verifica se arquivo foi informado
if [ -z "$1" ]; then
  echo "Uso: ./restore.sh arquivo.sql"
  exit 1
fi

ARQUIVO=$1

# Verifica se arquivo existe
if [ ! -f "$ARQUIVO" ]; then
  echo "Erro: arquivo $ARQUIVO nao encontrado!"
  exit 1
fi

echo "[$DATA] Iniciando restore..." >> $LOG
echo "[$DATA] Arquivo: $ARQUIVO" >> $LOG

# Executa o restore
mysql -u $USUARIO -p$SENHA < $ARQUIVO

# Verifica se restore foi ok
if [ $? -eq 0 ]; then
  echo "[$DATA] Restore concluido!" >> $LOG
  echo "Restore concluido com sucesso!"
else
  echo "[$DATA] ERRO no restore!" >> $LOG
  echo "ERRO no restore!"
fi
