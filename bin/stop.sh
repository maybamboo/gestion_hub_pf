MONITOR=pcom004

ORQUESTADOR_CONTROLADOR=ORC00
ORQUESTADOR_GESTION=ORC02
ORQUESTADOR_CONCILIACION=ORC0C
TRANSMISOR=TRANS
PORTALUTILS=UTL01
SENDMESSAGE=SENDM


kill -9 `ps x | grep ${ORQUESTADOR_CONTROLADOR} | grep -v grep | awk '{print $1}'`
kill -9 `ps x | grep ${ORQUESTADOR_GESTION} | grep -v grep | awk '{print $1}'`
kill -9 `ps x | grep ${ORQUESTADOR_CONCILIACION} | grep -v grep | awk '{print $1}'`
kill -9 `ps x | grep ${TRANSMISOR} | grep -v grep | awk '{print $1}'`
kill -9 `ps x | grep ${PORTALUTILS} | grep -v grep | awk '{print $1}'`
kill -9 `ps x | grep ${SENDMESSAGE} | grep -v grep | awk '{print $1}'`
kill -9 `ps x | grep ${MONITOR} | grep -v grep | awk '{print $1}'`
