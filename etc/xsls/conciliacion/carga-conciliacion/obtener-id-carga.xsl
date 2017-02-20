<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:ext="http://exslt.org/common"  exclude-result-prefixes="ext">
      <xsl:variable name="data">
        <xsl:choose>

          <!--flujo continuar ingreso-->
          <xsl:when test="/request-context/request/request/parametros">
            <filename><xsl:value-of select="/request-context/request/request/parametros/filename" /></filename>
            <!-- <collector><xsl:value-of select="/request-context/request/request/parametros/collector" /></collector> -->
            <collector><xsl:value-of select="/request-context/request/request/parametros/doc_rec" /></collector>
          </xsl:when>

          <!--flujo ingresar-->
          <xsl:otherwise>
            <filename><xsl:value-of select="/request-context/request/message/body/data/filename" /></filename>
            <!-- <collector><xsl:value-of select="/request-context/request/message/body/data/collector" /></collector> -->
            <collector><xsl:value-of select="/request-context/request/message/body/data/doc_rec" /></collector>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>


      <xsl:template match="/">
            <transmission>
                <type>basedatos</type>
                    <properties>
                   <datasource>bd_hub_trx</datasource>
                    </properties>
                                          <data>
                select max(id_carga) as FOLIO
                from resumen_conciliacion
                where NOMBRE_ARCHIVO = '<xsl:value-of select="ext:node-set($data)/filename" />'
                and RECAUDADOR_ID = '<xsl:value-of select="ext:node-set($data)/collector" />'
                and estado = 'INICIANDO_CARGA'
                                          </data>
            </transmission>
      </xsl:template>
</xsl:stylesheet>

