LOG=$HOME/var/log/rendiciones/cuadratura/run_cuadratura.log
echo "Ejecutando conciliador con parametros: $1 $2 $3" > $LOG

LIBDIR="lib"
DEPENDENCIES=properties/dependencies

DEPS=""
while read line
do
DEPS="$DEPS:$LIBDIR/$line"
done < $DEPENDENCIES
DEPS=${DEPS:1}

PLUGIN=""
for f in plugins/*.jar
do
	PLUGIN=$PLUGIN:$f
done
PLUGIN=${PLUGIN:1}

#java -Xms50m -cp reconciliation.jar:$PLUGIN:$DEPS eft.bankreconciliation.Principal $1 $2 $3 >> lastExecution.log
java -Xms50m -cp reconciliation.jar:$PLUGIN:$DEPS eft.bankreconciliation.Principal $1 $2 $3 >> $LOG

if [ $? -ne 0 ]; then 
	echo Hubo Error en el proceso de cuadratura. >> $LOG
	exit 1
else
	echo Proceso de cuadratura finalizado. >> $LOG
	exit 0
fi



