<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:bnsc="http://whatever"
    version="2.0" id="$id">
    
    <!-- Lista de funciones v 1.5 -->
    
    <!-- formatos decimales por defecto -->
    <xsl:decimal-format name="us" decimal-separator='.' grouping-separator=',' />
    <xsl:decimal-format name="eu" decimal-separator=',' grouping-separator='.' />
    
    <!-- valores que DEBEN estar en el header de sesion del sitio -->
    
    <xsl:variable name="ffecha" select="/documento/header/sesion/fmt_fec_rgn"/>
    <xsl:variable name="fhora" select="/documento/header/sesion/fmt_hra_rgn"/>
    <xsl:variable name="fnumero" select="/documento/header/sesion/fmt_num_rgn"/>
    <xsl:variable name="fmoneda" select="/documento/header/sesion/fmt_cur_rgn"/>
    <xsl:variable name="prefijo" select="/documento/header/sesion/dsc_pre_cur_rgn"/>
    <xsl:variable name="decimal" select="/documento/header/sesion/dsc_sep_dec_rgn"/>
    
    <!-- Funcion que formatea los valores tipo fechahora -->
    <xsl:function name="bnsc:frmt-fechahora">
        <xsl:param name="fecha" />
        <xsl:if test="string-length($fecha)!=0">
            <xsl:variable name="fec" as="xs:dateTime" select="xs:dateTime(bnsc:prepara-fechahora($fecha))"/>
            <xsl:value-of select="format-dateTime($fec, concat($ffecha,' ',$fhora))"/>
        </xsl:if>
    </xsl:function>
    
    <!-- Funcion que formatea los valores tipo fecha -->
    <xsl:function name="bnsc:frmt-fecha">
        <xsl:param name="fecha"/>
        <xsl:if test="string-length($fecha)!=0">
            <xsl:variable name="tm" as="xs:date" select="xs:date(bnsc:prepara-fecha($fecha))"/>
            <xsl:value-of select="format-date($tm, $ffecha)"/>
        </xsl:if>
    </xsl:function>
    
    <!-- Funcion que formatea los valores tipo hora TO DO -->
    <xsl:function name="bnsc:frmt-hora">
        <xsl:param name="hora" />
        <!-- <xsl:variable name="tm" as="xs:time" select="xs:time($hora)"/> -->
        <!-- <xsl:value-of select="format-time($tm, $fhora)"/> -->
	<xsl:value-of select="$hora" />
    </xsl:function>
    
    
    <!-- prepara el timestamp para poder ser procesado por los otros metodos -->
    <xsl:function name="bnsc:prepara-fechahora">
        <xsl:param name="ts"/>
        <xsl:variable name="timestamp" as="xs:string" select="string($ts)"/>
        <xsl:choose>
            <xsl:when test="contains($timestamp,'T')">
                <xsl:value-of select="concat(bnsc:prepara-fecha(substring-before($timestamp,'T')),'T',substring(substring-after($timestamp,'T'),0,9))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat(bnsc:prepara-fecha(substring-before($timestamp,' ')),'T',substring(substring-after($timestamp,' '),0,9))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- prepara la fecha para poder ser procesada por los otros metodos -->
    <xsl:function name="bnsc:prepara-fecha">
        <xsl:param name="fecha" />
        <xsl:variable name="year" as="element(group)*">
        <xsl:choose>
            <xsl:when test="contains($fecha,'-') or contains($fecha,'.')  or contains($fecha,'/') or contains($fecha,' ') ">               
                    <xsl:analyze-string regex="(^[0-9]*)([- /.])([0-9]*)([- /.])([0-9]*)" select="$fecha">
                        <xsl:matching-substring>
                            <group>
                                <val1><xsl:value-of select="regex-group(1)"/></val1>
                                <val2><xsl:value-of select="regex-group(3)"/></val2>
                                <val3><xsl:value-of select="regex-group(5)"/></val3>
                            </group>   
                        </xsl:matching-substring>
                    </xsl:analyze-string>
                </xsl:when>
                <xsl:otherwise>
                        <xsl:analyze-string regex="(^[0-9]{{4}})([0-9]{{2}})([0-9]{{2}})" select="$fecha">
                            <xsl:matching-substring>
                                <group>
                                    <val1><xsl:value-of select="regex-group(1)"/></val1>
                                    <val2><xsl:value-of select="regex-group(2)"/></val2>
                                    <val3><xsl:value-of select="regex-group(3)"/></val3>
                                </group>   
                            </xsl:matching-substring>
                        </xsl:analyze-string>         
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="string-length($year[1]/val1) = 4">
                <xsl:choose>
                    <xsl:when test="number($year[1]/val2) > 12">
                        <xsl:variable name="fec" as="xs:date" select="xs:date(concat($year[1]/val1,'-',$year[1]/val3,'-',$year[1]/val2))"/>
                        <xsl:value-of select="$fec"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="fec" as="xs:date" select="xs:date(concat($year[1]/val1,'-',$year[1]/val2,'-',$year[1]/val3))"/>
                        <xsl:value-of select="$fec"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="number($year[1]/val2) > 12">
                        <xsl:variable name="fec" as="xs:date" select="xs:date(concat($year[1]/val3,'-',$year[1]/val1,'-',$year[1]/val2))"/>
                        <xsl:value-of select="$fec"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="fec" as="xs:date" select="xs:date(concat($year[1]/val3,'-',$year[1]/val2,'-',$year[1]/val1))"/>
                        <xsl:value-of select="$fec"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
    <!-- Funcion que formatea los valores tipo numero
         El formato del numero debe coincidir con el formato decimal (decimal format)-->
    <xsl:function name="bnsc:frmt-number">
        <xsl:param name="numero" />
        <xsl:choose>
            <xsl:when test="$decimal = ','">
                <xsl:value-of select="format-number(number(translate($numero, ',','.')), $fnumero, 'eu')"/>
            </xsl:when>
            <xsl:when test="$decimal = '.'">
                <xsl:value-of select="format-number(number($numero), $fnumero, 'us')"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$numero" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    <!-- Funcion que formatea los valores tipo moneda
         El formato de la moneda debe coincidir con el formato decimal (decimal format)-->
    <xsl:function name="bnsc:frmt-moneda">
        <xsl:param name="moneda" />
        <xsl:choose>
            <xsl:when test="$decimal = ','">
                <xsl:value-of select="concat($prefijo,' ',format-number(number(translate($moneda, ',','.')), $fmoneda,'eu'))" />
            </xsl:when>
            <xsl:when test="$decimal = '.'">
                <xsl:value-of select="concat($prefijo,' ',format-number(number($moneda), $fmoneda,'us'))" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($prefijo,' ',$moneda)" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
    
    <xsl:function name="bnsc:frmt-id">
        <xsl:param name="documento" />
        <xsl:param name="tipo" />
        <xsl:choose>
            <xsl:when test="$tipo = '1'">
                <xsl:choose>
                    <xsl:when test="contains($documento,'-')">
                        <xsl:value-of select="$documento"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="bnsc:frmt-rut($documento)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$tipo = '4'">
                <xsl:choose>
                    <xsl:when test="contains($documento,'-')">
                        <xsl:value-of select="$documento"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="bnsc:frmt-rut($documento)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="$tipo = '7'">
                <xsl:choose>
                    <xsl:when test="contains($documento,'.')">
                        <xsl:value-of select="$documento"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="bnsc:frmt-rif($documento)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$documento"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
    <!-- Funcion que formatea texto como rut -->
    <xsl:function name="bnsc:frmt-rut">
        <xsl:param name="documento" />
        <xsl:variable name="groups" as="element(group)*">
            <xsl:analyze-string regex="(^[0-9]*)([k|K|0-9])" select="$documento">
                <xsl:matching-substring>
                    <group>
                        <rut><xsl:value-of select="regex-group(1)"/></rut>
                        <dv><xsl:value-of select="regex-group(2)"/></dv>
                    </group>   
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="number($groups[1]/rut) = $groups[1]/rut">
                <xsl:value-of select="concat(format-number($groups[1]/rut,'#.###','eu'),'-',$groups[1]/dv)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$documento"/>    
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
    
    <!-- Funcion que formatea texto como rif -->
    <xsl:function name="bnsc:frmt-rif">
        <xsl:param name="documento" />
        <xsl:variable name="groups" as="element(group)*">
            <xsl:analyze-string regex="([VvEeJjPpGg])([0-9]*)([0-9])" select="$documento">
                <xsl:matching-substring>
                    <group>
                        <letra><xsl:value-of select="regex-group(1)"/></letra>
                        <rif><xsl:value-of select="regex-group(2)"/></rif>
                        <dv><xsl:value-of select="regex-group(3)"/></dv>
                    </group>   
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="number($groups[1]/rif) = $groups[1]/rif">
                <xsl:value-of select="concat($groups[1]/letra,'-',format-number($groups[1]/rif,'#.###','eu'),'-',$groups[1]/dv)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$documento"/>    
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>
    
</xsl:stylesheet>
