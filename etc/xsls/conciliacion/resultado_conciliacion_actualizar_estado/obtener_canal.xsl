<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>hrconvenios</datasource>
			</properties>						
			<data>

				SELECT DSC_CNL AS CANAL
				FROM CANALES 
				WHERE ID_REC=(
						SELECT ID_REC FROM RECAUDADORES WHERE DOC_REC='<xsl:value-of select='/request-context/services-responses/resultado_conciliacion_actualizar_estado/datos_carga/response/data/Results/Row/RECAUDADOR_ID' />'
					     ) 
			</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


