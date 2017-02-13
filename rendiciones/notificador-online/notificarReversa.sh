DATE=$(date "+%m%d%Y")
TIME=$(date +"%d%m%Y %T")
FECHA_EFT=$(date +"%d/%m/%y")
TIEMPO_EFT=$(date +"%T")

LOG=$HOME"/var/log/notificador/notificarReversa"$DATE".log"
DIR=$HOME"/rendiciones/notificador-online/"


JAR="notifier-2.0.4.jar"

cd $DIR

echo "-----------------------------">> $LOG
echo $TIME" EJECUTANDO NOTIFICADOR REVERSA ">> $LOG
echo "-----------------------------">> $LOG

echo "-->NUM_CONVENIO :"$1 >> $LOG
echo "-->FECHA_TRX :"$2 >> $LOG
echo "-->FECHA_EFT :"$FECHA_EFT >> $LOG

java -jar $JAR -f notificarReversa.xml -Pnum_convenio=$1 -Pfecha_trx=$2 -Pfecha_eft=$FECHA_EFT -Ptiempo_eft=$TIEMPO_EFT>> $LOG


echo "-----------------------------">> $LOG
echo $TIME" SYNC NOTIFICACIONES REVERSA">>$LOG
echo "-----------------------------">> $LOG
java -jar $JAR -f notificarReversaSync.xml -Pnum_convenio=$1 -Pfecha_trx=$2 >> $LOG


echo $TIME" Done :)">>$LOG
