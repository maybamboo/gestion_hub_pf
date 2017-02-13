<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:ext="http://exslt.org/common"  exclude-result-prefixes="ext">
                         
                         
      <xsl:variable name="variables">
        <xsl:choose>
                    
          <!--flujo continuar ingreso-->
          <xsl:when test="/request-context/request/request/parametros">
            <filename><xsl:value-of select="/request-context/request/request/parametros/filename" /></filename>
            <checksum><xsl:value-of select="/request-context/request/request/parametros/checksum" /></checksum>
            <rutaTemporal><xsl:value-of select="/request-context/request/request/parametros/rutaTemporal" /></rutaTemporal>
            
          </xsl:when>
          
          <!--flujo ingresar-->
          <xsl:otherwise>
            <filename><xsl:value-of select="/request-context/request/message/body/data/filename" /></filename>
            <checksum><xsl:value-of select="/request-context/request/message/body/data/checksum" /></checksum>
            <rutaTemporal><xsl:value-of select="/request-context/request/message/body/data/rutaTemporal" /></rutaTemporal>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable> 
      

	<xsl:template match="/">

       <message>
          <header>
            <msg_type>runShell</msg_type>
            <!--date></date-->
            <action>runShell</action>
          </header>
          <body>
              <data>
                  <shell_path>/disk1/gestion_hub_pf/rendiciones/</shell_path>
                  <shell_name>borrar_archivo.sh</shell_name>
                  <parameters_mask>{archivo}</parameters_mask>                              
                  <parameters>
                      <shellparam>
                        <name>{archivo}</name>
                        <value><xsl:value-of select="ext:node-set($variables)/rutaTemporal" />/<xsl:value-of select="ext:node-set($variables)/filename" />.<xsl:value-of select="ext:node-set($variables)/checksum" /></value>
                      </shellparam>                      
                  </parameters>
              </data>          
          </body>
       </message>                

    
	</xsl:template>
</xsl:stylesheet>
