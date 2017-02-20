<?xml version="1.0" encoding="UTF-8"?>
<!--remplazado, ya no se usa -->
<xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
                <message>
                        <header>
                                <status_code>0</status_code>
                                <description>ftp_data</description>
                        </header>
                        <body>
                                <convenios>

			         <xsl:for-each select="request-context/services-responses/ftp_file/list_file/response/data/Results/Row">
			               	<convenio>
                                                <NUM_CONVENIO><xsl:value-of select="NUM_CONVENIO" /></NUM_CONVENIO>
                                                <EMP_ID><xsl:value-of select="EMP_ID" /></EMP_ID>
                                                <EMP_NAME><xsl:value-of select="EMP_NAME" /></EMP_NAME>
                                                <EMP_RUC><xsl:value-of select="EMP_RUC" /></EMP_RUC>
                                                <TIPO>CONTABLE</TIPO>
                                                <TRANSFERENCIA>ftp</TRANSFERENCIA>
                                                <HOST>127.0.0.1</HOST>
                                                <USUARIO>root</USUARIO>
                                                <PASSWORD>redhat5</PASSWORD>
						<FECHAS>
                                                	<FECHA>20161102</FECHA>
                                                	<FECHA>20161101</FECHA>
						</FECHAS>
			                </convenio>
			         </xsl:for-each>
                                </convenios>
                       	</body>
                </message>
        </xsl:template>
</xsl:stylesheet>
