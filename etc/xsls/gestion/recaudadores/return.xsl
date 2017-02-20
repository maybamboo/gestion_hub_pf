<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>			
				<status_code>0</status_code>
				<description>OK</description>			
			</header>
			<body>
				<collectors>
				<xsl:for-each
					select="/request-context/services-responses/recaudadores/obtener-recaudadores/response/data/Results/Row">
					<collector>
						<code><xsl:value-of select="ID_REC" /></code>
						<name><xsl:value-of select="NOM_REC" /></name>
						<short-name><xsl:value-of select="RAZ_SOC_REC" /></short-name>
						<status><xsl:value-of select="COD_STD" /></status>
						<identificador><xsl:value-of select="DOC_REC" /></identificador>
					</collector>
				</xsl:for-each>
				</collectors>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
