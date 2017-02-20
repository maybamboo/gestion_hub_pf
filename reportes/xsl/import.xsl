<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY nbsp "&#160;">
<!ENTITY bull "&#8226;">
<!ENTITY deg "&#176;">
<!ENTITY copy "&#169;">
<!ENTITY reg "&#174;">
<!ENTITY trade "&#8482;">
<!ENTITY mdash "&#8212;">
<!ENTITY ldquo "&#8220;">
<!ENTITY rdquo "&#8221;">
<!ENTITY pound "&#163;">
<!ENTITY yen "&#165;">
<!ENTITY euro "&#8364;">
<!ENTITY aacute "&#225;">
<!ENTITY Aacute "&#193;">
<!ENTITY eacute "&#233;">
<!ENTITY Eacute "&#201;">
<!ENTITY iacute "&#237;">
<!ENTITY Iacute "&#205;">
<!ENTITY oacute "&#243;">
<!ENTITY Oacute "&#211;">
<!ENTITY uacute "&#250;">
<!ENTITY Uacute "&#218;">
<!ENTITY ntilde "&#241;">
<!ENTITY Ntilde "&#209;">
<!ENTITY iquest "&#191;">
<!ENTITY br "<![CDATA[<xsl:text disable-output-escaping='yes'>&lt;br&gt;</xsl:text>]]>
">
]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:portal="http://whatever" version="2.0">
	<xsl:variable name="xml-response" select="/documento"/>
	
	<!-- Funcion formatDocument -->
	<xsl:function name="portal:formatDocument">
		<xsl:param name="tpo" /><!-- Online o resto -->
		<xsl:param name="doc" /><!-- Online o resto -->
		<xsl:choose>
			<xsl:when test="$tpo=1">
				<xsl:value-of select="portal:formatRut($doc)" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$doc" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

	<!-- Funcion formatRut -->
        <xsl:function name="portal:formatRut">
        	<xsl:param name="rut" /><!-- Online o resto -->
		<xsl:variable name="num" select="substring($rut,0,string-length($rut))" />
		<xsl:variable name="dig" select="upper-case(substring($rut,string-length($rut),1))" />
		<xsl:choose>
			<xsl:when test="string-length($num)>6">
				<xsl:value-of select="substring($num,string-length($num)-8,3)" />.<xsl:value-of
				select="substring($num,string-length($num)-5,3)" />.<xsl:value-of
				select="substring($num,string-length($num)-2,3)" />-<xsl:value-of select="$dig" />
			</xsl:when>
			<xsl:when test="string-length($num)>3">
				<xsl:value-of
				select="substring($num,string-length($num)-5,3)" />.<xsl:value-of
				select="substring($num,string-length($num)-2,3)" />-<xsl:value-of select="$dig" />
			</xsl:when>
			<xsl:when test="string-length($num)>0">
				<xsl:value-of select="$num" />-<xsl:value-of select="$dig" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$rut" />
			</xsl:otherwise>
		</xsl:choose>
        </xsl:function>


	<!-- Funcion para editar XSL -->
	<xsl:function name="portal:xsl-editor">
		<xsl:param name="p_editorMode" /><!-- Online o resto -->
		<xsl:param name="p_urlXslEditor" /><!-- url en donde se editara el xsl -->
		<xsl:param name="p_idPagina" /><!-- Identificador de la pagina a editar -->
		<xsl:param name="p_sessionId" /><!-- Identificador de la sesion del portal en jboss -->
		<xsl:param name="p_bloqueada" /><!-- Boolean que indica si la pagina se encuentra bloqueada para edicion -->
		<xsl:if test="$p_editorMode = 'Online'">
			<xsl:if test="$p_bloqueada = 'true'">
				&lt;div class="xsl-editor-lock"&gt;
					&lt;a href="
					<xsl:value-of select="concat($p_urlXslEditor,'?id_pag=',$p_idPagina,'&amp;sessionid=',$p_sessionId)" />
					&amp;accion=view&amp;seleccion=no" target="_blank"&gt;Editar XSL&lt;/a&gt;
				&lt;/div&gt;
			</xsl:if>
			<xsl:if test="$p_bloqueada = 'false'">
				&lt;div class="xsl-editor"&gt;
					&lt;a href="
					<xsl:value-of select="concat($p_urlXslEditor,'?id_pag=',$p_idPagina,'&amp;sessionid=',$p_sessionId)" />
					&amp;accion=view&amp;seleccion=no" target="_blank"&gt;Editar XSL&lt;/a&gt;
				&lt;/div&gt;
			</xsl:if>
			&nbsp;
			&lt;script language="JavaScript"&gt;
			function CopyToClipboard(text){window.prompt("Copiar Xml al portapapeles: Ctrl+C, Enter", text.replace(/&lt;footer.contenido.+&gt;&lt;\/footer&gt;/,'&lt;footer&gt;&lt;/footer&gt;'))};
			&lt;/script&gt;
			&lt;textarea id="xml-response" style="display:none;" name="xml-response"&gt;
			<xsl:copy-of select="$xml-response"/>
			&lt;/textarea&gt;
			&lt;div class="xml-editor"&gt;
				&lt;a href="#" onclick="CopyToClipboard(document.getElementById('xml-response').value.trim());return false;"&gt;Copiar XML&lt;/a&gt;
			&lt;/div&gt;
		</xsl:if>
	</xsl:function>

	<!-- NUEVA FUNCION PARA PAGINAR - AVALENZUELA -->
	<xsl:function name="portal:paginacion">
		<xsl:param name="pagSel" /><!-- Pagina seleccionada-->
		<xsl:param name="pagTotal" /><!-- Total de paginas -->
		<!-- xsl:param name="pagFuncion"/ --><!-- Nombre de funcion especial para paginar, si no viene se envía a paginar(); -->
		<xsl:variable name="pagFuncion"/><!-- Eliminar si se habilita parametro funcion -->

		<xsl:variable name="pagMostrar" select="number(5)"/><!-- Intervalo de paginas a mostrar -->

		<xsl:variable name="pagSeleccionada">
			<xsl:choose>
				<xsl:when test="not($pagSel)">
					<xsl:value-of select="1" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$pagSel" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:variable name="totalPaginas">
			<xsl:choose>
				<xsl:when test="not($pagTotal)">
					<xsl:value-of select="1" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$pagTotal" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:if test="(number($pagSeleccionada) &gt; number($totalPaginas)) or (number($totalPaginas) &lt; 1) or (number($pagSeleccionada) &lt;= 0)">
			<!-- return error -->
			<![CDATA[<table border="0" cellpadding="0" cellspacing="0" style="width:100%"><tr><td style="padding:5px;font-size:12px;color:#FF0000" align="right">Error!</td></tr></table>]]>
		</xsl:if>
	

		<!-- Calculo el grupo a mostrar  -->
		<xsl:variable name="totalGrupos" select="($totalPaginas div $pagMostrar)"/>

		<xsl:variable name="pagIni">
			<xsl:choose>
				<xsl:when test="number($totalPaginas) &lt; number($pagMostrar)">
					<xsl:value-of select="0" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="forVarPagIni">
						<xsl:with-param name="ini" select="0" />
						<xsl:with-param name="fin" select="number($totalGrupos)" />
						<xsl:with-param name="pagSel" select="number($pagSeleccionada)" />
						<xsl:with-param name="pagMostrar" select="number($pagMostrar)" />
						<xsl:with-param name="pagTotal" select="number($totalPaginas)" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
			
		<xsl:variable name="pagFin">
			<xsl:choose>
				<xsl:when test="number($totalPaginas) &lt; number($pagMostrar)">
					<xsl:value-of select="number($totalPaginas)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="forVarPagFin">
						<xsl:with-param name="ini" select="0" />
						<xsl:with-param name="fin" select="number($totalGrupos)" />
						<xsl:with-param name="pagSel" select="number($pagSeleccionada)" />
						<xsl:with-param name="pagMostrar" select="number($pagMostrar)" />
						<xsl:with-param name="pagTotal" select="number($totalPaginas)" />
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		
		<xsl:variable name="linkParte1">
			<xsl:choose>
				<xsl:when test="not($pagFuncion)">
					<![CDATA[<a href="javascript:paginar(]]>
				</xsl:when>
				<xsl:otherwise>
					<![CDATA[<a href="javascript:]]><xsl:value-of select="$pagFuncion"/><![CDATA[(]]>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="linkParte2"><xsl:text disable-output-escaping="no"><![CDATA[)">]]></xsl:text></xsl:variable>
		<xsl:variable name="linkParte3"><xsl:text disable-output-escaping="no"><![CDATA[</a>]]></xsl:text></xsl:variable>

		<!-- COMIENZA LA CREACION DE LAS PAGINAS -->
		<xsl:variable name="stringPaginas">

			<!-- xsl:value-of select="concat($pagIni,'&nbsp;|&nbsp;',$pagFin,'&nbsp;|&nbsp;',$totalPaginas,'&nbsp;|&nbsp;',$pagSeleccionada,'&nbsp;|&nbsp;',$pagMostrar)"/ -->
			<![CDATA[<script>function paginar(pag){document.formulario.pagina.value=pag;document.formulario.submit();}</script>]]>
			<![CDATA[<table border="0" cellpadding="0" cellspacing="0" style="width:100%;"><tr><td class="paginacion">]]>

			<xsl:if test="number($totalPaginas) &gt; 1">
				<xsl:choose>
					<xsl:when test="number($pagSeleccionada) = 1">
						<![CDATA[<strong>1</strong>]]>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="number($pagSeleccionada) &gt; number($pagMostrar)">
								<xsl:value-of select="concat($linkParte1,1,$linkParte2,'|&lt;&lt;',$linkParte3)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($linkParte1,1,$linkParte2,'1',$linkParte3)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>

			<xsl:if test="number($pagSeleccionada) &gt; number($pagMostrar)">
				<xsl:value-of select="concat($linkParte1,(number($pagSeleccionada)-1),$linkParte2,'&lt;',$linkParte3)"/>
			</xsl:if>

			<xsl:call-template name="forNumberPag">
				<xsl:with-param name="ini" select="number($pagIni+1)" />
				<xsl:with-param name="fin" select="number($pagFin+1)" />
				<xsl:with-param name="pagSel" select="number($pagSeleccionada)" />
				<xsl:with-param name="pagTotal" select="number($totalPaginas)" />
				<xsl:with-param name="linkParte1" select="$linkParte1" />
				<xsl:with-param name="linkParte2" select="$linkParte2" />
				<xsl:with-param name="linkParte3" select="$linkParte3" />
			</xsl:call-template>
			
			<xsl:if test="number($pagFin) &lt; (number($totalGrupos) * number($pagMostrar))"><xsl:value-of select="concat($linkParte1,(number($pagSeleccionada)+1),$linkParte2,'&gt;',$linkParte3)"/></xsl:if>
			
			<xsl:if test="number($totalPaginas) &gt; 1">
				<xsl:choose>
					<xsl:when test="number($pagSeleccionada) = number($totalPaginas)">
						<!-- [CDATA[&nbsp;<strong>]]><xsl:value-of select="$totalPaginas"/><![CDATA[</strong>]] -->
						<![CDATA[<strong>]]><xsl:value-of select="$totalPaginas"/><![CDATA[</strong>]]>
					</xsl:when>
					<xsl:otherwise>
						<xsl:choose>
							<xsl:when test="$pagFin &lt; ($totalGrupos * $pagMostrar)">
								<xsl:value-of select="concat($linkParte1,$totalPaginas,$linkParte2,'&gt;&gt;|',$linkParte3)"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="concat($linkParte1,$totalPaginas,$linkParte2,$totalPaginas,$linkParte3)"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>

			<![CDATA[</td></tr></table>]]>

		</xsl:variable>
		<xsl:value-of select="$stringPaginas"/>
	</xsl:function>

	<!-- For para asignar valor a pagina inicio -->
	<xsl:template name="forVarPagIni">
		<xsl:param name="ini" />
		<xsl:param name="fin" />
		<xsl:param name="pagSel" />
		<xsl:param name="pagMostrar" />
		<xsl:param name="pagTotal" />
		
		<xsl:if test="number($ini) &lt;= number($fin)">
			<xsl:if test="($pagSel &gt; ($pagMostrar * $ini)) and ($pagSel &lt;= ($pagMostrar*($ini+1)))">
				<xsl:if test="($pagTotal &lt; ($pagMostrar*($ini+1)))">
					<xsl:value-of select="$pagTotal - $pagMostrar"/>
				</xsl:if>
				<xsl:if test="($pagTotal &gt;= ($pagMostrar*($ini+1)))">
					<xsl:value-of select="$pagMostrar*$ini"/>
				</xsl:if>
			</xsl:if>
			<xsl:call-template name="forVarPagIni">
				<xsl:with-param name="ini" select="number($ini+1)" />
				<xsl:with-param name="fin" select="number($fin)" />
				<xsl:with-param name="pagSel" select="number($pagSel)" />
				<xsl:with-param name="pagMostrar" select="number($pagMostrar)" />
				<xsl:with-param name="pagTotal" select="number($pagTotal)" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- For para asignar valor a pagina fin -->
	<xsl:template name="forVarPagFin">
		<xsl:param name="ini" />
		<xsl:param name="fin" />
		<xsl:param name="pagSel" />
		<xsl:param name="pagMostrar" />
		<xsl:param name="pagTotal" />

		<xsl:if test="number($ini) &lt;= number($fin)">
			<xsl:if test="($pagSel &lt;= ($pagMostrar*($ini+1))) and ($pagSel &gt; ($pagMostrar*($ini)))">
				<xsl:choose>
					<xsl:when test="$pagTotal &lt; ($pagMostrar*($ini+1))">
						<xsl:value-of select="$pagTotal"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="number(number($pagMostrar) * (number($ini)+1))"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>

			<xsl:call-template name="forVarPagFin">
				<xsl:with-param name="ini" select="number($ini+1)" />
				<xsl:with-param name="fin" select="number($fin)" />
				<xsl:with-param name="pagSel" select="number($pagSel)" />
				<xsl:with-param name="pagMostrar" select="number($pagMostrar)" />
				<xsl:with-param name="pagTotal" select="number($pagTotal)" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<!-- For para imprimir los numeros de paginas -->
	<xsl:template name="forNumberPag">
		<xsl:param name="ini" />
		<xsl:param name="fin" />
		<xsl:param name="pagSel" />
		<xsl:param name="pagTotal" />
		<xsl:param name="linkParte1" />
		<xsl:param name="linkParte2" />
		<xsl:param name="linkParte3" />
		
		<xsl:if test="number($ini) &lt; number($fin)">
			<xsl:if test="number($ini) &lt; number($pagTotal) and number($ini) &gt; 1">
				<xsl:if test="number($ini) = number($pagSel)">
					<![CDATA[<strong>]]><xsl:value-of select="$ini"/><![CDATA[</strong>]]>
				</xsl:if>
				<xsl:if test="number($ini) != number($pagSel)">
					<xsl:value-of select="concat($linkParte1,$ini,$linkParte2,$ini,$linkParte3)"/>
				</xsl:if>
			</xsl:if>

			<xsl:call-template name="forNumberPag">
				<xsl:with-param name="ini" select="number($ini+1)" />
				<xsl:with-param name="fin" select="number($fin)" />
				<xsl:with-param name="pagSel" select="number($pagSel)" />
				<xsl:with-param name="pagTotal" select="number($pagTotal)" />
				<xsl:with-param name="linkParte1" select="$linkParte1" />
				<xsl:with-param name="linkParte2" select="$linkParte2" />
				<xsl:with-param name="linkParte3" select="$linkParte3" />
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
