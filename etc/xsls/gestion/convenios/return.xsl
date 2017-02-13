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
				<xsl:for-each
					select="/request-context/services-responses/convenios/obtener-convenios/response/data/Results/Row">
					<agreement>
						<code><xsl:value-of select="COD_CNV" /></code>
						<name><xsl:value-of select="DSC_CNV" /></name>						
					</agreement>
				</xsl:for-each>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
