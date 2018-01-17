<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name: 07_gmd:metadataStandardName.xsl 
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that inserts the name and version of the metadata standard used to document the information.
   Modification History:
      Initial   Date      Change Request ID   Description

-->


<xsl:stylesheet version = "1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd"
   xmlns:gco="http://www.isotc211.org/2005/gco" 
>
<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



<xsl:template name="StandardName" match="/">
<xsl:element name="gmd:metadataStandardName">
<xsl:element name="gco:CharacterString">ISO 19115 Geographic Information - Metadata </xsl:element>
</xsl:element>



<xsl:element name="gmd:metadataStandardVersion">
<xsl:element name="gco:CharacterString">2009-02-15 </xsl:element>
</xsl:element>


</xsl:template>
</xsl:stylesheet>
