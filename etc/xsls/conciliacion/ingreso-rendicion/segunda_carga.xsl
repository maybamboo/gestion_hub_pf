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
				SELECT 1 as existe,  id_carga, nombre_archivo, estado 
				FROM RESUMEN_CONCILIACION 
				WHERE NUM_CONVENIO='<xsl:value-of select="/request-context/request/message/body/data/convenio" />' 
				AND RECAUDADOR_ID=<xsl:value-of select="/request-context/request/message/body/data/doc_rec" />
				AND TRUNC(FECHA_CARGA)= to_date('<xsl:value-of select="/request-context/request/message/body/data/in_fecha" />' ,'YYYYMMDD')
				AND ESTADO != 'PRECONCILIADO' 
				AND ESTADO != 'ACEPTADO' 
				AND ESTADO != 'AUTORIZADO' 
				AND ESTADO != 'SHELL_ERROR_CONCILIACION_CONVENIO_NULL'
				AND ESTADO != 'SHELL_ERROR_CONCILIACION_FECHA_NULL'
				AND ESTADO != 'SHELL_ERROR_ID_CARGA_NULL'
				
			  </data>				  				               
            </transmission>
      </xsl:template>
</xsl:stylesheet>
