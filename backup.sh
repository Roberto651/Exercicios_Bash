#!/bin/bash

BACKUP_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

if [ "$#" -lt 1 ]; then
    echo "Uso: $0 item1 [item2 item3 ...]"
    exit 1
fi

for item in "$@"; do
    if [ ! -e "$item" ]; then
        echo "Erro: '$item' não existe. Backup cancelado."
        exit 1
    fi
done

echo "Itens a serem incluídos no backup: $@"

tar -czf "$BACKUP_NAME" "$@"

if [ $? -eq 0 ]; then
    echo "Backup criado com sucesso: $BACKUP_NAME"
else
    echo "Erro ao criar o backup."
    exit 1
fi
