<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>

			<header>				
				<msg_type>reporte_conciliacion_actualizar_estado_autoriza</msg_type>
			</header>
      
			<body>
				<id_carga><xsl:value-of select="/request-context/request/request/parametros/idCargaSelec" /></id_carga>
				<auto>0</auto>
			        <xsl:choose>
					<xsl:when test="/request-context/request/request/parametros/confirmacionEstado = 'AUTORIZADO'">          
						<estado>AUTORIZADO</estado>
					</xsl:when>
					<xsl:otherwise>
						<estado>NO_AUTORIZADO</estado>
					</xsl:otherwise>
				</xsl:choose>				                              										
			</body>			
						
		</message>
	</xsl:template>
</xsl:stylesheet>
