<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  02_gmd:language.xsl
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that transforms the Metadata_Language from section 7 of the FGDC standard into the gmd:language ISO element.
                 
   Modification History:
      Initial   Date      Change Request ID   Description
      MMC       5/19/2015                     Fixed the spacing            
-->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco">
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



   <xsl:template name="Metadata_Language" match="/">

      

            <xsl:element name="gmd:language">
               <xsl:element name="gco:CharacterString">eng; US</xsl:element>
            </xsl:element>

   </xsl:template>
</xsl:stylesheet>
