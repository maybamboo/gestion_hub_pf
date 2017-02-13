<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<msg_type>convenios-por-recaudador</msg_type>
			</header>
			<body>			
				<collector-code><xsl:value-of select="/request-context/request/request/parametros/collector" /></collector-code>					
				<collector-emp><xsl:value-of select="/request-context/request/request/datosSesion/razSocEmpresa" /></collector-emp>					
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
