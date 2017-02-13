<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>gestion_hrpf</datasource>
			</properties>
			
			<xsl:variable name="CODE">
				<xsl:choose>
					<xsl:when test="/request-context/request/message/body/esHoldingUsuarioEmpresa = 'true'">
						<xsl:value-of select="/request-context/request/message/body/company-code" disable-output-escaping="yes"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="/request-context/services-responses/indicadores-recaudador/obtener-empresa/response/data/Results/Row/DOC_EMP" disable-output-escaping="yes"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>


		
				<data>				
					CALL PKG_GESTION.CONSULTAR_INDICADORES_REC(
						'<xsl:value-of select='/request-context/request/message/body/date-range/start' />',
						'<xsl:value-of select='/request-context/request/message/body/date-range/end' />',
						'<xsl:value-of select='/request-context/request/message/body/tipo_grafico' />',
						'<xsl:value-of select='/request-context/request/message/body/tipo_periodo' />',
						'<xsl:value-of select='/request-context/request/message/body/select_mes' />' ,
						'<xsl:value-of select='/request-context/request/message/body/select_ano' />',
						<!--'<xsl:value-of select='$CODE' />',
						'<xsl:value-of select='/request-context/request/message/body/esHoldingUsuarioEmpresa' />'-->
						'<xsl:value-of select='/request-context/request/message/body/id_holding' />',
						'<xsl:value-of select='/request-context/request/message/body/id_emp' />',
						<!--'<xsl:value-of select='/request-context/request/message/body/company-code' />'-->
						<!--'<xsl:value-of select='/request-context/services-responses/indicadores-recaudador/obtener-empresa/response/data/Results/Row/DOC_EMP' />'-->
					)									
				</data>

		</transmission>
	
	</xsl:template>
</xsl:stylesheet>
