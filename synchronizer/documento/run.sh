#!/bin/sh

if [ $# -eq 2 ]
  then
    echo Cargando novedades tabla documento con fecha $2
    java -jar differences-0.2.1.jar  -run control-files/$1_$2.txt -P fecha=$2
  else
   echo "run.sh <filename> <date>"
fi

