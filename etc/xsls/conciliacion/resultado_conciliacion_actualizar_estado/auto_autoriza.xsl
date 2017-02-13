<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">

		<message>
			<header>
				<msg_type>reporte_conciliacion_actualizar_estado_autoriza</msg_type>
			</header>
			<body>
				<id_carga><xsl:value-of select="/request-context/request/message/body/id_carga" /></id_carga>
				<estado>AUTORIZADO</estado>
				<auto><xsl:value-of select="/request-context/request/message/body/auto" /></auto>
			</body>
		</message>

        </xsl:template>
</xsl:stylesheet>
