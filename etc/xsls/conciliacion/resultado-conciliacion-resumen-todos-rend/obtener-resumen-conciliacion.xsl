<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>bd_hub_trx</datasource>
			</properties>
		
				<!--<xsl:for-each select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/agreements/response/collectors/collector">-->
				<xsl:for-each select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/response/data/Results/Row">
				
				<data>
					SELECT ID_CARGA, CANT_CARGA, MONTO_CARGA, CANT_ACEPT, MONTO_ACEPT, CANT_NO_INF, MONTO_NO_INF, CANT_INCONS, MONTO_INCONS, CANT_NUEVOS, MONTO_NUEVOS, CANT_TOTAL, MONTO_TOTAL,NOMBRE_ARCHIVO
					FROM RESUMEN_CONCILIACION WHERE  
					<!--ESTADO = '<xsl:value-of select='/request-context/request/message/body/estado_conciliacion' />'  AND RECAUDADOR_ID = '<xsl:value-of select='code' />' ORDER BY  FECHA_CARGA DESC-->
					<!-- ESTADO = '<xsl:value-of select='/request-context/request/message/body/estado_conciliacion' />'  -->
					ESTADO NOT IN ('PROCESANDO_AUTORIZADO' , 'AUTORIZADO')
					AND RECAUDADOR_ID = '<xsl:value-of select='ID_REC' />' ORDER BY  FECHA_CARGA DESC
				</data>
				
				</xsl:for-each>			
		
		</transmission>
	</xsl:template>
</xsl:stylesheet>


