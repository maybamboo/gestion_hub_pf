<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<msg_type>cartola-historica-todo</msg_type>
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
				<estado_pago><xsl:value-of select="/request-context/request/request/parametros/estado_pago" /></estado_pago>
				<id-servicio><xsl:value-of select="/request-context/request/request/parametros/id-servicio" /></id-servicio>
				<emisor><xsl:value-of select="/request-context/request/request/parametros/emisor" /></emisor>
				<limite_excel><xsl:value-of select="/request-context/request/request/parametros/limite_excel" /></limite_excel>
				<estado_pago><xsl:value-of select="/request-context/request/request/parametros/estado_pago" /></estado_pago>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
