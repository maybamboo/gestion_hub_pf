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
					CALL PKG_RENDICION.MUEVE_CONCILIACION_A_HISTORICO(<xsl:value-of select='/request-context/request/message/body/id_carga' />)
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


