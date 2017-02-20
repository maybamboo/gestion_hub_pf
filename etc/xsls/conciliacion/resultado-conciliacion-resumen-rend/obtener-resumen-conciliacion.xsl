<?xml version="1.0" encoding="windows-1252"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:template match="/">
                <transmission>
                        <type>basedatos</type>
                        <properties>
                                <datasource>bd_hub_trx</datasource>
                        </properties>
                       <xsl:choose>    
			           	<xsl:when test="/request-context/request/message/body/convenios/convenio != '-1'"><!--se cambia para que muestre los que se estan procesando tambien en la autorizacion-->
			                        <xsl:choose>    
			                                <xsl:when test="/request-context/request/message/body/estado_conciliacion = 'ACEPTADO'"><!--se cambia para que muestre los que se estan procesando tambien en la autorizacion-->
			                                <data>
			                                        SELECT 	ESTADO,
			                                        	FECHA_CARGA, 
									RESUMEN_CONCILIACION.ID_CARGA,
									CANT_CARGA, 
									(MONTO_CARGA/POWER(10, 2)) AS MONTO_CARGA, 
									CANT_ACEPT, 
									(MONTO_ACEPT/POWER(10, 2)) AS MONTO_ACEPT, 
									CANT_NO_INF, 
									(MONTO_NO_INF/POWER(10, 2)) AS MONTO_NO_INF, 
									CANT_INCONS, 
									(MONTO_INCONS /POWER(10, 2)) AS MONTO_INCONS,
									CANT_NUEVOS, 
									(MONTO_NUEVOS/ POWER(10, 2)) AS MONTO_NUEVOS, 
									CANT_TOTAL, 
									(MONTO_TOTAL / POWER(10, 2)) AS MONTO_TOTAL,
 									NOMBRE_ARCHIVO,
									RECAUDADOR_ID, 
									NUM_CONVENIO
			                                        FROM RESUMEN_CONCILIACION
								WHERE RECAUDADOR_ID = '<xsl:value-of select="/request-context/request/message/body/collectors/collector"/>' 
								AND ESTADO  IN ('PROCESANDO_AUTORIZADO' , 'AUTORIZADO', 'ACEPTADO')
			                                        AND TRUNC(FECHA_CARGA) > to_date(sysdate-1 ,'DD/MM/YY')
								AND NUM_CONVENIO = '<xsl:value-of select="/request-context/request/message/body/convenios/convenio"/>' 
			                                        ORDER BY  FECHA_CARGA DESC
			                                </data> 
			                                </xsl:when>
			                                <xsl:otherwise>
			                                <data>
								 SELECT  ESTADO,
								 	FECHA_CARGA,
									RESUMEN_CONCILIACION.ID_CARGA,
                                                                        CANT_CARGA,
                                                                        (MONTO_CARGA/POWER(10, 2)) AS MONTO_CARGA, 
                                                                        CANT_ACEPT,
                                                                        (MONTO_ACEPT/POWER(10, 2)) AS MONTO_ACEPT, 
                                                                        CANT_NO_INF,
                                                                        (MONTO_NO_INF/POWER(10, 2)) AS MONTO_NO_INF, 
                                                                        CANT_INCONS,
                                                                        (MONTO_INCONS /POWER(10, 2)) AS MONTO_INCONS,
                                                                        CANT_NUEVOS, 
                                                                        (MONTO_NUEVOS/ POWER(10, 2)) AS MONTO_NUEVOS, 
                                                                        CANT_TOTAL, 
                                                                        (MONTO_TOTAL / POWER(10, 2)) AS MONTO_TOTAL,
                                                                        NOMBRE_ARCHIVO,
                                                                        RECAUDADOR_ID, 
                                                                        NUM_CONVENIO
			                                        FROM RESUMEN_CONCILIACION
								WHERE RECAUDADOR_ID = '<xsl:value-of select="/request-context/request/message/body/collectors/collector"/>'
								AND ESTADO NOT IN ('PROCESANDO_AUTORIZADO' , 'AUTORIZADO', 'ACEPTADO')
			                                        AND NUM_CONVENIO = '<xsl:value-of select="/request-context/request/message/body/convenios/convenio"/>'
			                                        ORDER BY  FECHA_CARGA DESC
			                                </data>
			                                </xsl:otherwise>
			                        </xsl:choose>
			           </xsl:when>
                       <xsl:otherwise>   
	    	                   <xsl:choose>    
			                                <xsl:when test="/request-context/request/message/body/estado_conciliacion = 'ACEPTADO'"><!--se cambia para que muestre los que se estan procesando tambien en la autorizacion-->
			                                <data>
								 SELECT  ESTADO,
								 	FECHA_CARGA,
									RESUMEN_CONCILIACION.ID_CARGA,
                                                                        CANT_CARGA,
                                                                        (MONTO_CARGA/POWER(10, 2)) AS MONTO_CARGA, 
                                                                        CANT_ACEPT,
                                                                        (MONTO_ACEPT/POWER(10, 2)) AS MONTO_ACEPT, 
                                                                        CANT_NO_INF,
                                                                        (MONTO_NO_INF/POWER(10, 2)) AS MONTO_NO_INF, 
                                                                        CANT_INCONS,
                                                                        (MONTO_INCONS /POWER(10, 2)) AS MONTO_INCONS,
                                                                        CANT_NUEVOS, 
                                                                        (MONTO_NUEVOS/ POWER(10, 2)) AS MONTO_NUEVOS, 
                                                                        CANT_TOTAL, 
                                                                        (MONTO_TOTAL / POWER(10, 2)) AS MONTO_TOTAL,
                                                                        NOMBRE_ARCHIVO,
                                                                        RECAUDADOR_ID, 
                                                                        NUM_CONVENIO
			                                        FROM RESUMEN_CONCILIACION
								WHERE RECAUDADOR_ID = '<xsl:value-of select="/request-context/request/message/body/collectors/collector"/>' 
								AND ESTADO  IN ('PROCESANDO_AUTORIZADO' , 'AUTORIZADO', 'ACEPTADO')
								AND TRUNC(FECHA_CARGA) > to_date(sysdate-1 ,'DD/MM/YY')
			                                        ORDER BY  FECHA_CARGA DESC
			                                </data> 
			                                </xsl:when>
			                                <xsl:otherwise>
			                                <data>
								 SELECT  ESTADO,
								 	FECHA_CARGA,
									RESUMEN_CONCILIACION.ID_CARGA,
                                                                        CANT_CARGA,
                                                                        (MONTO_CARGA/POWER(10, 2)) AS MONTO_CARGA, 
                                                                        CANT_ACEPT,
                                                                        (MONTO_ACEPT/POWER(10, 2)) AS MONTO_ACEPT, 
                                                                        CANT_NO_INF,
                                                                        (MONTO_NO_INF/POWER(10, 2)) AS MONTO_NO_INF, 
                                                                        CANT_INCONS,
                                                                        (MONTO_INCONS /POWER(10, 2)) AS MONTO_INCONS,
                                                                        CANT_NUEVOS, 
                                                                        (MONTO_NUEVOS/ POWER(10, 2)) AS MONTO_NUEVOS, 
                                                                        CANT_TOTAL, 
                                                                        (MONTO_TOTAL / POWER(10, 2)) AS MONTO_TOTAL,
                                                                        NOMBRE_ARCHIVO,
                                                                        RECAUDADOR_ID, 
                                                                        NUM_CONVENIO
			                                        FROM RESUMEN_CONCILIACION
								WHERE RECAUDADOR_ID = '<xsl:value-of select="/request-context/request/message/body/collectors/collector"/>'
								AND ESTADO NOT IN ('PROCESANDO_AUTORIZADO' , 'AUTORIZADO', 'ACEPTADO')
			                                        ORDER BY  FECHA_CARGA DESC
			                                </data>
			                                </xsl:otherwise>
			                        </xsl:choose>                       
					   </xsl:otherwise>
				</xsl:choose>

                                                                                        
                </transmission>
        </xsl:template>
</xsl:stylesheet>
