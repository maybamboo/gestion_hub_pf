<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

       <message>
          <header>
            <msg_type>runShell</msg_type>
            <action>runShell</action>
          </header>
          <body>
              <data>
                  <shell_path>/disk1/gestion_hub_pf/rendiciones/datamove/</shell_path>
                  <shell_name>datamove.sh</shell_name>
		  <parameters_mask>{param}</parameters_mask>
                  <parameters>
                      <shellparam>
                        <name>{param}</name>
                        <value>1</value>
                      </shellparam>
                  </parameters>
              </data>          
          </body>
       </message>                

    
	</xsl:template>
</xsl:stylesheet>
