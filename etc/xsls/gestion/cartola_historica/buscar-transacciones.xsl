<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

 <xsl:variable name="pageSize" select="'25'" />
 <xsl:variable name="page" select="/request-context/request/message/body/page - 1" />	
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>gestion_hrpf</datasource>
			</properties>
					
				<data>				
					CALL PKG_GESTION.CONS_CARTOLA_HISTORICA_PAG(
						'<xsl:value-of select='/request-context/request/message/body/date-range/start' />',
						'<xsl:value-of select='/request-context/request/message/body/date-range/end' />',
						'<xsl:value-of select='/request-context/request/message/body/holding' />',
						'<xsl:value-of select='/request-context/request/message/body/empresa' />',
						'<xsl:value-of select='/request-context/request/message/body/recaudador' />',
						'<xsl:value-of select='/request-context/request/message/body/convenio' />',
						'<xsl:value-of select='/request-context/request/message/body/estado_rendicion' />',
						'<xsl:value-of select='/request-context/request/message/body/id_servicio' />',
						'<xsl:value-of select='/request-context/request/message/body/estado_conciliacion' />',
						'<xsl:value-of select='/request-context/request/message/body/seccion' />',  						
						'<xsl:value-of select='/request-context/request/message/body/folio' />',
						'<xsl:value-of select='/request-context/request/message/body/zona' />',	                      
						'<xsl:value-of select='/request-context/request/message/body/id_cliente' />',
						'<xsl:value-of select='$page' />',
						'<xsl:value-of select='$pageSize' />',
						'<xsl:value-of select='/request-context/request/message/body/estado_pago' />'
						)															
				</data>	        
								
		</transmission>	
	</xsl:template>
</xsl:stylesheet>
