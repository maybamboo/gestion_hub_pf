#!/bin/sh

if [ $# -eq 2 ]
  then
    java -jar dbextractor-0.0.1.jar -f pago_trx.xml -Pfilename=$1 -Pfecha=$2
  else
   echo "run.sh <filename> <date>"
fi
