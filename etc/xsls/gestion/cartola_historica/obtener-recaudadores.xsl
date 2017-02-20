<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
					
				<!--	
				<agreements>
					<entity>service-company</entity>
					<action>getAgreementsAndCollectors</action>
					<cid>999</cid>
					<parameters>
						<company-code>emphrdemo</company-code>
					</parameters>
				</agreements>-->


		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>hrconvenios</datasource>
			</properties>
				<!--<data>
					CALL PKG_AGREEMENT_HUB.getAgreementsAndCollectors()
				</data>-->
				<data>
					CALL PKG_AGREEMENT_HUB.getCollectors('<xsl:value-of select='/request-context/request/message/body/holding' />')
				</data>
		</transmission>	
				
	</xsl:template>
</xsl:stylesheet>
