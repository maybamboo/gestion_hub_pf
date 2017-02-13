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
					  SET COD_EMPRESA_HOLDING = '<xsl:value-of select='/request-context/services-responses/resultado_conciliacion_actualizar_estado/obtener_holding/response/data/Results/Row/HOLDING' />' 
					  WHERE ID_CARGA=<xsl:value-of select='/request-context/request/message/body/id_carga' />
					  AND COD_EMPRESA_HOLDING IS NULL
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


