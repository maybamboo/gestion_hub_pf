#Posibles parametros: [fecha=yyyymmdd] [diasantes=n] [horaini=hhmmss] [diasdespues=n] [horafin=hhmmss] [instancia=instancia.xml] [horaArchivo=hhmm] [recaudador_id=s]
#ejemplo con parametros =  ./genera_archivo_rendicion.sh fecha=20140415 diasantes=2 horaini=000000 diasdespues=1 horafin=235959 instancia=instancia.xml horaArchivo=1553 recaudador_id=SVP
#./genera_archivo_rendicion.sh fecha=20141002 recaudador_id=SVP
#./genera_archivo_rendicion.sh fecha=20141002 recaudador_id=BEST
#./genera_archivo_rendicion.sh fecha=20141002 recaudador_id=SEN
#./genera_archivo_rendicion.sh fecha=20141002 recaudador_id=CHX

#algunas variables 
PATH_SHELL=$HOME/rendiciones/generacion
FECHA_PROCESO='fecha='`date +%Y%m%d`
HORA_PROCESO='horaArchivo='`date +%H%M`
INSTANCIA_XML='instancia=archivo_rendicion_bios.xml'

LOG=$HOME"/var/log/rendiciones/generacion/bios_rendicion.log"

#PERIODO_EJECUCION_MINUTOS=30
#HORA_INICIO=`date --date '-'$PERIODO_EJECUCION_MINUTOS' min' +%H%M%S`

echo "EJECUTANDO BIOS_RENDICION.SH">$LOG

#Se verifican parametros, si no viene la fecha, hora e instancia se setean parametros de sistema por defecto
for var in "$@"
do
    echo "argumento: $var" >> $LOG    
    if [[ $var == *fecha=* ]] 
    then
     FECHA_PROCESO=$var 
     echo "Se Utiliza Fecha Ingresada por Parametro: $FECHA_PROCESO" >> $LOG
    elif [[ $var == *horaArchivo* ]] 
    then
      HORA_PROCESO=$var 
      echo "Se Utiliza Fecha Ingresada por Parametro: $HORA_PROCESO" >> $LOG
	elif [[ $var == *recaudador_id* ]]
	then	
		RECAUDADOR=$var
		 echo "Se Utiliza el valor de recaudador ingresado: $RECAUDADOR" >> $LOG
			if [[  $RECAUDADOR = 'recaudador_id=SVP' || $RECAUDADOR = 'recaudador_id=SVPX' ]]
			then
				INSTANCIA_XML='instancia=archivo_rendicion_servipag.xml'
				echo "Se Utiliza instancia para servipag : $RECAUDADOR" >> $LOG
			elif [[  $RECAUDADOR = 'recaudador_id=CHX' ]]
			then
				INSTANCIA_XML='instancia=archivo_rendicion_chilexpress.xml'
				echo "Se Utiliza instancia para chilexpress: $RECAUDADOR" >> $LOG
			elif [[  $RECAUDADOR = 'recaudador_id=BEST' ]]
			then
				INSTANCIA_XML='instancia=archivo_rendicion_bcoestado.xml'
				echo "Se Utiliza instancia para banco estado: $RECAUDADOR" >> $LOG
				elif [[  $RECAUDADOR = 'recaudador_id=SEN' ]]
			then
				INSTANCIA_XML='instancia=archivo_rendicion_sencillito.xml'
				echo "Se Utiliza instancia para sencillito: $RECAUDADOR" >> $LOG
			fi
				echo "Sale....: $RECAUDADOR" >> $LOG
	else  
	  echo "Entra al else" >> $LOG
	  #INSTANCIA_XML='instancia=archivo_rendicion_all.xml'
	  #echo "Se Utiliza instancia que ejecuta todos los archivos de recaudadores"
      PARAMS=$PARAMS`echo ' '$var`      
    	
	
fi
	
	
done
PARAMS=$PARAMS`echo ' '$FECHA_PROCESO` 
PARAMS=$PARAMS`echo ' '$HORA_PROCESO`
PARAMS=$PARAMS`echo ' '$INSTANCIA_XML`

echo "Argumentos: $PARAMS" >> $LOG

cd $PATH_SHELL

#carga los plugines para generacion
PLUGIN=""
for f in plugins/*.jar
do
	PLUGIN=$PLUGIN:$f
done
echo "Plugin: $PLUGIN" >> $LOG
echo "Plugin: ${PLUGIN:1}" >> $LOG

#ejecuta el jar que genera los archivos
#java -Xms50m -Xmx50m -cp generacion.jar:${PLUGIN:1}:lib/generacion-lib.jar:lib/xml-apis.jar:lib/jdom.jar:lib/jvftp.jar:lib/libs-transfer.jar:lib/iText-2.1.7.jar:lib/dom4j-2.0.0-ALPHA-2.jar:lib/generacion-lib.jar:lib/libs-template.jar:lib/javamail.jar:lib/libs-javaCommons.jar:lib/libs-messaging.jar:lib/libs-network.jar:lib/log4j-1.2.8.jar:lib/ojdbc14.jar::lib/postgresql-8.3-606.jdbc3.jar:lib/xercesImpl.jar:lib/jsch-0.1.50.jar:lib/jxl.jar:/repository/apps/enterprise_hub/batch/paymentsDetails/trunk/rendiciones-plugin.jar eft.generacion.Principal $PARAMS  >> $LOG

java -Xms50m -Xmx50m -cp filegenerator-2.2.7.jar:${PLUGIN:1}:lib/filegenerator-lib-2.2.8.jar:lib/xml-apis.jar:lib/jdom.jar:lib/jvftp.jar:lib/libs-transfer.jar:lib/iText-2.1.7.jar:lib/dom4j-2.0.0-ALPHA-2.jar:lib/filegenerator-lib.jar:lib/libs-template.jar:lib/javamail.jar:lib/libs-javaCommons.jar:lib/libs-messaging.jar:lib/libs-network.jar:lib/log4j-1.2.8.jar:lib/ojdbc14.jar::lib/postgresql-8.3-606.jdbc3.jar:lib/xercesImpl.jar:lib/jsch-0.1.50.jar:lib/jxl.jar:/repository/apps/enterprise_hub/batch/paymentsDetails/trunk/rendiciones-plugin.jar eft.filegenerator.Principal $PARAMS  >> $LOG

#sincroniza el estado de rendicion en PAGO de la transaccional

DATE=$(echo $FECHA_PROCESO | sed 's/fecha=//g')
echo "DATE :"$DATE >> $LOG
FECHA_TRX=$(date -d $DATE +'%d/%m/%y')
echo "FECHA_TRX :"$FECHA_TRX >> $LOG

echo "NOTIFICANDO ESTADO RENDICION A PAGO EN TRANSACCIONAL" >> $LOG
java -jar notifier-2.0.2.jar -f estado_rendicion.xml -Pfecha_trx=$FECHA_TRX >> $LOG

echo "Done :)" >> $LOG
 
