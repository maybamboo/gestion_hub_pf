<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:variable name="pageSize" select="'20'" />	
	<xsl:variable name="page" select="/request-context/request/message/body/page - 1" />  
  
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>bd_hub_trx</datasource>
			        <outputType>xlsx</outputType>
				<outputName>DetalleConciliacionHR</outputName>
			        <outputLimit><xsl:value-of select="/request-context/request/message/body/limite_excel" /></outputLimit>         
			</properties>
					
		        <additional>
		          <mapeos>
		            <column column-position="4">

                		<!--<xsl:for-each select="/request-context/services-responses/conciliacion-detalle-todo/obtener-recaudadores/agreements/response/collectors/collector">-->
		                <xsl:for-each select="/request-context/services-responses/conciliacion-detalle-todo/obtener-recaudadores/response/data/Results/Row">

                			 <!--<mapeo from="{code}"><xsl:value-of select="name" /></mapeo>--> 
 		                	<mapeo from="{ID_REC}"><xsl:value-of select="NOM_REC" /></mapeo>

               			</xsl:for-each>                                         
		            </column>
		          </mapeos>
        		</additional> 
                  					
			<data>
			    <!-- CALL PKG_GESTION_RENDICION.CONCILIACION_DET_TODO('<xsl:value-of select='/request-context/request/message/body/id_carga' />') -->
			    CALL PKG_RENDICION.CONCILIACION_DET_TODO('<xsl:value-of select='/request-context/request/message/body/id_carga' />') 				
			</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


