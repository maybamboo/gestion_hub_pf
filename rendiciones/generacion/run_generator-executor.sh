FECHA_PROCESO=' '`date +%Y%m%d`
JAVA="/usr/java/jdk1.7.0_71/bin/java"

LOG=$HOME"/var/log/rendiciones/generacion/run_generator-executor.log"
  

if [ $# -eq 1 ]; then
	FECHA_PROCESO=$1;
fi


echo "Ejecutando: $JAVA generator-executor-0.0.1.jar $FECHA_PROCESO";
$JAVA -jar generator-executor-0.0.1.jar $FECHA_PROCESO >> $LOG

echo "Proceso de rendicion terminado."



