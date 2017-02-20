<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:variable name="pageSize" select="'20'" />	
	<xsl:variable name="page" select="/request-context/request/message/body/page - 1" />
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>bd_hub_trx</datasource>
				<!-- <datasource>gestion_hrpf</datasource> -->
			</properties>
										
				<data>
				    CALL PKG_RENDICION.CONCILIACION_DET_PAG_REND('<xsl:value-of select='/request-context/request/message/body/id_carga' />',
				    '<xsl:value-of select='$page' />',
				    '<xsl:value-of select='$pageSize' />')				    				
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


