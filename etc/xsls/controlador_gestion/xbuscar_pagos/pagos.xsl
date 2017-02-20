<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<msg_type>cartola-historica</msg_type>
			</header>
			<body>	<date-range>
					<start><xsl:value-of select="/request-context/request/request/parametros/start" /></start>
					<end><xsl:value-of select="/request-context/request/request/parametros/end" /></end>
				</date-range>
				<recaudador><xsl:value-of select="/request-context/request/request/parametros/recaudador" /></recaudador>
				<convenio><xsl:value-of select="/request-context/request/request/parametros/convenio" /></convenio>
				<estado_pago><xsl:value-of select="/request-context/request/request/parametros/estado_pago" /></estado_pago>
				<id-servicio><xsl:value-of select="/request-context/request/request/parametros/id-servicio" /></id-servicio>
				
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
