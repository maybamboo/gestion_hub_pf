<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:ext="http://exslt.org/common"  exclude-result-prefixes="ext">
      <xsl:template match="/">
            <transmission>
                <type>basedatos</type>
                    <properties>
                   <datasource>hrconvenios</datasource>
                    </properties>
                    <data>
			SELECT C.ID_CNV AS NUM_CONVENIO, 
					C.ID_EMP AS EMP_ID, 
					E.COD_EMP AS EMP_NAME, 
					E.DOC_EMP AS EMP_RUC  
			FROM CONVENIOS C, EMPRESAS E 
			WHERE E.ID_EMP = C.ID_EMP
	            </data>
            </transmission>
      </xsl:template>
</xsl:stylesheet>
