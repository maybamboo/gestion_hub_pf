<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


        <xsl:template match="/">
		<message>
			<header>
				<msg_type>reporte_conciliacion_actualizar_estado</msg_type>
			</header>
			<body>
				<id_carga><xsl:value-of select="/request-context/request/message/body/folio" /></id_carga>
				<estado>ACEPTADO</estado>
				<auto><xsl:value-of select="/request-context/request/message/body/auto" /></auto>
			</body>
		</message>
        </xsl:template>
</xsl:stylesheet>
