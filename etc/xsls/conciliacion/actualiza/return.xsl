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
        			<xsl:copy-of select="/request-context/services-responses/carga-conciliacion/*" />       
      			</body>
                </message>
        </xsl:template>
</xsl:stylesheet>
