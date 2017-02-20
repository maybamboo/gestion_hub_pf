<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      
      <xsl:variable name="checksum">
        <xsl:choose>
        
          <!--flujo continuar ingreso-->
          <xsl:when test="/request-context/request/request/parametros">
            <xsl:value-of select="/request-context/request/request/parametros/checksum" />
          </xsl:when>
          
          <!--flujo ingresar-->
          <xsl:otherwise>
            <xsl:value-of select="/request-context/request/message/body/data/checksum" />
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable> 
                      
      
      <xsl:template match="/">
            <transmission>
            	<type>basedatos</type>
	            <properties>
                   <datasource>bd_hub_trx</datasource>					       
	            </properties>				  
					  <data>	                                                        			
                select 1 as existe, id_carga, nombre_archivo, fecha_proceso, estado from resumen_conciliacion 
                where 
                checksum = '<xsl:value-of select="$checksum" />' 
                and estado not in (	'ERROR_CARGA',
                			'NO_ACEPTADO',
                			'NO_AUTORIZADO',
					'SHELL_ERROR_CONCILIACION_CONVENIO_NULL',
					'SHELL_ERROR_CONCILIACION_FECHA_NULL',
					'SHELL_ERROR_ID_CARGA_NULL'
                		)
                order by id_carga desc
					  </data>				  				               
            </transmission>
      </xsl:template>
</xsl:stylesheet>
