# Este script foi criado para auxiliar na execu▒▒o de processo pelo Lich.
#
# --------------------------------------------------------------------------------------------------------------------
#
# HISTÓRICO
#
#
#  v1.0.0       2017-11-20, David Melo:
# DEFINIÇÃO DE VARIÁVEIS
#
# HORA - Esta é a hora a ser atingida para execução do processo.
# MIN - Este é o minuto a ser atingido para execução do processo
# HORA_ATUAL - Esta é a hota corrente
# MIN_ATUAL - Este é o Min corrente
#


[ $(echo "$1"  | grep -e "^[0-9][0-9]:[0-5][0-9]$") ] || { echo -e "Formato da Hora Inválido, favor seguir o padrão HH:MM.\nExemplo: 06:00"; exit 0; }

HORA=$(echo "$1"  | grep -e "^[0-9][0-9]:[0-5][0-9]$" | cut -d ':' -f1)
MIN=$(echo "$1"  | grep -e "^[0-9][0-9]:[0-5][0-9]$" | cut -d ':' -f2)

while true; do

  HORA_ATUAL=$(date +%H)
  MIN_ATUAL=$(date +%M)

  if [ $HORA$MIN -lt $HORA_ATUAL$MIN_ATUAL ]
    then
    echo "Hora informada antecede o hor▒rio corrente"
    exit 0
  fi

    if [ "$HORA_ATUAL$MIN_ATUAL" -eq "$HORA$MIN" ]
      then
      sleep 10
      echo "Finalizando"
      exit 0
      else
      sleep 10
    fi

done
