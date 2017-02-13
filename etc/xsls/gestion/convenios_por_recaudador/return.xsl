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
			<agreements>
				<xsl:for-each
					select="/request-context/services-responses/convenios-por-recaudador/obtener-convenios/response/data/Results/Row">
					<agreement>
						<code><xsl:value-of select="COD_CNV" /></code>
						<description><xsl:value-of select="DSC_CNV" /></description>						
						<!-- <description><xsl:value-of select="COD_CNV" /></description> -->
						<status><xsl:value-of select="COD_STD" /></status>
						<doc_emp><xsl:value-of select="DOC_EMP" /></doc_emp>
						<tipo_fecha><xsl:value-of select="TIPO_FECHA" /></tipo_fecha>
					</agreement>
				</xsl:for-each>
				</agreements>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
