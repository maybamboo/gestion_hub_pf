#!/bin/sh

FEC_INI=`date +%Y%m%d -d "1 day ago"`
FEC_FIN=`date +%Y%m%d -d "1 day ago"`

/usr/java/jdk1.7.0_71/bin/java -cp libs/coreLib.jar:libs/saxon9-dom.jar:libs/saxon9.jar:libs/saxon9-s9api.jar:libs/xelem.jar:report-generator-1.1.1.jar com.paygroup.hr.reporter.Main -Pfec_ini=${FEC_INI} -Pfec_fin=${FEC_FIN} -f $*
