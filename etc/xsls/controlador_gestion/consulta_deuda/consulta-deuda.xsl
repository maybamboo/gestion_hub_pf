<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


	<xsl:template match="/">
		<message>
			<header>
				<msg_type>SCD01</msg_type>
				<id_trx_rec>POR<xsl:value-of select="current-dateTime()" /></id_trx_rec>
				<id_trx_eft></id_trx_eft>
				<id_trx_eps></id_trx_eps>
				<company_id><xsl:value-of select="/request-context/request/request/parametros/doc_emp"/></company_id>
				<collector_id><xsl:value-of select="/request-context/request/request/parametros/recaudador_code" /></collector_id>
				<date><xsl:value-of select="current-dateTime()" /></date>
				<channel>CAJA</channel>
				<country_code>PA</country_code>
				<currency_code>USD</currency_code>
			</header>
			<body>
				<service_id><xsl:value-of select="/request-context/request/request/parametros/service" /></service_id>
				<client_id></client_id>
				<document_id></document_id>		
				<contract_id><xsl:value-of select="/request-context/request/request/parametros/contract" /></contract_id>		
				<!--El amount lo sacamos-->							
			</body>
		</message>

	</xsl:template>
</xsl:stylesheet>
