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
    
    <xsl:import href="../WMS2ISO/ServiceDescriptions.xsl"/>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 21, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:variable name="mainstring">The Open Geospatial Consortium, Inc. Off Site (OGC) Web Map Service interface standard (WMS) provides a simple HTTP interface for
        requesting geo-registered map images from our geospatial database. The response to the request is one or more geo-registered map images that can be displayed in
        a browser or WMS client application. By gaining access to our data through our WMS, users can produce maps containing TIGERweb layers combined with layers from
        other servers.</xsl:variable>
    <xsl:variable name="urlPart1">http://tigerweb.geo.census.gov/arcgis/services/TIGERweb/</xsl:variable>
    <xsl:variable name="serviceName" select="/default:WMS_Capabilities/default:Service/default:Title"/>

    <xsl:template name="containsOperations">
        <xsl:if  test="//default:WMS_Capabilities/default:Capability/default:Request/default:GetCapabilities">
            <xsl:call-template name="GetCapabilities"/>
        </xsl:if>

        <xsl:if test="//default:WMS_Capabilities/default:Capability/default:Request/default:GetMap">
            <xsl:call-template name="GetMap"/>
        </xsl:if>

        <xsl:if test="//default:WMS_Capabilities/default:Capability/default:Request/default:GetFeatureInfo">
            <xsl:call-template name="GetFeatureInfo"/>
        </xsl:if>

        <xsl:if test="//default:WMS_Capabilities/default:Capability/default:Request/esri_wms:GetStyles">
            <xsl:call-template name="GetStyles"/>
        </xsl:if>

    </xsl:template>

    <xsl:template name="DCPList">
        <xsl:element name="srv:DCP">
            <xsl:element name="srv:DCPList">
                <xsl:attribute name="codeList">http://www.fgdc.gov/nap/metadata/register/codelists.html#IC_112</xsl:attribute>
                <xsl:attribute name="codeListValue">WebServices</xsl:attribute>WebServices
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="parameters">
        <xsl:element name="srv:parameters">
            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template name="protocol">
        <xsl:element name="gmd:protocol">
            <xsl:element name="gco:CharacterString"> HTTP/1.1</xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="name">
        <xsl:element name="gmd:name">
            <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template name="GetCapabilities">
        <xsl:element name="srv:containsOperations">
            <xsl:element name="srv:SV_OperationMetadata">

                <xsl:element name="srv:operationName">
                    <xsl:element name="gco:CharacterString"> GetCapabilities</xsl:element>
                </xsl:element>

                <xsl:call-template name="DCPList"/>
                <xsl:call-template name="GetCapabilitiesDescription"/>
                <xsl:call-template name="parameters"/>

                <xsl:element name="srv:connectPoint">
                    <xsl:element name="gmd:CI_OnlineResource">
                        <xsl:element name="gmd:linkage">
                            <xsl:element name="gmd:URL">
                                <!--   <xsl:variable name="fullURLLink" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetFeatureInfo[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"></xsl:variable>-->
                                <xsl:variable name="fullURLLink" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetCapabilities[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"></xsl:variable>
                                <xsl:comment>The URL is contained between the CDATA[ and the first]. Replace &amp; with with the ampersand</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <xsl:comment>Use an XML editor like Oxygen or a web browser like Firefox to view the metadata</xsl:comment>
                                <!-- <xsl:comment>urlPart1:<xsl:value-of select="$urlPart1"/> </xsl:comment>
                                <xsl:comment>serviceName <xsl:value-of select="$serviceName"/></xsl:comment>
                                <xsl:comment>fullURLlink:<xsl:value-of select="$fullURLLink"/> </xsl:comment> -->
                                <xsl:variable name="fullURL" select="concat($fullURLLink, 'service=wms&amp;version=1.1.1&amp;request=GetCapabilities')"/>
                                <xsl:text>  
                                </xsl:text>
                                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                <xsl:value-of select="$fullURL"/>
                                <!--  <xsl:text disable-output-escaping="yes">&amp;service=WMS]]&gt;</xsl:text>-->
                                <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                                <xsl:comment></xsl:comment>
                            </xsl:element>
                        </xsl:element>
                        <xsl:call-template name="protocol"/>
                         <xsl:call-template name="name"/>
                    </xsl:element>
                </xsl:element>

               
               

                
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="GetMap">
        <xsl:element name="srv:containsOperations">
            <xsl:element name="srv:SV_OperationMetadata">

                <xsl:element name="srv:operationName">
                    <xsl:element name="gco:CharacterString">GetMap</xsl:element>
                </xsl:element>

                <xsl:call-template name="DCPList"/>
                <xsl:call-template name="GetMapDescription"/>
                <xsl:call-template name="parameters"/>
                <xsl:element name="srv:connectPoint">
                    <xsl:element name="gmd:CI_OnlineResource">
                        <xsl:element name="gmd:linkage">
                            <xsl:element name="gmd:URL">
                                <xsl:comment>The URL is contained between the CDATA[ and the first]</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <!-- <xsl:comment>serviceName <xsl:value-of select="$serviceName"/></xsl:comment> -->
                                <xsl:variable name="fullURLLink" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetMap[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"/>
                                <xsl:comment>The URL is contained between the CDATA[ and the first]. Replace &amp; with with the ampersand</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <xsl:comment>Use an XML editor like Oxygen or a web browser like Firefox to view the metadata</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <xsl:comment>This operation requires some more paramters. See the WMS specification</xsl:comment>
                                <!-- <xsl:comment>urlPart1:<xsl:value-of select="$urlPart1"/> </xsl:comment>
                                    <xsl:comment>serviceName <xsl:value-of select="$serviceName"/></xsl:comment>
                                    <xsl:comment>fullURLlink:<xsl:value-of select="$fullURLLink"/> </xsl:comment> -->
                                <xsl:text>
                                </xsl:text>
                                <xsl:variable name="fullURL" select="concat($fullURLLink, 'service=wms&amp;version=1.1.1&amp;request=GetMap')"/>
                                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                <xsl:value-of select="$fullURL"/>
                                <!-- -->
                                <xsl:text disable-output-escaping="yes">]]&gt;</xsl:text>
                            </xsl:element>
                        </xsl:element>
                         <xsl:call-template name="protocol"/>
                        <xsl:call-template name="name"/>
                    </xsl:element>
                </xsl:element>

               
                

               
            </xsl:element>
        </xsl:element>

    </xsl:template>

    <xsl:template name="GetFeatureInfo">
        <xsl:element name="srv:containsOperations">
            <xsl:element name="srv:SV_OperationMetadata">

                <xsl:element name="srv:operationName">
                    <xsl:element name="gco:CharacterString">GetFeatureInfo</xsl:element>
                </xsl:element>

                <xsl:call-template name="DCPList"/>
               <xsl:call-template name="GetFeatureInfoDescription"></xsl:call-template>
                <xsl:call-template name="parameters"/>
                <xsl:element name="srv:connectPoint">
                    <xsl:element name="gmd:CI_OnlineResource">
                        <xsl:element name="gmd:linkage">
                            <xsl:element name="gmd:URL">
                                <xsl:comment>The URL is contained between the CDATA[ and the first]</xsl:comment>
                                <xsl:variable name="fullURLLink" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetFeatureInfo[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"></xsl:variable>
                                <xsl:comment>The URL is contained between the CDATA[ and the first]. Replace &amp; with with the ampersand</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <xsl:comment>Use an XML editor like Oxygen or a web browser like Firefox to view the metadata</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <xsl:comment>This operation requires some more paramters. See the WMS specification</xsl:comment>
                                <!-- <xsl:comment>urlPart1:<xsl:value-of select="$urlPart1"/> </xsl:comment>
                                    <xsl:comment>serviceName <xsl:value-of select="$serviceName"/></xsl:comment>
                                    <xsl:comment>fullURLlink:<xsl:value-of select="$fullURLLink"/> </xsl:comment> -->
                                <xsl:text>  
                                </xsl:text>
                                <xsl:variable name="fullURL" select="concat($fullURLLink, 'service=wms&amp;version=1.1.1&amp;request=GetMap')"/>
                                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                <xsl:value-of select="$fullURL"/>
                                <!-- -->
                                <xsl:text disable-output-escaping="yes">&amp;service=WMS]]&gt;</xsl:text>
                            </xsl:element>
                        </xsl:element>
                         <xsl:call-template name="protocol"/>
                        <xsl:call-template name="name"/>
                    </xsl:element>
                </xsl:element>

               
                

               
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="GetStyles">
        <xsl:element name="srv:containsOperations">
            <xsl:element name="srv:SV_OperationMetadata">

                <xsl:element name="srv:operationName">
                    <xsl:element name="gco:CharacterString">esri_wms:GetStyles</xsl:element>
                </xsl:element>

                <xsl:call-template name="DCPList"/>
                <xsl:call-template name="GetESRIStylesDescription"/>
                <xsl:call-template name="parameters"/>
                <xsl:element name="srv:connectPoint">
                    <xsl:element name="gmd:CI_OnlineResource">
                        <xsl:element name="gmd:linkage">
                            <xsl:element name="gmd:URL">
                                <xsl:comment>The URL is contained between the CDATA[ and the first]</xsl:comment>
                                <!-- <xsl:comment>serviceName <xsl:value-of select="$serviceName"
                                    /></xsl:comment> -->
                                <xsl:variable name="fullURLLink" select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/esri_wms:GetStyles[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"></xsl:variable>
                                <xsl:comment>The URL is contained between the CDATA[ and the first]. Replace &amp; with with the ampersand</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <xsl:comment>Use an XML editor like Oxygen or a web browser like Firefox to view the metadata</xsl:comment>
                                <xsl:text>
                                </xsl:text>
                                <xsl:comment>This operation requires some more paramters. See the WMS specification</xsl:comment>
                                <!-- <xsl:comment>urlPart1:<xsl:value-of select="$urlPart1"/> </xsl:comment>
                                    <xsl:comment>serviceName <xsl:value-of select="$serviceName"/></xsl:comment>
                                    <xsl:comment>fullURLlink:<xsl:value-of select="$fullURLLink"/> </xsl:comment> -->
                                <xsl:text>
                                    
                                </xsl:text>
                                <xsl:variable name="fullURL" select="concat($fullURLLink, 'service=wms&amp;version=1.1.1&amp;request=GetMap')"/>
                                <xsl:text disable-output-escaping="yes">&lt;![CDATA[</xsl:text>
                                <xsl:value-of select="$fullURL"/>
                                <!-- -->
                                <xsl:text disable-output-escaping="yes">&amp;service=WMS]]&gt;</xsl:text>
                            </xsl:element>
                        </xsl:element>
                         <xsl:call-template name="protocol"/>
                        <xsl:call-template name="name"/>
                    </xsl:element>
                </xsl:element>

               
                

                
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
