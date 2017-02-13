<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:template match="/">
            <transmission>
            	<type>basedatos</type>
	            <properties>
                   <datasource>bd_hub_trx</datasource>					       
	            </properties>
              				  
					  <data>	    
              
              update  resumen_conciliacion 
              set     ESTADO='ERROR_CARGA' 
               where NOMBRE_ARCHIVO = '<xsl:value-of select="/request-context/request/message/body/data/filename" />' and estado is null                            			
					  </data>				  				               
            </transmission>
      </xsl:template>
</xsl:stylesheet>
