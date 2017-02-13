<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>bd_hub_trx</datasource>
			</properties>
						
				<data>
					UPDATE PAGO_CONCILIACION 
					  SET CANAL='<xsl:value-of select='/request-context/services-responses/resultado_conciliacion_actualizar_estado/obtener_canal/response/data/Results/Row/CANAL' />'
					  WHERE ID_CARGA=<xsl:value-of select='/request-context/request/message/body/id_carga' />
					  AND CANAL IS NULL
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


