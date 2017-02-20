<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
                <message>
                        <header>       	                 
				<msg_type>rendicion-cuadratura</msg_type>
                        </header>
                        <body>
 			          <hubname>gestion_hub_pf</hubname>
			          <in_fecha><xsl:value-of select="/request-context/request/message/body/data/in_fecha" /></in_fecha>
			          <convenio><xsl:value-of select="/request-context/request/message/body/data/convenio" /></convenio>
			          <formato><xsl:value-of select="/request-context/request/message/body/data/formato" /></formato>
			          <checksum><xsl:value-of select="/request-context/request/message/body/data/checksum" /></checksum>
			          <sessionid><xsl:value-of select="/request-context/request/message/body/data/sessionid" /></sessionid>
			          <accion><xsl:value-of select="/request-context/request/message/body/data/accion" /></accion>
			          <tipofecha><xsl:value-of select="/request-context/request/message/body/data/tipofecha" /></tipofecha>
			          <nombre><xsl:value-of select="/request-context/request/message/body/data/nombre" /></nombre>
			          <collector><xsl:value-of select="/request-context/request/message/body/data/collector" /></collector>
			          <rutaTemporal><xsl:value-of select="/request-context/request/message/body/data/rutaTemporal" /></rutaTemporal>
			          <tipoMensaje><xsl:value-of select="/request-context/request/message/body/data/tipoMensaje" /></tipoMensaje>
			          <filename><xsl:value-of select="/request-context/request/message/body/data/filename" /></filename>
			          <folio><xsl:value-of select="/request-context/services-responses/carga-conciliacion/obtener-id-carga/response/data/Results/Row/FOLIO" /></folio>
				  <auto><xsl:value-of select="/request-context/request/message/body/data/auto" /></auto>
			</body>
                </message>
        </xsl:template>
</xsl:stylesheet>
