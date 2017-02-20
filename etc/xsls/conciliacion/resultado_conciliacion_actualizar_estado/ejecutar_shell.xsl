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
                  <shell_path>/disk1/gestion_hub_pf/rendiciones/notificacion/</shell_path>
                  <shell_name>run.sh</shell_name>
                  <parameters_mask>idCarga={p_idcarga}</parameters_mask>
                  <parameters>
                      <shellparam>
                        <name>{p_idcarga}</name>
                        <value><xsl:value-of select='/request-context/request/message/body/id_carga' /></value>
                      </shellparam>                    
                  </parameters>
              </data>          
          </body>
       </message>                

    
	</xsl:template>
</xsl:stylesheet>
