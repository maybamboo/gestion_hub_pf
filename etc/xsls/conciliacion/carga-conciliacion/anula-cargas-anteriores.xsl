<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:ext="http://exslt.org/common"  exclude-result-prefixes="ext">
      <xsl:variable name="variables">
        <xsl:choose>
          <!--flujo continuar ingreso-->
          <xsl:when test="/request-context/request/request/parametros">
            <in_fecha><xsl:value-of select="/request-context/request/request/parametros/in_fecha" /></in_fecha>
            <collector><xsl:value-of select="/request-context/request/request/parametros/collector" /></collector>
            <contract><xsl:value-of select="/request-context/request/request/parametros/contract" /></contract>
          </xsl:when>
        </xsl:choose>
      </xsl:variable>
      <xsl:template match="/">
            <transmission>
                <type>basedatos</type>
                    <properties>
                   <datasource>bd_hub_trx</datasource>
                    </properties>
                                          <data>
					  UPDATE resumen_conciliacion
					  SET estado                             = 'ERROR_CARGA'
					  WHERE TO_CHAR(FECHA_CARGA, 'yyyyMMdd') = '<xsl:value-of select="ext:node-set($variables)/in_fecha" />'
					  AND RECAUDADOR_ID                      = '<xsl:value-of select="ext:node-set($variables)/collector" />'
					  AND estado NOT                        IN ('ERROR_CARGA','NO_ACEPTADO','NO_AUTORIZADO')
               
                                          </data>
            </transmission>
      </xsl:template>
</xsl:stylesheet>
