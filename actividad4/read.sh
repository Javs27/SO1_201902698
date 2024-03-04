#!/bin/bash

# El primer argumento es el nombre del pipe
PIPE=$1
# El segundo argumento es el identificador del usuario (opcional)
USER_ID=${2:-"Usuario"}

trap "rm -f $PIPE" EXIT

while true; do
    if read line <$PIPE; then
        echo "$USER_ID: $line"
    fi
done

