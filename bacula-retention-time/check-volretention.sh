#!/bin/bash

# Nome do Script: check-volretention.sh
# Descrição:      Script para verificação do tempo de expiração de todos os volumes
# Autor:          Marcus Molinero
# Contato:        marcusmolinero@nomalad.com.br
# Versão:         0.0.2
# Data:           17/07/2025
# Atualização:    17/07/2025 - Listagem de volumes separadas por pool
# Licença:        GNU GPLv3

for POOL in $(echo list pools | bconsole | awk 'NR >= 10 && NR < 24 { print $4}')
do
  echo ===== POOL $POOL =====
  echo llist pool=$POOL | bconsole | grep -e name -e volretention
  echo
  for VOLUME in $(echo list media pool=$POOL | bconsole | grep FULL | awk '{print $4}')
  do
    echo llist volume=$VOLUME | bconsole | grep -e volumename -e volretention
  done
done
