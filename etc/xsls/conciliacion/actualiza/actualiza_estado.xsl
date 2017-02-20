<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="/">
            <transmission>
                <type>basedatos</type>
                    <properties>
                   <datasource>bd_hub_trx</datasource>                                               
                    </properties>
                                          
                                          <data>            
              update  resumen_conciliacion set 
               ESTADO= '<xsl:value-of select="/request-context/request/message/body/estado" />'
               where NOMBRE_ARCHIVO = '<xsl:value-of select="/request-context/request/message/body/filename" />'                                                 
                                          </data>                                                                              
            </transmission>
      </xsl:template>
</xsl:stylesheet>
