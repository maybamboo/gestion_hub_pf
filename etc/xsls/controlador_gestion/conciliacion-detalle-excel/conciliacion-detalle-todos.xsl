<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<msg_type>conciliacion-detalle-todo</msg_type>
			</header>
			<body>
				<id_carga><xsl:value-of select="/request-context/request/request/parametros/id_carga" /></id_carga>	
        			<limite_excel><xsl:value-of select="/request-context/request/request/parametros/limite_excel" /></limite_excel>		
				<company_code><xsl:value-of select="/request-context/request/request/datosSesion/docEmpresa" /></company_code>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
