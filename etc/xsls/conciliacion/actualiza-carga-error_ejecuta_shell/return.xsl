<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<status_code>1</status_code>
				<description>Estado de carga actualizado en BD</description>
			</header>
			<body>
        <ejecutar_shell>
  		    <response>
  					<code>2</code>
            <description>Error en la comuniacion con el servicio de carga</description>
  		    </response>
        </ejecutar_shell>               
      </body>
		</message>
	</xsl:template>
</xsl:stylesheet>