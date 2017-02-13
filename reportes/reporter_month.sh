#!/bin/sh
yearmonth=$(date +%Y%m -d "1 month ago");

last=$(cal $(date +"%m %Y") | awk 'NF {DAYS = $NF}; END {print DAYS}')

FEC_INI=${yearmonth}'01';
FEC_FIN=${yearmonth}${last};

/usr/java/jdk1.7.0_71/bin/java -cp libs/coreLib.jar:libs/saxon9-dom.jar:libs/saxon9.jar:libs/saxon9-s9api.jar:libs/xelem.jar:report-generator-1.1.1.jar com.paygroup.hr.reporter.Main -Pfec_ini=${FEC_INI} -Pfec_fin=${FEC_FIN} -f $*
