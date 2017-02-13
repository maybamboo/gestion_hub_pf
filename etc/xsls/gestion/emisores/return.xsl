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
				<emisores>
				<xsl:for-each
					select="/request-context/services-responses/emisores/emisores/response/data/Results/Row">
					<emisor>
						<codigo><xsl:value-of select="CODIGO" /></codigo>
						<descripcion><xsl:value-of select="DESCRIPCION" /></descripcion>
					</emisor>
				</xsl:for-each>
				</emisores>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
