<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

		<message>
			<header>
				<msg_type>recaudadores</msg_type>
			</header>
			<body>			
				<!-- <company-code>1</company-code> -->
				<!-- <company-code><xsl:value-of select="/request-context/request/request/datosSesion/razSocEmpresa" /></company-code> -->
				<company-code><xsl:value-of select="/request-context/request/request/parametros/holding" /></company-code>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
