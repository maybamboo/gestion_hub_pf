<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:ext="http://exslt.org/common"  exclude-result-prefixes="ext">
                         
                         
      <xsl:variable name="variables">
        <xsl:choose>
          
          <!--flujo ingresar-->
          <xsl:when test="/request-context/request/request/parametros">
            <doc_rec><xsl:value-of select="/request-context/request/request/parametros/doc_rec" /></doc_rec>
            <contract><xsl:value-of select="/request-context/request/request/parametros/convenio" /></contract>
            <filename><xsl:value-of select="/request-context/request/request/parametros/filename" /></filename>          
            <in_fecha><xsl:value-of select="/request-context/request/request/parametros/in_fecha" /></in_fecha>
            <tipofecha><xsl:value-of select="/request-context/request/request/parametros/tipofecha" /></tipofecha>
            <checksum><xsl:value-of select="/request-context/request/request/parametros/checksum" /></checksum>
            <doc_emp><xsl:value-of select="/request-context/request/request/parametros/doc_emp" /></doc_emp>
            
          </xsl:when>
                    
          <!--flujo continuar ingreso-->
          <xsl:otherwise>
            <doc_rec><xsl:value-of select="/request-context/request/message/body/data/doc_rec" /></doc_rec>
            <contract><xsl:value-of select="/request-context/request/message/body/data/convenio" /></contract>  
            <filename><xsl:value-of select="/request-context/request/message/body/data/filename" /></filename>        
            <in_fecha><xsl:value-of select="/request-context/request/message/body/data/in_fecha" /></in_fecha>
            <tipofecha><xsl:value-of select="/request-context/request/message/body/data/tipofecha" /></tipofecha>
            <checksum><xsl:value-of select="/request-context/request/message/body/data/checksum" /></checksum>
            <doc_emp><xsl:value-of select="/request-context/request/message/body/data/doc_emp" /></doc_emp>

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
                INSERT INTO resumen_conciliacion(ID_CARGA,
                                              FECHA_CARGA,
                                              RECAUDADOR_ID,
                                              NUM_CONVENIO,
                                              NOMBRE_ARCHIVO,
                                              FECHA_PROCESO,
                                              TIPO_FECHA,
                                              CHECKSUM,
                                              ESTADO,
					      DOC_EMP)
                VALUES(SEQ_CARGA_REND.NEXTVAL,
                      SYSDATE,
                      '<xsl:value-of select="ext:node-set($variables)/doc_rec" />',
                      '<xsl:value-of select="ext:node-set($variables)/contract" />',
                      '<xsl:value-of select="ext:node-set($variables)/filename" />',
                      to_date('<xsl:value-of select="ext:node-set($variables)/in_fecha" />','yyyyMMdd'),
                      '<xsl:value-of select="ext:node-set($variables)/tipofecha" />',
                      '<xsl:value-of select="ext:node-set($variables)/checksum" />',
                      'INICIANDO_CARGA',
                      '<xsl:value-of select="ext:node-set($variables)/doc_emp" />'
		       )
					  </data>				  				               
            </transmission>
      </xsl:template>
</xsl:stylesheet>
