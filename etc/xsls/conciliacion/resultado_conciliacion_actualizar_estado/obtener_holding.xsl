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
				SELECT RAZ_SOC_EMP AS HOLDING
				FROM EMPRESAS 
				WHERE ID_EMP =(
					SELECT EMP_ID_EMP 
					FROM CONVENIOS C, EMPRESAS E WHERE C.ID_EMP = E.ID_EMP 
					AND COD_CNV='<xsl:value-of select='/request-context/services-responses/resultado_conciliacion_actualizar_estado/datos_carga/response/data/Results/Row/NUM_CONVENIO' />' 
					)
			</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


