<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<msg_type>cartola-historica</msg_type>
			</header>
			<body>
				<date-range>
					<start><xsl:value-of select="/request-context/request/request/parametros/start" /></start>
					<end><xsl:value-of select="/request-context/request/request/parametros/end" /></end>
				</date-range>
				<holding><xsl:value-of select="/request-context/request/request/parametros/id_holding" /></holding>
				<empresa><xsl:value-of select="/request-context/request/request/parametros/id_emp" /></empresa>
				<recaudador><xsl:value-of select="/request-context/request/request/parametros/recaudador" /></recaudador>
				<convenio><xsl:value-of select="/request-context/request/request/parametros/convenio" /></convenio>
				<id_cliente><xsl:value-of select="/request-context/request/request/parametros/id_cliente" /></id_cliente>
				<id_servicio><xsl:value-of select="/request-context/request/request/parametros/id_servicio" /></id_servicio>
				<folio><xsl:value-of select="/request-context/request/request/parametros/folio" /></folio>
				<estado_rendicion><xsl:value-of select="/request-context/request/request/parametros/estado_rendicion" /></estado_rendicion>
				<estado_conciliacion><xsl:value-of select="/request-context/request/request/parametros/estado_conciliacion" /></estado_conciliacion>
				<zona><xsl:value-of select="/request-context/request/request/parametros/zona" /></zona>
				<seccion><xsl:value-of select="/request-context/request/request/parametros/seccion" /></seccion>
				<estado_pago><xsl:value-of select="/request-context/request/request/parametros/estado_pago" /></estado_pago>
		
				
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
