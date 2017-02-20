<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>bd_hub_trx</datasource>
				<!-- <datasource>gestion_hrpf</datasource> -->
			</properties>
										
				<data>
				    CALL PKG_RENDICION.CONCILIACION_DET_COUNT_REND('<xsl:value-of select='/request-context/request/message/body/id_carga' />')				    				
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


