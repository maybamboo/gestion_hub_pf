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
					SELECT RECAUDADOR_ID, NUM_CONVENIO, FECHA_PROCESO
					FROM RESUMEN_CONCILIACION 
					WHERE ID_CARGA=<xsl:value-of select='/request-context/request/message/body/id_carga' />
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


