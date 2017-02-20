DATE=$(date "+%m%d%Y")
TIME=$(date +"%d%m%Y %T")
FECHA_EFT=$(date +"%d/%m/%y")
TIEMPO_EFT=$(date +"%T")

LOG=$HOME"/var/log/notificador/notificar"$DATE".log"
DIR=$HOME"/rendiciones/notificador-online/"

JAR="notifier-2.0.4.jar"

cd $DIR

echo -e $TIME" \n ----------------------------- \n">> $LOG
echo $TIME" EJECUTANDO NOTIFICAR EPS ">> $LOG
echo -e $TIME" \n ----------------------------- \n">> $LOG
echo "-->NUM_CONVENIO :"$1 >> $LOG
echo "-->FECHA_TRX :"$2 >> $LOG

java -jar $JAR -f notificar.xml -Pnum_convenio=$1 -Pfecha_trx=$2 -Pfecha_eft=$FECHA_EFT -Ptiempo_eft=$TIEMPO_EFT>> $LOG

echo -e $TIME" \n ----------------------------- \n">> $LOG
echo "SYNC NOTIFICACIONES">>$LOG
echo -e $TIME" \n ----------------------------- \n">> $LOG

java -jar $JAR -f notificarSync.xml -Pnum_convenio=$1 -Pfecha_trx=$2>> $LOG
echo $TIME" Done :)">>$LOG
