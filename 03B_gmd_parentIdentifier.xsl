<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  03B_gmd_parentIdentifier.xsl
   Author:  Matthew J. McCready
   Date:  20121219
   Description:  XSLT stylesheet that insert the parentIdentifier element. It is done based on the title
   Modification History:
      Initial     Date      Change Request ID   Description
        MMC       5/19/2015                     Fixed the spacing and updated the year
        MMC       5/26/2015                     Updated the year   
-->




<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco">
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



   <xsl:template name="parentIdentifier" match="/">
<!--      <xsl:comment> pre if:</xsl:comment> -->
      <xsl:element name="gmd:parentIdentifier">
         <xsl:element name="gco:CharacterString">TIGERweb, 2017, Series Information for the TIGERweb, Web Mapping Service and REST files</xsl:element>
      </xsl:element>

   </xsl:template>
</xsl:stylesheet>
