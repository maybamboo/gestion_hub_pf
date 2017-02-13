<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<transmission>
			<type>basedatos</type>
			<properties>
				<datasource>hrconvenios</datasource>
			</properties>						
			<data>
				select  valores.dsc_val AS DECIMALES
					from empresas
	                                join valores on
	                                valores.id_emp = empresas.id_emp
	                                join valor_atributo on
	                                valor_atributo.id_val_atr = valores.id_val_atr
	                                join atributos on
	                                atributos.id_atr = valor_atributo.id_atr
	                                where atributos.cod_atr = 'numeroDecimales'
	                                and empresas.COD_EMP='<xsl:value-of select='/request-context/services-responses/resultado_conciliacion_actualizar_estado/obtener_holding/response/data/Results/Row/HOLDING' />'
			</data>
											
		</transmission>
	</xsl:template>
</xsl:stylesheet>


