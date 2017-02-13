<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:variable name="pageSize" select="25" />
	<xsl:template match="/">
		<message>
			<header>
				<status_code>0</status_code>
				<description>OK</description>
			</header>
			<body>
				<pagos>	
					<xsl:for-each select="/request-context/services-responses/cartola-historica/buscar-transacciones/response/data/Results/Row">
						<pago>
							<PAG_ID><xsl:value-of select="PAG_ID" /></PAG_ID>
							<DOC_ID><xsl:value-of select="DOC_ID" /></DOC_ID>
							<ID_TRX_EFT><xsl:value-of select="ID_TRX_EFT" /></ID_TRX_EFT>
							<ID_TRX_EPS><xsl:value-of select="ID_TRX_EPS" /></ID_TRX_EPS>
							<ID_TRX_REC><xsl:value-of select="ID_TRX_REC" /></ID_TRX_REC>
							<FECHA_TRX><xsl:value-of select="FECHA_TRX" /></FECHA_TRX>
							<HORA_TRX><xsl:value-of select="HORA_TRX" /></HORA_TRX>            
							<FECHA_SYS><xsl:value-of select="FECHA_SYS" /></FECHA_SYS>
							<HORA_SYS><xsl:value-of select="HORA_SYS" /></HORA_SYS>
	            			<FECHA_CONT><xsl:value-of select="FECHA_CONT" /></FECHA_CONT>
	            			<ID_CLIENTE><xsl:value-of select="ID_CLIENTE" /></ID_CLIENTE>                        
							<ID_SERVICIO><xsl:value-of select="ID_SERVICIO" /></ID_SERVICIO>
							<MONTO_PAGO><xsl:value-of select="MONTO_PAGO" /></MONTO_PAGO>
							<RECAUDADOR_ID><xsl:value-of select="RECAUDADOR_ID" /></RECAUDADOR_ID>
				            <NUM_CONVENIO><xsl:value-of select="NUM_CONVENIO" /></NUM_CONVENIO>
				            <CANAL><xsl:value-of select="CANAL" /></CANAL>
				            <ESTADO_CONCILIACION><xsl:value-of select="ESTADO_CONCILIACION" /></ESTADO_CONCILIACION>
				            <FOLIO><xsl:value-of select="FOLIO" /></FOLIO>
				            <LUGAR><xsl:value-of select="LUGAR" /></LUGAR>
				            <TIPO_PAGO><xsl:value-of select="TIPO_PAGO" /></TIPO_PAGO>

							<xsl:variable name = "collector_id" select="RECAUDADOR_ID" />
				            <xsl:variable name = "agreement_id" select="NUM_CONVENIO" />

							<RECAUDADOR>
								 <!--<xsl:value-of select="/request-context/services-responses/cartola-historica/obtener-recaudadores/agreements/response/agreement[@code= $agreement_id]/collector[code = $collector_id]/name" />-->

								 <xsl:value-of select="/request-context/services-responses/cartola-historica/obtener-recaudadores/response/data/Results/Row[COD_CNV= $agreement_id and ID_REC=$collector_id]/NOM_REC" />
							</RECAUDADOR>

				            <CONVENIO>
								<!--<xsl:value-of select="/request-context/services-responses/cartola-historica/obtener-recaudadores/agreements/response/agreement[@code= $agreement_id]/description" />-->
								<xsl:value-of select="/request-context/services-responses/cartola-historica/obtener-recaudadores/response/data/Results/Row[COD_CNV= $agreement_id]/DSC_CNV" />            
				            </CONVENIO> 
							
							<xsl:choose>
								<xsl:when test="ESTADO_NOTIFICACION = '0' ">
									<ESTADO_NOTIFICACION>Notificado</ESTADO_NOTIFICACION>
								</xsl:when>
								<xsl:otherwise>
									<ESTADO_NOTIFICACION>No Notificado</ESTADO_NOTIFICACION>
								</xsl:otherwise>
							</xsl:choose>
							
										
							<ESTADO_PAGO>
								<xsl:variable name = "cod_estado_pago" select="ESTADO_PAGO" />
								<xsl:value-of select="/request-context/services-responses/cartola-historica/buscar-estados-pago/response/data/Results/Row[CODIGO = $cod_estado_pago]/DESCRIPCION" />																																					
							</ESTADO_PAGO>
							<ESTADO_RENDICION>
								<xsl:variable name = "cod_estado_rendicion" select="ESTADO_RENDICION" />
								<xsl:value-of select="/request-context/services-responses/cartola-historica/buscar-estados-rendicion/response/data/Results/Row[CODIGO = $cod_estado_rendicion]/DESCRIPCION" />																																					
							</ESTADO_RENDICION>
				            <SECCION><xsl:value-of select="SECCION" /></SECCION>
				            <ZONA><xsl:value-of select="ZONA" /></ZONA>
						</pago>
					</xsl:for-each>
				</pagos>
				<recaudadores>
					<xsl:for-each select="/request-context/services-responses/cartola-historica/obtener-recaudadores/response/data/Results/Row">
						<recaudador>
							<COD_REC><xsl:value-of select="COD_REC" /></COD_REC>
							<DOC_REC><xsl:value-of select="DOC_REC" /></DOC_REC>
							<NOM_REC><xsl:value-of select="NOM_REC" /></NOM_REC>
						</recaudador>
					</xsl:for-each>
				</recaudadores>
				<paginas><xsl:value-of select="ceiling(/request-context/services-responses/cartola-historica/obtener-cantidad-transacciones/response/data/Results/Row/CANTIDAD div $pageSize)" /></paginas>
	        		<cantidad_total><xsl:value-of select="/request-context/services-responses/cartola-historica/obtener-cantidad-transacciones/response/data/Results/Row/CANTIDAD" /></cantidad_total>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
