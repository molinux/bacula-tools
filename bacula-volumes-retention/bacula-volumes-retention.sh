#!/bin/bash

# ==========================================================
# Script Name: update-volumes-retention.sh
# Description: Use this script if you need to update all volumes retention from a specific pool
# Author: Marcus Molinero <marcusmolinero@nomaland.com.br>
# Created: 2025-08-11
# Version: 1.0
# Usage: ./update-volumes-retention.sh
# Notes: Ensure you have execute permissions (chmod +x).
# ==========================================================

RED='\033[0;31m'
NC='\033[0m'


# Exibe ajuda se -h for passado como argumento
if [[ "$1" == "-h" ]]; then
  echo "# =========================================================="
  echo "# Script Name: update-volumes-retention.sh"
  echo "# Description: Use this script if you need to update all volumes retention from a specific pool"
  echo "# Author: Marcus Molinero <marcusmolinero@nomaland.com.br>"
  echo "# Created: 2025-08-11"
  echo "# Version: 1.0"
  echo "# Usage: ./update-volumes-retention.sh"
  echo "# Notes: Ensure you have execute permissions (chmod +x)."
  echo "# =========================================================="
  exit 0
elif [[ $# -gt 0 && "$1" != "-h" ]]; then
  echo
  echo "Usage: ./update-volumes-retention.sh [-h]"
  echo
  exit 0
else [[ $# -eq 0 ]]

echo
echo "===== POOLS Disponiveis ====="
echo
echo list pools | bconsole | awk 'NR >= 10 {print $4}'
echo "================="
echo
echo -n "Digite o nome da POOL: "
read POOL
echo
echo "======== Tempo de retencao ========"
echo
echo -e "${RED}  ATENCAO !!! Colocar entre aspas !!! ${NC}"
echo
echo "Exemplos: \"3 weeks\", \"7 days\", \"2 year\""
echo
echo
echo -n "Tempo: "
read RETENTION

# Checks if retention time was assigned without double quotes
if [[ ! "$RETENTION" =~ ^\".*\"$ ]]; then
  echo -e "${RED}Erro: O tempo de retenção deve estar entre aspas duplas.${NC}"
  exit 1
fi

# OK, let's do it !
echo
echo
for volume in $(echo list media pool=$POOL | bconsole | grep $(echo llist pool=$POOL | bconsole | grep labelformat | cut -d\: -f2) | awk '{print $4}')
  do
    echo update volume=$volume volretention="$RETENTION" | bconsole
done

fi
