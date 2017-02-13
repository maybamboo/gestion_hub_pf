<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">

		<response>
			<xsl:choose>				
				<xsl:when test="/message/body/response/estado = '0'">
					<code>0</code>	
          <description>Carga correcta</description>		
				</xsl:when>
				<xsl:otherwise>
					<code>-1</code>
          <description>Error en la carga</description>
				</xsl:otherwise>
			</xsl:choose>
		</response>  
  
	</xsl:template>
</xsl:stylesheet>