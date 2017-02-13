#se ejecuta run_carga_concilia.sh [convenio] [fecha=yyyymmdd]

ID_USER=$(id)
echo $ID_USER > $HOME/var/log/rendiciones/carga/id_user.log
PATH_SHELL=$HOME/rendiciones

LOG_TEMPORAL=$HOME/var/log/rendiciones/carga/lastExecution.log
MSG_TMP=$HOME/var/log/rendiciones/carga/lastMessage.log

START_TIME=`date`
START_TS=`date +%s`
PARAM_INSTANCIA=instance=`echo instance.xml`

cd $PATH_SHELL


HOST=127.0.0.1
PORT=6612
SERVICE=ORC0C


update() {
	echo "UPDATE estado:$1 file:$2" >> $LOG_TEMPORAL
	msg $1 $2
	java -jar $HOME/bin/sendmessage-1.0.0.jar --host $HOST --port $PORT --service $SERVICE --message $HOME/bin/msg_template.xml -Pestado=$1 -Pfilename=$2 > /dev/null 2>&1
	echo "java -jar $HOME/bin/sendmessage-1.0.0.jar --host $HOST --port $PORT --service $SERVICE --message $HOME/bin/msg_template.xml -Pestado=$1 -Pfilename=$2 " >> $LOG_TEMPORAL
}

echo "EJECUTANDO RUN_CARGA_CONCILIA.SH">$LOG_TEMPORAL
echo -e "\n"
## ENTRADAS ##
echo "-->CONVENIO:"$1>>$LOG_TEMPORAL
echo "-->FECHA:"$2>>$LOG_TEMPORAL
echo "-->ARCHIVO:"$3>>$LOG_TEMPORAL
echo "-->ID_CARGA:"$4>>$LOG_TEMPORAL
echo -e "\n"
ID_CARGA=$4


update "SHELL_INICIO_CONCILIACION" $3
#si falta el parametro fecha termina execucion de shell
if [ "$1" = "" ]
then
  echo 'Falta parametro de ejecucion: convenio' >> $LOG_TEMPORAL
  update "SHELL_ERROR_CONCILIACION_CONVENIO_NULL" $3
  exit 1
fi

if [ "$2" = "" ]
then
  echo 'Falta parametro de ejecucion: fecha=yyyymmdd' >> $LOG_TEMPORAL
  update "SHELL_ERROR_CONCILIACION_FECHA_NULL" $3
  exit 1
fi



echo "" >> $LOG_TEMPORAL
echo "Cargando archivo......" $3 >> $LOG_TEMPORAL
cd carga 

carpeta="archivosCarga"

# Se borran todos los otros  archivos que se encuentran en la carpeta. XD
find $carpeta -iname "*.*" -not \( -iname "$3" \) -delete

# se borran todos los archivos sin extension
#for fichero in $(ls -1 $carpeta)
#do case $fichero in   
#   $3)        echo "" ;;
#   *)       
#   rm $carpeta/$fichero ;;
#esac
#done

echo "----- FORMADO ARCHIVO ----">>$LOG_TEMPORAL
echo "Creando archivo...">>$LOG_TEMPORAL
#corrige finales de linea a archivos generador por windows
sed -e '$a\' $carpeta/$3 > $carpeta/$3.unix
mv $carpeta/$3.unix $carpeta/$3

awk -F"|" 'BEGIN { OFS = "|" } {a=sub(/\./,".",$4);if (a>0) $4=$4*100; else $4;print}' $carpeta/$3 >> $carpeta/$3.tmp

mv $carpeta/$3.tmp $carpeta/$3
echo "----- FORMADO ARCHIVO END----">>$LOG_TEMPORAL



#ejecuta el cargador 
echo "Realizando carga del Convenio ('$1')" >> $LOG_TEMPORAL
PARAM_INSTANCIA=instance=`echo instance.xml`
update "SHELL_INICIO_CARGA" $3
echo "--- EJECUTANDO  GenericDataLoad ---">> $LOG_TEMPORAL

echo "java -jar -Xms10M -Xmx10M -XX:MaxPermSize=10m -Dloader.filename=$3 genericdataload.jar gprey.xml" >> $LOG_TEMPORAL
java -jar -Xms10M -Xmx10M -XX:MaxPermSize=10m -Dloader.filename=$3 genericdataload.jar gprey.xml >> $LOG_TEMPORAL

###java -jar -Xms10M -Xmx10M -XX:MaxPermSize=10m GenericDataLoad_3.0.1.jar gprey.xml >> $LOG_TEMPORAL
###java -jar -Xms10M -Xmx10M -XX:MaxPermSize=10m GenericDataLoad-1.2.0.jar pruebaBios2.xml >> $LOG_TEMPORAL

echo "--- GenericDataLoad END ---">> $LOG_TEMPORAL

#Ejecucón de script de prueba
update "SHELL_CARGA_OK" $3
SortPID1=$!

wait $SortPID1


#busca el id de carga en el log del cargador generico 

#declare $(awk '/IdCarga : /{c=$3}END{print "ID_CARGA="c}' $LOG_TEMPORAL)

echo "id carga:$ID_CARGA " >> $LOG_TEMPORAL
if [ "$ID_CARGA" = "" ]
then
  echo "Error en la carga" >> $LOG_TEMPORAL
  update "SHELL_ERROR_ID_CARGA_NULL" $3
  exit 1
fi

LOAD_END_TIME=`date`
echo "Carga ejecutada" >> $LOG_TEMPORAL



echo "Ejecutando Conciliacion......" >> $LOG_TEMPORAL
cd ../cuadratura

FECHAPRO=`echo $2`
PARAM=idcarga=`echo $ID_CARGA`

  
#ejecuta conciliacion enviando como parametro la fecha y el id de carga 

echo "Convenio : $1" >> $LOG_TEMPORAL
echo "Fecha : $2" >> $LOG_TEMPORAL
echo "ID_carga : $PARAM"  >> $LOG_TEMPORAL
echo "Instance: $PARAM_INSTANCIA" >> $LOG_TEMPORAL
echo "./run_cuadratura.sh $FECHAPRO $PARAM $PARAM_INSTANCIA" >> $LOG_TEMPORAL

update "SHELL_INICIO_CUADRATURA" $3

./run_cuadratura.sh $FECHAPRO $PARAM $PARAM_INSTANCIA


cd ..

echo "RUN_CUADRATURA DONE" >> $LOG_TEMPORAL

END_TIME=`date +%s`
ELAPSED=`expr $END_TIME - $START_TS`

HOURS=$(($ELAPSED/3600))
MINUTES=$(($ELAPSED/60))
SECONDS=$(($ELAPSED%60))

echo 
echo "----------------------------------------------------" >> $LOG_TEMPORAL
echo "Proceso iniciado:   $START_TIME" >> $LOG_TEMPORAL
echo "Carga terminada :   $LOAD_END_TIME" >> $LOG_TEMPORAL
echo "Conciliacion terminada en: " `date` >> $LOG_TEMPORAL
echo "Tiempo total: " `date -d $HOURS:$MINUTES:$SECONDS +%H:%M:%S` >> $LOG_TEMPORAL
echo "----------------------------------------------------" >> $LOG_TEMPORAL

exit 0


