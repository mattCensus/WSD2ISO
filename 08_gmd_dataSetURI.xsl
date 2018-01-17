<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:default="http://www.opengis.net/wms"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">
    
    <xd:doc>
       
    <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 28, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="dataSetURI">
        <xsl:comment> This is the URI that is to be used to download this webmapService into a GIS platform like ARCGIS. 
        To download this into ArcMap, do the following
        1. Open ArcMap
        2. Click on the "Table of Contents" on the right side of the application
        3. Open or expand the GIS Servers Folder
        4. Select the "Add WMS" option
        5. An new window appears
        6. Add the URL below to URL box.
        7. Press the Get Layers button. All the layers should appear
        8. Press OK. All the layers for this Web Mapping Service should in your "Table of Contents"
        
        </xsl:comment>
         <xsl:element name="gmd:dataSetURI">
            <xsl:element name="gco:CharacterString"><xsl:value-of 
                select="/default:WMS_Capabilities/default:Service[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"/></xsl:element>
        </xsl:element>
    
      
        </xsl:template>
</xsl:stylesheet>