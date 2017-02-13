<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<!--	<agreements>
				<entity>service-company</entity>
					<action>getCollectors</action>
					<cid>999</cid>
					<parameters>
						<code>emphrdemo</code>
					</parameters>
				</agreements>
	-->

         <transmission>
         	<type>basedatos</type>
                <properties>
                    <datasource>hrconvenios</datasource>
                </properties>
                <!--<data>
                      CALL PKG_AGREEMENT_HUB.getCollectors(1)
                </data>-->
		<xsl:choose>
			<xsl:when test="/request-context/request/message/body/id_emp = ''">
			<data>
				CALL PKG_AGREEMENT_HUB.getCollectors(<xsl:value-of select='/request-context/request/message/body/id_holding' />, true )
			</data>
			</xsl:when>
			<xsl:otherwise>
			<data>
				CALL PKG_AGREEMENT_HUB.getCollectors(<xsl:value-of select='/request-context/request/message/body/id_emp' />, false )
			</data>
			</xsl:otherwise>
		</xsl:choose>
        </transmission>

	</xsl:template>
</xsl:stylesheet>
