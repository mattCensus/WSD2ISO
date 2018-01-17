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
            <xd:p><xd:b>Created on:</xd:b> Dec 19, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:variable name="mainstring">The Open Geospatial Consortium, Inc. Off Site (OGC) Web Map
        Service interface standard (WMS) provides a simple HTTP interface for requesting
        geo-registered map images from our geospatial database. The response to the request is one
        or more geo-registered map images that can be displayed in a browser or WMS client
        application. By gaining access to our data through our WMS, users can produce maps
        containing TIGERweb layers combined with layers from other servers.</xsl:variable>
    
    <xsl:variable name="urlPart1">http://tigerweb.geo.census.gov/ArcGIS/services/</xsl:variable>
    <xsl:variable name="serviceName" select="/default:WMS_Capabilities/default:Service/default:Title"/>
    
    <xsl:template name="GetCapabilitiesDescription">
        <xsl:element name="srv:operationDescription">
            <xsl:element name="gco:CharacterString">
                <xsl:variable name="description"> The GetCapabilities operation returns parameters about the WMS. It returns results in the following </xsl:variable>
                <xsl:choose>
                    <xsl:when test="count(//default:WMS_Capabilities/default:Capability/default:Request/default:GetCapabilities/default:Format) >1">

                        <xsl:variable name="forVariable">formats: </xsl:variable>
                        <xsl:variable name="fullDescription" select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="forVariable">format: </xsl:variable>
                        <xsl:variable name="fullDescription" select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:otherwise>
                </xsl:choose>

                <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Request/default:GetCapabilities/default:Format">
                    <xsl:choose>
                        <xsl:when test="count(//default:WMS_Capabilities/default:Capability/default:Request/default:GetCapabilities/default:Format) >1">
                            <xsl:choose>
                                <xsl:when test="position() != last()">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">,&#032;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text> and </xsl:text>
                                    <xsl:value-of select="."/>
                                    <xsl:text>. </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>

            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GetMapDescription">
        <xsl:element name="srv:operationDescription">
            <xsl:element name="gco:CharacterString">
                <xsl:variable name="description"> The GetMap operation returns a map image. It returns results in the following </xsl:variable>
                <xsl:choose>
                    <xsl:when
                        test="count(//default:WMS_Capabilities/default:Capability/default:Request/default:GetMap/default:Format) >1">
                        <xsl:variable name="forVariable">formats: </xsl:variable>
                        <xsl:variable name="fullDescription"
                            select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="forVariable">format: </xsl:variable>
                        <xsl:variable name="fullDescription"
                            select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:for-each
                    select="/default:WMS_Capabilities/default:Capability/default:Request/default:GetMap/default:Format">
                    <!-- <xsl:value-of select="."/>
                        &#013; 
                        <xsl:text disable-output-escaping="yes">,&#032;</xsl:text>-->
                    <xsl:choose>
                        <xsl:when
                            test="count(//default:WMS_Capabilities/default:Capability/default:Request/default:GetMap/default:Format) >1">
                            <xsl:choose>
                                <xsl:when test="position() != last()">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">,&#032;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text> and </xsl:text>
                                    <xsl:value-of select="."/>
                                    <xsl:text>. </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GetFeatureInfoDescription">
        <xsl:element name="srv:operationDescription">
            <xsl:element name="gco:CharacterString">
                <xsl:variable name="description"> The GetFeatureInfo operation returns data about a coordinate of the map image for all map layers marked queryable.
                    It returns results in the following </xsl:variable>
                
                <xsl:choose>
                    <xsl:when
                        test="count(//default:WMS_Capabilities/default:Capability/default:Request/default:GetFeatureInfo/default:Format) >1">
                        
                        <xsl:variable name="forVariable">formats: </xsl:variable>
                        <xsl:variable name="fullDescription"
                            select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="forVariable">format: </xsl:variable>
                        <xsl:variable name="fullDescription"
                            select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                
                <xsl:for-each
                    select="/default:WMS_Capabilities/default:Capability/default:Request/default:GetFeatureInfo/default:Format">
                    <!-- <xsl:value-of select="."/>
                        &#013; 
                        <xsl:text disable-output-escaping="yes">,&#032;</xsl:text>-->
                    <xsl:choose>
                        <xsl:when
                            test="count(//default:WMS_Capabilities/default:Capability/default:Request/default:GetFeatureInfo/default:Format) >1">
                            <xsl:choose>
                                <xsl:when test="position() != last()">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">,&#032;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text> and </xsl:text>
                                    <xsl:value-of select="."/>
                                    <xsl:text>. </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="GetESRIStylesDescription">
        <xsl:element name="srv:operationDescription">
            <xsl:element name="gco:CharacterString">
                <xsl:variable name="description"> The esri_wms:GetStyles operation returns
                    user-defined styles from the WMS. It returns results in the following </xsl:variable>
                
                <xsl:choose>
                    <xsl:when
                        test="count(//default:WMS_Capabilities/default:Capability/default:Request/esri_wms:GetStyles/default:Format) >1">
                        <xsl:variable name="forVariable">formats:</xsl:variable>
                        <xsl:variable name="fullDescription"
                            select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name="forVariable">format: </xsl:variable>
                        <xsl:variable name="fullDescription"
                            select="concat($mainstring,$description,$forVariable)"/>
                        <xsl:value-of select="$fullDescription"/>
                    </xsl:otherwise>
                </xsl:choose>
                
                <xsl:for-each
                    select="//default:WMS_Capabilities/default:Capability/default:Request/esri_wms:GetStyles/default:Format">
                    <!-- <xsl:value-of select="."/>
                        &#013; 
                        <xsl:text disable-output-escaping="yes">,&#032;</xsl:text>-->
                    <xsl:choose>
                        <xsl:when
                            test="count(//default:WMS_Capabilities/default:Capability/default:Request/esri_wms:GetStyles/default:Format) >1">
                            <xsl:choose>
                                
                                
                                <xsl:when test="position() != last()">
                                    <xsl:value-of select="."/>
                                    <xsl:text disable-output-escaping="yes">,&#032;</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text> and </xsl:text>
                                    <xsl:value-of select="."/>
                                    <xsl:text>. </xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="."/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
