<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  01_gmd:FileIdentifier.xsl
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that transforms the  Metadata_File_Identifier from Section 7 of the FGDC standard into the gmd:fileIdentifier  
                 ISO element.
   Modification History:
      Initial   Date      Change Request ID   Description

-->




<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gco="http://www.isotc211.org/2005/gco"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:default="http://www.opengis.net/wms"
   xmlns:esri_wms="http://www.esri.com/wms"
   xsi:schemaLocation="http://www.opengis.net/wms http://schemas.opengis.net/wms/1.3.0/capabilities_1_3_0.xsd">
   
   
   
   <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>

  

   <xsl:template name="FileIdentifier" match="/">
      

      <xsl:element name="gmd:fileIdentifier">
        
         <xsl:element name="gco:CharacterString">
          
            <xsl:variable name="URL"
               select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetMap[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"/>
            <xsl:variable name="postService" select="substring-after($URL,'services/')"/>
            <xsl:variable name="FinalService" select="substring-before($postService,'/MapServer')"/>

            
            <xsl:choose>
               <xsl:when test="contains($FinalService,'/')">
                  <xsl:variable name="application" select="substring-before($FinalService,'/')"/>
                  <xsl:variable name="service" select="substring-after($FinalService,'/')"/>
                  <!-- <xsl:comment>FinalService<xsl:value-of select="$FinalService"/></xsl:comment> -->
                  <xsl:comment>Please replace the yyyymmdd with correct date!!!!!!!!!!!</xsl:comment>
                  <xsl:variable name="fileName" select="concat($application,'_',$service,'_yyyymmdd.xml')"/>
                  <xsl:value-of select="$fileName"/>
                  </xsl:when>
               <xsl:otherwise>
                  <xsl:comment>Please replace the yyyymmdd with correct date!!!!!!!!!!!</xsl:comment>
                  <xsl:variable name="fileName" select="concat($FinalService,'_yyyymmdd.xml')"/>
                  <xsl:value-of select="$fileName"/>
               </xsl:otherwise>
            </xsl:choose>

         </xsl:element>

      </xsl:element>

   </xsl:template>
</xsl:stylesheet>
