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
					CALL PKG_AGREEMENT_HUB.findByParams(<xsl:value-of select="/request-context/request/message/body/company-code" /> )
				</data>
		</transmission>	
	</xsl:template>
</xsl:stylesheet>
