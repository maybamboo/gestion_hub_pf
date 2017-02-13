<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<msg_type>obtener-empresas</msg_type>
			</header>
			<body>
				<id_holding><xsl:value-of select="/request-context/request/request/parametros/holding" /></id_holding>			
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
