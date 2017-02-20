<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<status_code>0</status_code>
				<description>OK</description>
			</header>
			<body>
				
				<resumen>	
					<xsl:for-each
						select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-resumen-conciliacion/response/data/Results">
						
						<xsl:variable name="position" select="position()" />
						
						<resultado-conciliacion>
							<xsl:choose>
										
							<xsl:when test="Row">

								<xsl:for-each select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-resumen-conciliacion/response/data/Results/Row">
									<row>

										<!--
										<recaudador_code><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/agreements/response/collectors/collector[$position]/code" /></recaudador_code>
										<recaudador_name><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/agreements/response/collectors/collector[$position]/name" /></recaudador_name>-->

										<recaudador_code><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/response/data/Results/Row[$position]/ID_REC" /></recaudador_code>
										<recaudador_name><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/response/data/Results/Row[$position]/NOM_REC" /></recaudador_name>

										<aceptados_cant><xsl:value-of select="CANT_ACEPT"/></aceptados_cant>
										<aceptados_monto><xsl:value-of select="MONTO_ACEPT"/></aceptados_monto>									
										<no_informados_cant><xsl:value-of select="CANT_NO_INF"/></no_informados_cant>
										<no_informados_monto><xsl:value-of select="MONTO_NO_INF"/></no_informados_monto>
										<inconsistentes_cant><xsl:value-of select="CANT_INCONS"/></inconsistentes_cant>
										<inconsistentes_monto><xsl:value-of select="MONTO_INCONS"/></inconsistentes_monto>	
										<nuevos_cant><xsl:value-of select="CANT_NUEVOS"/></nuevos_cant>
										<nuevos_monto><xsl:value-of select="MONTO_NUEVOS"/></nuevos_monto>
										<total_cant><xsl:value-of select="CANT_TOTAL"/></total_cant>
										<total_monto><xsl:value-of select="MONTO_TOTAL"/></total_monto>
										<nombre_archivo><xsl:value-of select="NOMBRE_ARCHIVO"/></nombre_archivo>									
										<carga><xsl:value-of select="ID_CARGA"/></carga>    								
									</row>
								</xsl:for-each>					
							</xsl:when>
							<!--xsl:otherwise>
								<row>				
								<recaudador_code><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/agreements/response/collectors/collector[$position]/code" /></recaudador_code>
								<recaudador_name><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-recaudadores/agreements/response/collectors/collector[$position]/name" /></recaudador_name>
								<rendicion_txn>0</rendicion_txn>
								<rendicion_monto>0</rendicion_monto>
								<hub_txn>0</hub_txn>
								<hub_monto>0</hub_monto>
								<diferencias_txn>0</diferencias_txn>
								<diferencias_monto>0</diferencias_monto>
								<carga />
								</row>							
							</xsl:otherwise-->
											
							</xsl:choose>
						</resultado-conciliacion>
						
					</xsl:for-each>
				</resumen>
				<total>
					<xsl:variable name="resumen" select="/request-context/services-responses/resultado-conciliacion-resumen-todos-rend/obtener-resumen-conciliacion/response/data/Results/Row" />
					<rendicion_txn><xsl:value-of select="sum($resumen/CANT_CARGA)" /></rendicion_txn>
					<rendicion_monto><xsl:value-of select="sum($resumen/MONTO_CARGA)" /></rendicion_monto>
					<hub_txn><xsl:value-of select="sum($resumen/CANT_CARGA) - (sum($resumen/CANT_NUEVOS) - sum($resumen/CANT_NO_INF))" /></hub_txn>
					<hub_monto><xsl:value-of select="sum($resumen/MONTO_CARGA) - (sum($resumen/MONTO_NUEVOS) - sum($resumen/MONTO_NO_INF))" /></hub_monto>
					<diferencias_txn><xsl:value-of select="sum($resumen/CANT_NUEVOS) + sum($resumen/CANT_NO_INF)" /></diferencias_txn>
					<diferencias_monto><xsl:value-of select="sum($resumen/MONTO_NUEVOS) + sum($resumen/MONTO_NO_INF)" /></diferencias_monto>
				
				</total>		
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>