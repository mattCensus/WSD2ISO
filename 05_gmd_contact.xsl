<?xml version="1.0" encoding="UTF-8" ?>

<!--
   Name:  05_gmd:contact.xsl
   Author:  Matthew J. McCready
   Date:  20110601
   Description:  XSLT stylesheet that transforms the  contact information from Section 1 of FGDC format to the gmd:contact ISO element.
   Modification History:
      Initial   Date      Change Request ID   Description
        MMC     4/12/2013                      Modified to include UUIDS for the Geographic and Catrographic Products branches. If the metadata does not refer to one
                                                of these branches, the full CI_ResponsibleParty is included
-->


<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:gco="http://www.isotc211.org/2005/gco"
  xmlns:gfc="http://www.isotc211.org/2005/gfc" xmlns:gmd="http://www.isotc211.org/2005/gmd"
  xmlns:gmx="http://www.isotc211.org/2005/gmx" xmlns:gsr="http://www.isotc211.org/2005/gsr"
  xmlns:gss="http://www.isotc211.org/2005/gss" xmlns:gts="http://www.isotc211.org/2005/gts"
  xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:grp="http://www.altova.com/Mapforce/grouping" exclude-result-prefixes="fn grp xs xsi xsl"
  xmlns="http://www.isotc211.org/2005/gfc">
  <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>



  <xsl:template name="contact" match="/">
    <xsl:element name="gmd:contact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/4204476c-7eef-420f-84a1-85d5eb5d8e55</xsl:attribute>
      <xsl:attribute name="xlink:title">pointofContact - U.S. Department of Commerce, U.S. Census Bureau, Geography Division, National/State Geographic Partnerships Branch</xsl:attribute>
    </xsl:element>
  </xsl:template>
  
  <xsl:template name="pointOfContact" >
    <xsl:element name="gmd:pointOfContact">
      <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/4204476c-7eef-420f-84a1-85d5eb5d8e55</xsl:attribute>
      <xsl:attribute name="xlink:title">pointofContact - U.S. Department of Commerce, U.S. Census Bureau, Geography Division, National/State Geographic Partnerships Branch</xsl:attribute>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>

