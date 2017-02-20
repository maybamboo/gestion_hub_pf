<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>
			<header>
				<msg_type>resultado-conciliacion-resumen-rend</msg_type>
			</header>
			<body>			
				<collectors>
					<xsl:for-each select="/request-context/request/request/parametros/doc_rec">
						<xsl:if test=". != -1">
							<collector><xsl:value-of select="." /></collector>
						</xsl:if>						
					</xsl:for-each>									
				</collectors>	
                              	<convenios>
                                        <xsl:for-each select="/request-context/request/request/parametros/convenio">
                                                <xsl:if test=". != -1">
                                                        <convenio><xsl:value-of select="." /></convenio>
                                                </xsl:if>
                                        </xsl:for-each>
                                </convenios>
				<!--estado de la carga en resumen de conciliacion  por ej: AUTORIZADO / PRECONCILIADO -->
				<estado_conciliacion>PRECONCILIADO</estado_conciliacion>
			</body>							
		</message>
	</xsl:template>
</xsl:stylesheet>
