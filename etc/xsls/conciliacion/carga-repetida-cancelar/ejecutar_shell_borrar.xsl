<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ext="http://exslt.org/common"
	exclude-result-prefixes="ext">
	<xsl:variable name="variables">
		<filename><xsl:value-of select="/request-context/request/request/parametros/filename" /></filename>
		<rutaTemporal><xsl:value-of select="/request-context/request/request/parametros/rutaTemporal"/></rutaTemporal>
	</xsl:variable>
	<xsl:template match="/">

		<message>
			<header>
				<msg_type>runShell</msg_type>
				<action>runShell</action>
			</header>
			<body>
				<data>
					<shell_path>/disk1/gestion_hub_pf/rendiciones/</shell_path>
					<shell_name>borrar_archivo.sh</shell_name>
					<parameters_mask>{archivo}</parameters_mask>
					<parameters>
						<shellparam>
							<name>{archivo}</name>
							<value><xsl:value-of select="ext:node-set($variables)/rutaTemporal" />/<xsl:value-of select="ext:node-set($variables)/filename" /></value>
						</shellparam>
					</parameters>
				</data>
			</body>
		</message>
	</xsl:template>
</xsl:stylesheet>
