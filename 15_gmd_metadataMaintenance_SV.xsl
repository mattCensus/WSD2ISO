<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:default="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv"
    xmlns:esri_wms="http://www.esri.com/wms" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 22, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="metadataMaintenance">
        <xsl:element name="gmd:metadataMaintenance">
            <xsl:element name="gmd:MD_MaintenanceInformation">
                
                <xsl:element name="gmd:maintenanceAndUpdateFrequency">
                    <xsl:element name="gmd:MD_MaintenanceFrequencyCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_MaintenanceFrequencyCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">asNeeded</xsl:attribute>
                        <xsl:attribute name="codeSpace">009</xsl:attribute>
                        asNeeded
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="gmd:updateScope">
                    <xsl:element name="gmd:MD_ScopeCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ScopeCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">service</xsl:attribute>
                        <xsl:attribute name="codeSpace">014</xsl:attribute>
                        service
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
</xsl:stylesheet>