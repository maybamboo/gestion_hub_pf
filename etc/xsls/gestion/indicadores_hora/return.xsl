<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes"
	xmlns:err="http://www.w3.org/2005/xqt-errors" exclude-result-prefixes="xs xdt err fn">


	<xsl:template name="transaccion">

		<xsl:param name="count" select="0" />

		<xsl:if test="$count &lt; 24 ">

			<periodo>
				<xsl:choose>
					<xsl:when
						test="/request-context/services-responses/indicadores-hora/numero-transacciones/response/data/Results/Row[HORA = $count]">
						<hora>
							<xsl:value-of
								select="/request-context/services-responses/indicadores-hora/numero-transacciones/response/data/Results/Row[HORA = $count]/HORA" />
						</hora>
						<cantidad>
							<xsl:value-of
								select="/request-context/services-responses/indicadores-hora/numero-transacciones/response/data/Results/Row[HORA = $count]/CANTIDAD" />
						</cantidad>
					</xsl:when>
					<xsl:otherwise>
						<hora>
							<xsl:value-of select="$count" />
						</hora>
						<cantidad>0</cantidad>
					</xsl:otherwise>
				</xsl:choose>
			</periodo>

			<xsl:call-template name="transaccion">
				<xsl:with-param name="count" select="$count + 1" />
			</xsl:call-template>

		</xsl:if>

	</xsl:template>

	<xsl:template match="/">
		<message>
			<header>
				<status_code>0</status_code>
				<description>OK</description>
			</header>
			<body>
				<transacciones>
					<xsl:call-template name="transaccion">
						<xsl:with-param name="count" select="0" />
					</xsl:call-template>
				</transacciones>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
