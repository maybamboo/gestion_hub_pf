<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>hrconvenios</datasource>
			</properties>
			<data>
				<!--el parametro indica el id del cliente, en este caos la empresa de servicio-->
				CALL PKG_AGREEMENT_HUB.getEmpresas('<xsl:value-of select="/request-context/request/message/body/id_holding" />')
			</data>
		</transmission>
				
	</xsl:template>
</xsl:stylesheet>
