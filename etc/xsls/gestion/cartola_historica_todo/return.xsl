<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="pageSize" select="20" />
	<xsl:template match="/">
		<message>
			<header>
				<status_code>0</status_code>
				<description>OK</description>
			</header>
			<body>
			   <archivo>	
				<directorio><xsl:value-of select="/request-context/services-responses/cartola-historica-todo/buscar-transacciones/response/data/file/directory" /></directorio>
				<nombre_archivo><xsl:value-of select="/request-context/services-responses/cartola-historica-todo/buscar-transacciones/response/data/file/name" /></nombre_archivo>
				<rows><xsl:value-of select="/request-context/services-responses/cartola-historica-todo/buscar-transacciones/response/data/file/rows" /></rows>
			</archivo>					
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>