#!/bin/bash
#
# Verificar o tempo de retencao para a data atual de cada Pool
# Verify the actual retention time of which Pool
#
# Script by Molinux <molinuxbr@gmail.com> | https://github.com/molinux
#
# Notas:
# 1- O .pgpass deve estar configurado, ou passar a senha como parametro
#
# Note:
# 1- The .pgpass file must be configured or the password need to be set
#
# TODO:
# Se o pgpass nao estiver configurado, tentar acessar passando login e senha


#
# Define: 
#
# DB_TYPE - mysql,pgsql,etc
# DB_NAME - Bacula Database Name
# DB_USER - Bacula Username
DB_TYPE=pgsql
DB_NAME=bacula
DB_USER=bacula
DB_HOST=127.0.0.1

# Verificar se existe o .pgpass ou se esta passando o login e senha do banco
function check_pgsql {
if [ ! -r $HOME/.pgpass ]
  then
    echo 
    echo "Ops... "
    echo "O arquivo pgpass nao existe ou nao esta acessivel"
    echo "Em caso de duvidas, consulte: "
    echo "https://www.postgresql.org/docs/current/static/libpq-pgpass.html"
    echo 
    exit 0
fi
}



case $DB_TYPE in
  mysql)
#    echo "Support to MySQL will be included in the next version. Sorry ! :-("
    QUERY="mysql -h $DB_HOST -u $DB_USER -p $DB_NAME -e"
    shift
    exit 0
    ;;
  pgsql)
    echo "PostgreSQL"
    check_pgsql
    QUERY="psql -w -h $DB_HOST -d $DB_NAME -U $DB_USER -t -c"
    shift
    ;;
  *)
   echo 
   echo "Support to $DBTYPE not included in this version. Sorry ! :-("
   echo
   exit 0
   ;;
esac




# Inicializar o Array limpo
unset POOLS
# Listar as Pools
for i in `$QUERY "SELECT name FROM pool"`
  do 
    POOLS+=($i)
  done

# Apresentar as Pools
echo
for ((m = 0; m < ${#POOLS[@]}; m++)) 
  do 
    echo "$m - POOL: ${POOLS[$m]}" 
  done
echo "$m - Todas as POOLS "
echo

# Definir qual a pool vai utilizar
echo -n "Defina a Pool: "
read p
echo

# Lista as medias da pool escolhida
function list_medias {
   echo "list media pool=${POOLS[p]}" | bconsole | grep ${POOLS[p]} | awk '{print $4,$24}' | sort -k2 | grep -v "|"
}

# LISTAR TODAS AS POOLS

# Ultima opcao deve ser para listar todas as Pools

if [ $p == ${#POOLS[@]} ]
  then
   echo "Listar todas as pools"
   echo
   for ((m = 0; m < ${#POOLS[@]}; m++))
     do 
       # Aqui esta listando todas as midias
       unset LASTDATE
       for n in `echo "list media pool=${POOLS[m]}" | bconsole | grep ${POOLS[m]} | awk '{print $4,$24}' | sort -k2 | grep -v "|"`
         do
           LASTDATE+=($n) 
         done

echo "POOL: ${POOLS[m]} $(((`date -d now +%s` - `date -d ${LASTDATE[1]//-} +%s`) / 86400)) dias de retencao" | awk '{ printf "%s %-20s %6s %s %s %s\n", $1,$2,$3,$4,$5,$6}' 
done

exit 0
fi 

# Pega a media mais antiga
unset LASTDATE
for m in `list_medias`
  do
#    if [ $m != "|" ]; then
      LASTDATE+=($m) 
#    fi
  done

echo
echo "POOL ${POOLS[p]}    :" $(((`date -d now +%s` - `date -d ${LASTDATE[1]//-} +%s`) / 86400)) dias de retencao
echo


#SELECT media.volumename,media.poolid,pool.name,pool.poolid FROM media,pool WHERE pool.poolid = media.poolid AND pool.name='BVS' ;


#Alguém tem algum Script que verifica o tempo de retenção /quantidade de volumes de uma pool e me diga /faça a exclusão dos volumes físicos do disco?


