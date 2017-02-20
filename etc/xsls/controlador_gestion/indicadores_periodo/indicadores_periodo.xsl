<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

		<message>
			<header>
				<msg_type>indicadores-hora</msg_type>
			</header>
			<body>
				<date-range>
					<start><xsl:value-of select="/request-context/request/request/parametros/start" /></start>
					<end><xsl:value-of select="/request-context/request/request/parametros/end" /></end>
				</date-range>
				<tipo_grafico><xsl:value-of select="/request-context/request/request/parametros/tipo_grafico" /></tipo_grafico>
				<tipo_periodo><xsl:value-of select="/request-context/request/request/parametros/tipo_periodo" /></tipo_periodo>
				<select_ano><xsl:value-of select="/request-context/request/request/parametros/select_ano" /></select_ano>
				<select_mes><xsl:value-of select="/request-context/request/request/parametros/select_mes" /></select_mes>
				<company-code><xsl:value-of select="/request-context/request/request/datosSesion/razSocEmpresa" /></company-code>
				<esHoldingUsuarioEmpresa><xsl:value-of select="/request-context/request/request/datosSesion/esHoldingUsuarioEmpresa" /></esHoldingUsuarioEmpresa> 
				<id_holding><xsl:value-of select="/request-context/request/request/parametros/id_holding" /></id_holding>
				<id_emp><xsl:value-of select="/request-context/request/request/parametros/id_emp" /></id_emp> 

			</body>
		</message>

	</xsl:template>
</xsl:stylesheet>
