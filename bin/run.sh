PORT=6612
#JAVA=java
JAVA=/usr/java/jdk1.7.0_71/bin/java

ORQUESTADOR_CONTROLADOR=orchestrator-1.3.12-controlador.jar 
ORQUESTADOR_GESTION=orchestrator-1.3.12-gestion.jar
ORQUESTADOR_CONCILIACION=orchestrator-1.3.12-conciliacion.jar
TRANSMISOR=connectorservice-1.3.6.jar
PORTALUTILS=portalUtilsService-2.0.1.jar
SENDMESSAGE=sendmessage-service-1.0.0.jar
TIMEZONE=America/Chile

cd $HOME/bin
stop.sh ${PORT}
echo Levantando servicio monitor:
echo ----------------------------
nohup ./pcom004p -${PORT} +d$HOME/var/log > /dev/null &

echo Levantando servicio sendmessage
echo ----------------------------
nohup ${JAVA} -Duser.timezone="${TIMEZONE}" -jar -Xms10M -Xmx50M -XX:MaxPermSize=10m -server ${SENDMESSAGE} -monitorHost localhost -monitorPort ${PORT} -serviceName SENDM* -poolSize 50 -loggerlevel 0 > /dev/null &

echo Levantando orquestador controlador
echo ----------------------------
nohup ${JAVA} -Duser.timezone="${TIMEZONE}" -jar -Xms10M -Xmx50M -XX:MaxPermSize=10m -server ${ORQUESTADOR_CONTROLADOR} -monitorHost localhost -monitorPort ${PORT} -serviceName ORC00* -poolSize 50 -loggerlevel 0 -hotdeploy -asyncCommands > /dev/null &

echo Levantando orquestador gestion
echo ----------------------------
nohup ${JAVA} -Duser.timezone="${TIMEZONE}" -jar -Xms10M -Xmx50M -XX:MaxPermSize=10m -server ${ORQUESTADOR_GESTION} -monitorHost localhost -monitorPort ${PORT} -serviceName ORC02* -poolSize 50 -loggerlevel 0 -hotdeploy -asyncCommands > /dev/null &

echo Levantando orquestador conciliacion
echo ----------------------------
nohup ${JAVA} -Duser.timezone="${TIMEZONE}" -jar -Xms10M -Xmx10M -XX:MaxPermSize=10m -server ${ORQUESTADOR_CONCILIACION} -monitorHost localhost -monitorPort ${PORT} -serviceName ORC0C* -poolSize 50 -loggerlevel 0 -hotdeploy -asyncCommands > /dev/null &

echo Levantando transmisor
echo ----------------------------
nohup ${JAVA} -Djavax.net.ssl.trustStore=hub_keystore -Djavax.net.ssl.trustStorePassword=as123456 -Dhttps.protocols=TLSv1 -Duser.timezone="${TIMEZONE}" -jar -Xms10M -Xmx200M -XX:MaxPermSize=50m -server  ${TRANSMISOR} -monitorHost localhost -monitorPort ${PORT} -serviceName TRANS* -poolSize 50 -loggerlevel 0 -corelog > /dev/null &

echo Levantando portal utils
echo ----------------------------
nohup ${JAVA} -Duser.timezone="${TIMEZONE}" -jar -Xms10M -Xmx10M -XX:MaxPermSize=10m -server  ${PORTALUTILS} -monitorHost localhost -monitorPort ${PORT} -serviceName UTL01* -poolSize 50 -loggerlevel 0 > /dev/null &

echo Procesos en ejecucion:
echo ----------------------
echo
ps -f | grep -v grep | grep -v bash | grep -v ps
echo

