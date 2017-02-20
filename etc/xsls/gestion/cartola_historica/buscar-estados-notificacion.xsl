<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>gestion_hrpf</datasource>
			</properties>
					
				<data>				
					select codigo, descripcion from estado_notificacion							
				</data>
					
		</transmission>
	
	</xsl:template>
</xsl:stylesheet>
