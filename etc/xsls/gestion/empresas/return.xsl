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
				<empresas>
				<xsl:for-each
					select="/request-context/services-responses/obtener-empresas/obtener-empresas/response/data/Results/Row">
					<empresa>
						<code><xsl:value-of select="ID_EMP" /></code>
						<name><xsl:value-of select="NOM_EMP" /></name>
						<short-name><xsl:value-of select="COD_EMP" /></short-name>
						<status><xsl:value-of select="COD_STD" /></status>
						<identificador><xsl:value-of select="DOC_EMP" /></identificador>
						<emp_id_emp><xsl:value-of select="EMP_ID_EMP" /></emp_id_emp>
					</empresa>
				</xsl:for-each>
				</empresas>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
