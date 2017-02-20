<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>bd_hub_trx</datasource>
			</properties>
						
				<data>
          				update resumen_conciliacion set ESTADO = '<xsl:value-of select='/request-context/request/message/body/estado' />' where ID_CARGA = <xsl:value-of select='/request-context/request/message/body/id_carga' />        
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


