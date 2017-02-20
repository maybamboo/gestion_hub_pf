<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">



      <xsl:variable name="fecha">
          <xsl:choose>
          <!--flujo continuar ingreso-->
           <xsl:when test="/request-context/request/request/parametros">
              <xsl:value-of select="/request-context/request/request/parametros/in_fecha" />
           </xsl:when>
           <!--flujo ingresar-->
           <xsl:otherwise>
             <xsl:value-of select="/request-context/request/message/body/in_fecha" />
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
                  <shell_name>run_carga_concilia.sh</shell_name>
                  <parameters_mask>{p_convenio} fecha={p_fecha} {p_archivo} {folio}</parameters_mask>
                  <parameters>				  
					<shellparam>
						<name>{p_convenio}</name>
						<value><xsl:value-of select="/request-context/request/message/body/convenio" /></value>
					</shellparam>

					<shellparam>
			                        <name>{p_fecha}</name>
						<value><xsl:value-of select="$fecha" /></value>
					</shellparam>

				        <shellparam>
			                         <name>{p_archivo}</name>
			                         <value><xsl:value-of select="/request-context/request/message/body/filename" /></value>
			                </shellparam>

                                        <shellparam>
                                                  <name>{folio}</name>
                                                  <value><xsl:value-of select="/request-context/request/message/body/folio" /></value>
                                        </shellparam>
		  
                  </parameters>
              </data>          
          </body>
       </message>

    
	</xsl:template>
</xsl:stylesheet>
