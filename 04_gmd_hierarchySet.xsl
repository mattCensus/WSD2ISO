<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name: 04_gmd:hierarchySet.xsl 
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that inserts the proper ScopeCode for the hierarchy level. This is the level to which the metadata applies.
   Modification History:
      Initial   Date      Change Request ID   Description

-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco">
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



   <xsl:template name="hierarchySet" match="/">


      <xsl:element name="gmd:hierarchyLevel">

         <xsl:element name="gmd:MD_ScopeCode">
            <xsl:attribute name="codeList"
               >http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
            <xsl:attribute name="codeListValue">service</xsl:attribute> service </xsl:element>
      </xsl:element>
      
      <xsl:element name="gmd:hierarchyLevelName">
         <xsl:element name="gco:CharacterString">service - web map service</xsl:element>
      </xsl:element>

   </xsl:template>
</xsl:stylesheet>
