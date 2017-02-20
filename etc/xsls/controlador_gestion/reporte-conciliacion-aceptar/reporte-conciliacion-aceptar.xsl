<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<message>

			<header>				
				<msg_type>reporte_conciliacion_actualizar_estado</msg_type>
			</header>
      
			<body>
				<id_carga><xsl:value-of select="/request-context/request/request/parametros/idCargaSelec" /></id_carga>
				<auto>0</auto>	
			        <xsl:choose>
					<xsl:when test="/request-context/request/request/parametros/confirmacionEstado = 'ACEPTADO'">          
						<estado>ACEPTADO</estado>
					</xsl:when>
					<xsl:otherwise>
						<estado>NO_ACEPTADO</estado>
					</xsl:otherwise>
				</xsl:choose>				                              										
			</body>			
						
		</message>
	</xsl:template>
</xsl:stylesheet>
