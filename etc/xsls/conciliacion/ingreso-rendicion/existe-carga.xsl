<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:ext="http://exslt.org/common"  exclude-result-prefixes="ext">
                         
                         
      <xsl:variable name="variables">
        <xsl:choose>
          
          <!--flujo continuar ingreso-->
          <xsl:when test="/request-context/request/request/parametros">
            <in_fecha><xsl:value-of select="/request-context/request/request/parametros/in_fecha" /></in_fecha>
            <collector><xsl:value-of select="/request-context/request/request/parametros/collector" /></collector>
            <contract><xsl:value-of select="/request-context/request/request/parametros/contract" /></contract>            
          </xsl:when>
          
          <!--flujo ingresar-->
          <xsl:otherwise>
            <in_fecha><xsl:value-of select="/request-context/request/message/body/data/in_fecha" /></in_fecha>
            <collector><xsl:value-of select="/request-context/request/message/body/data/collector" /></collector>
            <contract><xsl:value-of select="/request-context/request/message/body/data/contract" /></contract>
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
                to_char(FECHA_CARGA, 'yyyyMMdd')  = '<xsl:value-of select="ext:node-set($variables)/in_fecha" />' 
                and RECAUDADOR_ID = '<xsl:value-of select="ext:node-set($variables)/collector" />'
                and NUM_CONVENIO = '<xsl:value-of select="ext:node-set($variables)/contract" />' 
                and estado not in ('ERROR_CARGA','NO_ACEPTADO','NO_AUTORIZADO')
                order by id_carga desc                            			
					  </data>				  				               
            </transmission>
      </xsl:template>
</xsl:stylesheet>
