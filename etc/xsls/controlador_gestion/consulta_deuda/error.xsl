<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>			
				<status_code><xsl:value-of select="/request-context/services-responses/consulta-deuda/consulta-deuda/message/body/status_code" /></status_code>
				<description><xsl:value-of select="/request-context/services-responses/consulta-deuda/consulta-deuda/message/body/status_desc" /></description>			
			</header>
			<body />														
		</message>
	</xsl:template>
</xsl:stylesheet>
