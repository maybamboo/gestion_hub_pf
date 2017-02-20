<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
		
			<header>				
				<msg_type>resultado-conciliacion-detalle-page-rend</msg_type>
			</header>
			<body>
				<id_carga><xsl:value-of select="/request-context/request/request/parametros/id_carga" /></id_carga>
				<company_code><xsl:value-of select="/request-context/request/request/datosSesion/docEmpresa" /></company_code>
				<xsl:choose>
					<xsl:when test="/request-context/request/request/parametros/page">
						<page><xsl:value-of select="/request-context/request/request/parametros/page" /></page>	
					</xsl:when>
					<xsl:otherwise>
						<page>1</page>
					</xsl:otherwise>
				</xsl:choose>										
			</body>			
						
		</message>
	</xsl:template>
</xsl:stylesheet>
