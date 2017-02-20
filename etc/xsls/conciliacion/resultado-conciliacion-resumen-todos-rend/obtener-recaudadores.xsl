<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<!--
		<agreements>
				<entity>service-company</entity>
					<action>getCollectors</action>
					<cid>999</cid>
					<parameters>
						<code>emphrdemo</code>
					</parameters>
		</agreements>-->

		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>hrconvenios</datasource>
			</properties>
			<data>
				<!--el parametro indica el id del cliente, en este caos la empresa de servicio-->
				<!--CALL PKG_AGREEMENT_HUB.getCollectors(<xsl:value-of select="/request-context/request/message/body/company-code" />)-->
				CALL PKG_AGREEMENT_HUB.getCollectors(16)
			</data>
		</transmission>
				




	</xsl:template>
</xsl:stylesheet>
