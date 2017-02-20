<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	
		<message>
			<header>
                		<msg_type>filtro-convenios</msg_type>
                	</header>
                	<body>
                		<id_rec><xsl:value-of select="/request-context/request/request/parametros/recaudador" /></id_rec>
                		<id_emp><xsl:value-of select="/request-context/request/request/parametros/empresa" /></id_emp>
                	</body>
                </message>
	</xsl:template>
</xsl:stylesheet>
