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
                  <shell_name>update_neto.sh</shell_name>
                  <parameters_mask>{num_convenio} {decimales}</parameters_mask>
                  <parameters>

                      <shellparam>
                        <name>{num_convenio}</name>
                        <value><xsl:value-of select='/request-context/services-responses/resultado_conciliacion_actualizar_estado/datos_carga/response/data/Results/Row/NUM_CONVENIO' /></value>
                      </shellparam>

                      <shellparam>
                        <name>{decimales}</name>
                        <value><xsl:value-of select='/request-context/services-responses/resultado_conciliacion_actualizar_estado/obtener_decimales/response/data/Results/Row/DECIMALES' /></value>
                      </shellparam>

                  </parameters>
              </data>          
          </body>
       </message>                

    
	</xsl:template>
</xsl:stylesheet>
