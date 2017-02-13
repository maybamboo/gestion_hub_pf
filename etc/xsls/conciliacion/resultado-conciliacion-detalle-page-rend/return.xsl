<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="pageSize" select="20.0" />
	<xsl:template match="/">
		<message>
			<header>
				<status_code>0</status_code>
				<description>OK</description>
			</header>
			<body>
					
				<detalles>
					
					<xsl:for-each select="/request-context/services-responses/resultado-conciliacion-detalle-page-rend/obtener-detalle/response/data/Results/Row">
							
						<detalle>	
						<xsl:variable name="collector_id" select="RECAUDADOR_ID" />	
                                                <id_trx_rec><xsl:value-of select="ID_TRX_REC" /></id_trx_rec>					
							<fecha><xsl:value-of select="FECHA" /></fecha>
							<hora><xsl:value-of select="HORA" /></hora>
							<recaudador_id><xsl:value-of select="$collector_id" /></recaudador_id>	


							<recaudador_name><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-detalle-page-rend/obtener-recaudadores/agreements/response/data/Results/Row[ID_REC = $collector_id]/NOM_REC" /></recaudador_name>


							<convenio><xsl:value-of select="NUM_CONVENIO" /></convenio>
							<id_servicio><xsl:value-of select="ID_SERVICIO" /></id_servicio>
                                                	<folio><xsl:value-of select="/request-context/request/message/body/id_carga" /></folio>
							<monto_pago><xsl:value-of select="MONTO_PAGO" /></monto_pago>
							<canal><xsl:value-of select="CANAL" /></canal>
							<medio_pago><xsl:value-of select="MEDIO_PAGO" /></medio_pago>
                                                <estado_conciliacion><xsl:value-of select="ESTADO_CONCILIACION" /></estado_conciliacion>						
						</detalle>
				
					</xsl:for-each>
													
				</detalles>	
				<total>
					<xsl:variable name="resumen" select="/request-context/services-responses/resultado-conciliacion-detalle-page-rend/obtener-detalle/response/data/Results/Row" />					
					<monto_pago><xsl:value-of select="sum($resumen/MONTO_PAGO)" /></monto_pago>
					<id_servicio><xsl:value-of select="count($resumen/MONTO_PAGO)" /></id_servicio>
                                  <cantidad_total><xsl:value-of select="count($resumen/MONTO_PAGO)" /></cantidad_total>
				</total>				
				<paginas><xsl:value-of select="ceiling(/request-context/services-responses/resultado-conciliacion-detalle-page-rend/obtener-cantidad-detalle/response/data/Results/Row/CANTIDAD div $pageSize)" /></paginas>		
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
