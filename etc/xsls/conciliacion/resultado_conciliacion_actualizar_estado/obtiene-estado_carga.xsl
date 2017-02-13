<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>bd_hub_trx</datasource>
			</properties>
						
				<data>
          				select ESTADO,  NUM_CONVENIO, TO_CHAR(FECHA_PROCESO, 'DD/MM/YY') AS FECHA_PROCESO
					from  resumen_conciliacion 
					where ID_CARGA = <xsl:value-of select="/request-context/request/message/body/id_carga"/>         
				</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>
