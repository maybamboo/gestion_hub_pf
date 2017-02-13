DATE=$(date "+%m%d%Y")
TIME=$(date +"%d%m%Y %T")

LOG=$HOME"/var/log/notificador/update_neto"$DATE".log"
DIR=$HOME"/rendiciones/notificador-online/"

JAR="notifier-2.0.4.jar"

cd $DIR

echo -e $TIME" \n ----------------------------- \n">> $LOG
echo $TIME" EJECUTANDO UPDATE_NETO ">> $LOG
echo "-->NUM_CONVENIO :"$1 >> $LOG
echo "java -jar $JAR -f monto_neto.xml -Pnum_convenio=$1" >> $LOG
java -jar $JAR -f monto_neto.xml -Pnum_convenio=$1  -Pdecimales=$2 >> $LOG
echo $TIME" Done :)">>$LOG
