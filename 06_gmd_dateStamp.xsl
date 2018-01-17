<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name: 06_gmd:dateStamp.xsl 
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that transforms metadata date (metd) element from chapter 7 of the FGDC standard to the gmd:dateStamp ISO element. This stylesheet    conists of two templates: dateStamp and dateStampFormat. The dateStamp template creates the gmd:dateStamp element and calls the dateStampFormat template. This later   template correctly formats the date in the ISO format and inserts it in the gco:Date element. 
   Modification History:
      Initial   Date      Change Request ID   Description

-->


<xsl:stylesheet version = "1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd"
   xmlns:gco="http://www.isotc211.org/2005/gco" 
>
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



<xsl:template name="dateStamp" match="/">


<xsl:element name="gmd:dateStamp">
<!-- <xsl:call-template name ="dateStampFormat"/> -->
        <xsl:element name="gco:Date">  
               <xsl:comment>PLEASE INSERT THE DATE!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>
        </xsl:element>
</xsl:element>

</xsl:template>

<xsl:template name="dateStampFormat">
<xsl:variable name ="MetDate" select= "//metadata/metainfo/metd"/>
<xsl:variable name="year"  select ="substring($MetDate,1,4)"/>
<xsl:variable name="month" select ="substring($MetDate,5,2)"/>
<xsl:variable name="monthLength" select="string-length($month)"/>
<xsl:variable name="day"   select ="substring($MetDate,7,2)"/>
<xsl:variable name="dayLength" select="string-length($day)"/>

<xsl:choose>
<xsl:when test="$dayLength>0">

<xsl:variable name="dateFormat" select="concat($year, '-',$month,'-',$day)"/>
	<xsl:element name="gco:Date">  
		<xsl:value-of select ="$dateFormat"/>
	</xsl:element>
</xsl:when>

<xsl:when test="$monthLength >0">
<xsl:variable name="dateFormat" select="concat($year, '-',$month)"/>
        <xsl:element name="gco:Date">
                <xsl:value-of select ="$dateFormat"/>
        </xsl:element>
</xsl:when>
<xsl:otherwise>
<xsl:variable name="dateFormat" select="$year"/>
        <xsl:element name="gco:Date">
                <xsl:value-of select ="$dateFormat"/>
        </xsl:element>

</xsl:otherwise>
</xsl:choose>

</xsl:template>
</xsl:stylesheet>
