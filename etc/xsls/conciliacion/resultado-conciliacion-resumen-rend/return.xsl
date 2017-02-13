<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:variable name="resultadoBD" select="/request-context/services-responses/resultado-conciliacion-resumen-rend/obtener-resumen-conciliacion/response/data/Results" />
	<xsl:template match="/">
		<message>
			<header>
				<status_code>0</status_code>
				<description>OK</description>
			</header>
			<body>
				
				<resumen>	
															
						
						<resultado-conciliacion>
							<xsl:choose>
										
							<xsl:when test="/request-context/services-responses/resultado-conciliacion-resumen-rend/obtener-resumen-conciliacion/response/data/Results/Row">
										
                <xsl:for-each select="/request-context/services-responses/resultado-conciliacion-resumen-rend/obtener-resumen-conciliacion/response/data/Results/Row">    
                    <row>    		

    								<estado><xsl:value-of select="ESTADO" /></estado>
    								<fecha><xsl:value-of select="FECHA_CARGA" /></fecha>
    								<recaudador_code><xsl:value-of select="RECAUDADOR_ID" /></recaudador_code>
    								<recaudador_name><xsl:value-of select="RECAUDADOR_ID"/></recaudador_name>    								
								<convenio_name><xsl:value-of select="NUM_CONVENIO"/></convenio_name>
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
												
								<recaudador_code><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-rend/obtener-recaudador/agreements/response/general/code" /></recaudador_code>
								<recaudador_name><xsl:value-of select="/request-context/services-responses/resultado-conciliacion-resumen-rend/obtener-recaudador/agreements/response/general/name" /></recaudador_name>
								<rendicion_txn>0</rendicion_txn>
								<rendicion_monto>0</rendicion_monto>
								<hub_txn>0</hub_txn>
								<hub_monto>0</hub_monto>
								<diferencias_txn>0</diferencias_txn>
								<diferencias_monto>0</diferencias_monto>
								<carga />
															
							</xsl:otherwise-->
											
							</xsl:choose>
						</resultado-conciliacion>
						
				
				</resumen>
				<total>					
					<rendicion_txn><xsl:value-of select="sum($resultadoBD/Row/CANT_CARGA)" /></rendicion_txn>
					<rendicion_monto><xsl:value-of select="sum($resultadoBD/Row/MONTO_CARGA)" /></rendicion_monto>
					<hub_txn><xsl:value-of select="sum($resultadoBD/Row/CANT_CARGA) - (sum($resultadoBD/Row/CANT_NUEVOS) - sum($resultadoBD/Row/CANT_NO_INF))" /></hub_txn>
					<hub_monto><xsl:value-of select="sum($resultadoBD/Row/MONTO_CARGA) - (sum($resultadoBD/Row/MONTO_NUEVOS) - sum($resultadoBD/Row/MONTO_NO_INF))" /></hub_monto>
					<diferencias_txn><xsl:value-of select="sum($resultadoBD/Row/CANT_NUEVOS) + sum($resultadoBD/Row/CANT_NO_INF)" /></diferencias_txn>
					<diferencias_monto><xsl:value-of select="sum($resultadoBD/Row/MONTO_NUEVOS) + sum($resultadoBD/Row/MONTO_NO_INF)" /></diferencias_monto>
				
				</total>		
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
