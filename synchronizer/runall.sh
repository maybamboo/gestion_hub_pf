#!/bin/sh
cd $HOME/synchronizer

dump_documento=documento
dump_pago=pago
log="$HOME/var/log/novedades/lastExecution.log"

if [ "${1}" = "" ]
  then
    date_to_use="$(date "+%Y%m%d" -d "1 days ago")"
  
  else
    date_to_use=$1

fi

echo sincronizando tablas con fecha: $date_to_use

cd extractor

./dump_documento.sh $dump_documento $date_to_use > $log

return_extract_doc=$?

./dump_pago.sh $dump_pago $date_to_use >> $log

return_extract_pag=$?

cd ..

cd documento
./run.sh $dump_documento $date_to_use >> $log

return_doc=$?

cd ..

cd pago 
./run.sh $dump_pago $date_to_use >> $log

return_pag=$?

cd ..

echo $return_extract_doc >> $log
echo $return_extract_pag >> $log
echo $return_doc >> $log
echo $return_pag >> $log
exit $((return_extract_doc + return_extract_pag + return_doc + return_pag))
