<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

       <message>
          <header>
            <msg_type>runShell</msg_type>
            <!--date></date-->
            <action>runShell</action>
          </header>
          <body>
              <data>
                  <shell_path>/disk1/gestion_hub_pf/rendiciones/notificador-online/</shell_path>
                  <shell_name>notificar.sh</shell_name>
                  <parameters_mask>{num_convenio} {fecha_trx}</parameters_mask>
                  <parameters>
		      <shellparam>
                        <name>{num_convenio}</name>
                        <value><xsl:value-of select="/request-context/services-responses/reporte_conciliacion_actualizar_estado_autoriza/obtiene-estado_carga/response/data/Results/Row/NUM_CONVENIO"/></value>
                      </shellparam>
                      <shellparam>
                        <name>{fecha_trx}</name>
                        <value><xsl:value-of select="/request-context/services-responses/reporte_conciliacion_actualizar_estado_autoriza/obtiene-estado_carga/response/data/Results/Row/FECHA_PROCESO"/></value>
                      </shellparam>
                  </parameters>
              </data>          
          </body>
       </message>                

    
	</xsl:template>
</xsl:stylesheet>
