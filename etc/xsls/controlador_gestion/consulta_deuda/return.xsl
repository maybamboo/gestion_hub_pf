<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>			
				<status_code>0</status_code>
				<description>OK</description>			
			</header>

			<xsl:variable name="debts" select="/request-context/services-responses/consulta-deuda/consulta-deuda/message/body/debts/debt"/>

			<body>

				<status_descc><xsl:value-of select="/documento/body/message/body/status_desc" /></status_descc>
				<status_desc><xsl:value-of select="/services-responses/consulta-deuda/consulta-deuda/message/body/status_desc" /></status_desc>

				<debts>
					<xsl:for-each select="$debts">
						<debt>
							<client_id><xsl:value-of select="client_id"/></client_id>
							<document_id><xsl:value-of select="document_id"/></document_id>
							<total_amount><xsl:value-of select="total_amount"/></total_amount>
						</debt>
					</xsl:for-each>	
				</debts>			
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
