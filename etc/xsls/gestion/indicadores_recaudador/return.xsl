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

				<transacciones>
					<xsl:for-each
						select="/request-context/services-responses/indicadores-recaudador/obtener-recaudadores/response/data/Results/Row">

						<!--<xsl:variable name="collector_id" select="code" />-->
						<!--<xsl:variable name="collector_id" select="ID_REC" />-->
						<xsl:variable name="collector_id" select="DOC_REC" />

						<xsl:choose>
							<xsl:when test="/request-context/services-responses/indicadores-recaudador/numero-transacciones/response/data/Results/Row[RECAUDADOR_ID = $collector_id]">

								<xsl:variable name="collector" select="/request-context/services-responses/indicadores-recaudador/numero-transacciones/response/data/Results/Row[RECAUDADOR_ID = $collector_id]" />

								<recaudador>
									<codigo>
										<!--<xsl:value-of select="code" />-->
										<xsl:value-of select="ID_REC" />
									</codigo>
									<nombre>
										<!--<xsl:value-of select="name" />-->
										<xsl:value-of select="NOM_REC" />
									</nombre>
									<cantidad>
                  
						        <xsl:choose>
							         <xsl:when	test="/request-context/request/message/body/tipo_grafico = '2'"> <!--grafico por monto-->
                          <!--<xsl:value-of select="format-number($collector/CANTIDAD,'#')" />                 -->
			<xsl:value-of select="$collector/CANTIDAD" /> 
							         </xsl:when>
							         <xsl:otherwise><!--grafico por cantidad transacciones --> 
                          <xsl:value-of select="$collector/CANTIDAD" />                         
							         </xsl:otherwise>                          
						          </xsl:choose>
                                                                          										
									</cantidad>
								</recaudador>

							</xsl:when>
							<xsl:otherwise>

								<recaudador>
									<codigo>
										<!--<xsl:value-of select="code" />-->
										<xsl:value-of select="ID_REC" />
									</codigo>
									<nombre>
										<!--<xsl:value-of select="name" />-->
										<xsl:value-of select="NOM_REC" />
									</nombre>
									<cantidad>0</cantidad>
								</recaudador>

							</xsl:otherwise>

						</xsl:choose>

					</xsl:for-each>

				</transacciones>

			</body>

		</message>
	</xsl:template>
</xsl:stylesheet>
