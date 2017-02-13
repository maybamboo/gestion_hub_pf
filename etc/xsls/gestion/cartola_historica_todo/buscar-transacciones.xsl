<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>gestion_hrpf</datasource>

				<outputType>xlsx</outputType>
				<outputName>CartolaHistorica</outputName>
				<outputLimit><xsl:value-of select="/request-context/request/message/body/limite_excel" /></outputLimit>

			</properties>
			
			<additional>
				<mapeos>

				<column column-position="10">

				  <!--<xsl:for-each select="/request-context/services-responses/cartola-historica-todo/obtener-recaudadores/agreements/response/agreement">-->
				  	<xsl:for-each select="/request-context/services-responses/cartola-historica-todo/obtener-recaudadores/response/data/Results/Row">


					 	<!--<mapeo from="{@code}"><xsl:value-of select="description" /></mapeo>-->
					 	<mapeo from="{COD_CNV}"><xsl:value-of select="DSC_CNV" /></mapeo>


				   </xsl:for-each>                                           
				</column>

				<column column-position="11">

					<!--<xsl:for-each select="/request-context/services-responses/cartola-historica-todo/obtener-recaudadores/agreements/response/agreement/collector">-->
					<xsl:for-each select="/request-context/services-responses/cartola-historica-todo/obtener-recaudadores/response/data/Results/Row">

					<!--<mapeo from="{code}"><xsl:value-of select="name" /></mapeo>-->
						<!--<mapeo from="{ID_REC}"><xsl:value-of select="NOM_REC" /></mapeo>-->
						<mapeo from="{DOC_REC}"><xsl:value-of select="NOM_REC" /></mapeo>
				   </xsl:for-each>                                         
				</column>

							
				<!--column column-position="14">
					<xsl:for-each select="/request-context/services-responses/cartola-historica-todo/buscar-estados-pago/response/data/Results/Row">
					 <mapeo from="{CODIGO}"><xsl:value-of select="DESCRIPCION" /></mapeo> 
				   </xsl:for-each>                                         
				</column-->

				<column column-position="15">
					<xsl:for-each select="/request-context/services-responses/cartola-historica-todo/buscar-estados-rendicion/response/data/Results/Row">
					 <mapeo from="{CODIGO}"><xsl:value-of select="DESCRIPCION" /></mapeo> 
				   </xsl:for-each>                                         
				</column>
				
				<column column-position="17">
					<xsl:for-each select="/request-context/services-responses/cartola-historica-todo/buscar-estados-pago/response/data/Results/Row">
					 <mapeo from="{CODIGO}"><xsl:value-of select="DESCRIPCION" /></mapeo> 
				   </xsl:for-each>                                         
				</column>
				
				</mapeos>
			</additional> 
		
					
				<data>				
					CALL PKG_GESTION.CONSULTAR_CARTOLA_HISTORICA(
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
						'<xsl:value-of select='/request-context/request/message/body/estado_pago' />'
						)
				</data>	
								
		</transmission>	
	</xsl:template>
</xsl:stylesheet>
