<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  03_gmd:characterset.xsl
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that transforms the Metadata_Character_Set from section 7 of the FGDC Standard into the gmd:characterSet ISO element. This stylesheet consists of two templates: Metadata_Character_Set and Metadata_Character_Set_CodeSpace. The Metadata_Character_Set template creates the  gmd:characterSet and 
gmd:MD_CharacterSetCode elements while the Metadata_Character_Set_CodeSpace template inserts the correct codeSpace attribute.  
   Modification History:
      Initial   Date      Change Request ID   Description

-->




<xsl:stylesheet version = "1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd"
   xmlns:gco="http://www.isotc211.org/2005/gco" 
>
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



<xsl:template name="Metadata_Character_Set" match="/">



<xsl:element name="gmd:characterSet">

<xsl:element name="gmd:MD_CharacterSetCode">
<xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_CharacterSetCode</xsl:attribute> 
   <xsl:attribute name="codeListValue">8859part1</xsl:attribute>
   <xsl:attribute name="codeSpace">006</xsl:attribute>
<!-- <xsl:call-template name="Metadata_Character_Set_CodeSpace"/> -->

</xsl:element>
</xsl:element>

</xsl:template>

<xsl:template name="Metadata_Character_Set_CodeSpace">
<xsl:variable name="CharSet" select="/metadata/metainfo/Metadata_Character_Set"/>  
<xsl:choose>

<xsl:when test ="$CharSet = 'ucs2'">
<xsl:attribute name="codeSpace">001</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'ucs4'">
<xsl:attribute name="codeSpace">002</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'utf7'">
<xsl:attribute name="codeSpace">003</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'utf8'">
<xsl:attribute name="codeSpace">004</xsl:attribute>
</xsl:when> 

<xsl:when test ="$CharSet = 'utf16'">
<xsl:attribute name="codeSpace">005</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part1'">
<xsl:attribute name="codeSpace">006</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part2'">
<xsl:attribute name="codeSpace">007</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part3'">
<xsl:attribute name="codeSpace">008</xsl:attribute>
</xsl:when> 

<xsl:when test ="$CharSet = '8859part4'">
<xsl:attribute name="codeSpace">009</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part5'">
<xsl:attribute name="codeSpace">010</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part6'">
<xsl:attribute name="codeSpace">011</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part7'">
<xsl:attribute name="codeSpace">012</xsl:attribute>
</xsl:when> 

<xsl:when test ="$CharSet = '8859part8'">
<xsl:attribute name="codeSpace">013</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part9'">
<xsl:attribute name="codeSpace">014</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part10'">
<xsl:attribute name="codeSpace">015</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part11'">
<xsl:attribute name="codeSpace">016</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part13'">
<xsl:attribute name="codeSpace">018</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part14'">
<xsl:attribute name="codeSpace">019</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part15'">
<xsl:attribute name="codeSpace">020</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = '8859part16'">
<xsl:attribute name="codeSpace">021</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'jis'">
<xsl:attribute name="codeSpace">022</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'shiftJIS'">
<xsl:attribute name="codeSpace">023</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'eucJP'">
<xsl:attribute name="codeSpace">024</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'usAscii'">
<xsl:attribute name="codeSpace">025</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'ebcdic'">
<xsl:attribute name="codeSpace">026</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'eucKR'">
<xsl:attribute name="codeSpace">027</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'big5'">
<xsl:attribute name="codeSpace">028</xsl:attribute>
</xsl:when>

<xsl:when test ="$CharSet = 'GB2312'">
<xsl:attribute name="codeSpace">029</xsl:attribute>
</xsl:when>


</xsl:choose>
</xsl:template>

</xsl:stylesheet>
