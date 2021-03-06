<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:default="http://www.opengis.net/wms" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:grp="http://www.altova.com/Mapforce/grouping"
xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 18, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="IDKeywords">
     <!--  <xsl:comment>In the ID keywords template!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>  --> 
        <xsl:element name="gmd:descriptiveKeywords">
            <xsl:element name="gmd:MD_Keywords">
                
                <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Title">
                    <xsl:variable name="keyword" select="."/>
                   <!--  <xsl:comment>keyword:<xsl:value-of select="$keyword"/></xsl:comment>-->
                  
                        <xsl:choose>
                            <xsl:when test="contains($keyword,'lables')"/>                  
                            <xsl:when test="contains($keyword,'Labels')"/>
                            <xsl:otherwise>
                                  <xsl:element name="gmd:keyword">
                                  <xsl:element name="gco:CharacterString"><xsl:value-of select="."/></xsl:element>
                                        </xsl:element>
                            </xsl:otherwise>
                        </xsl:choose>
                        
                  
                </xsl:for-each>
                
                
                <xsl:element name="gmd:type">
                    <xsl:element name="gmd:MD_KeywordTypeCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_KeywordTypeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">theme</xsl:attribute>
                        <xsl:attribute name="codeSpace">005</xsl:attribute>
                        theme
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="StatePlaceKeywords">
        <xsl:element name="gmd:descriptiveKeywords">
            <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/48570596-75a0-404f-b4e0-dd8426d57bf8</xsl:attribute>
            <xsl:attribute name="xlink:title">Codes for the Identification of the States, the District of Columbia, Puerto Rico, and the Insular Areas of the United States</xsl:attribute>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>