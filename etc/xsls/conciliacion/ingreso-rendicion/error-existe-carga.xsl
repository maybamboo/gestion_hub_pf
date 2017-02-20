<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
                <message>
                        <header>
                                <status_code>4</status_code>
                                <description>Error, ya existe carga</description>
                                <parametros><xsl:copy-of select="/request-context/request/message/body/data" /></parametros>
								

                        </header>
                        <body>

      <xsl:copy-of select="/request-context/services-responses/validar-ingreso-rendicion/existe-carga/response/data/Results" />
      <returnpageOK>/module/hrbios/CargaRepetidaContinuar</returnpageOK>
	</body>
                </message>
        </xsl:template>
</xsl:stylesheet>
