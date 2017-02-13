<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">			
				
	<xsl:copy-of select="/request-context/services-responses/cartola_historica_excel/pagos/*" />
	
				
	</xsl:template>
</xsl:stylesheet>