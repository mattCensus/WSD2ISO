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
    
  <xsl:import href="../WMS2ISO/EAContentInfo.xsl"/>
    
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 22, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p/>
            
            Date              Modifier   Change
            11/9/15           MMc        Added the KML distribution format 
        </xd:desc>
        
    </xd:doc>

    
    <xsl:template name="distInfo">
        <xsl:element name="gmd:distributionInfo">
            <xsl:element name="gmd:MD_Distribution">
                <xsl:call-template name="distributionFormat"/>
                <xsl:call-template name="distributor"/>
                <xsl:call-template name="transferOptions"/>
                <!--  <xsl:call-template name="EAContentInfo"/>-->
                <xsl:call-template name="getCapibilitiesURL"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="distributionFormat">
        <xsl:element name="gmd:distributionFormat">
            <xsl:element name="gmd:MD_Format">

                <xsl:element name="gmd:name">
                    <xsl:element name="gco:CharacterString">Web Service(http) </xsl:element>
                </xsl:element>

                <xsl:element name="gmd:version">
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/default:WMS_Capabilities/@version"/>
                    </xsl:element>
                </xsl:element>

            </xsl:element>
        </xsl:element>
        
        <xsl:for-each select="//default:WMS_Capabilities/default:Capability/default:Request/default:GetMap/default:Format">
            <xsl:variable name="postImage" select="substring-after(.,'image/')"></xsl:variable>
            <xsl:element name="gmd:distributionFormat">
            <xsl:element name="gmd:MD_Format">
            <xsl:element name="gmd:name">
                <xsl:element name="gco:CharacterString"><xsl:value-of select="$postImage"/> </xsl:element>
            </xsl:element>
            
            <xsl:element name="gmd:version">
                <xsl:attribute name="gco:nilReason">unknown</xsl:attribute>
                </xsl:element>
            </xsl:element>
                </xsl:element>
        </xsl:for-each>
        
        <xsl:element name="gmd:distributionFormat">
            <xsl:element name="gmd:MD_Format">
                
                <xsl:element name="gmd:name">
                    <xsl:element name="gco:CharacterString">kml</xsl:element>
                </xsl:element>
                
                <xsl:element name="gmd:version">
                    <xsl:element name="gco:CharacterString">2.2</xsl:element>
                </xsl:element>
                
            </xsl:element>
        </xsl:element>
        
    </xsl:template>

    <xsl:template name="distributor">
        <xsl:element name="gmd:distributor">
            <xsl:element name="gmd:MD_Distributor">

                <xsl:element name="gmd:distributorContact">
                    <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/a3ade798-946f-4d45-9dc9-b8e9a5d9866b</xsl:attribute>
                    <xsl:attribute name="xlink:title">originator - U.S. Department of Commerce, U.S. Census Bureau, Geography Division, Spatial Products Software Branch</xsl:attribute>
                </xsl:element>

                <xsl:element name="gmd:distributionOrderProcess">
                    <xsl:element name="gmd:MD_StandardOrderProcess">
                        <xsl:element name="gmd:fees">
                            <xsl:element name="gco:CharacterString">NONE </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="transferOptions">
        <xsl:element name="gmd:transferOptions">
            <xsl:element name="gmd:MD_DigitalTransferOptions">
                <xsl:element name="gmd:onLine">
                    <xsl:element name="gmd:CI_OnlineResource">

                        <xsl:element name="gmd:linkage">
                            <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/tigerwebmain/TIGERweb_main.html</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:protocol">
                            <xsl:element name="gco:CharacterString">HTTP/1.1</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:name">
                            <xsl:element name="gco:CharacterString">TIGERweb</xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:description">
                            <xsl:element name="gco:CharacterString"> The TIGERweb Web Map Service (WMS) provides maps of geographic entities from the U.S. Census
                                Bureau Topologically Integrated Geographic Encoding and ReferencingSystem (TIGER) geodatabase. The TIGERweb WMS is intended to meet the
                                needs of web application developers inside and outside the Census Bureau who want to embed data contained within the TIGER geodatabase
                                into their web application. The TIGERweb WMS map layers are grouped by the following geographies: Transportation (Roads and Railroads),
                                Tribal Census Tracts and Block Groups, Census Tracts and Blocks, Military Installations, School Districts, Places and County
                                Subdivisions, American Indian, Alaska Native, and Native Hawaiian Areas, Legislative Areas, Census Regions and Divisions, Urban Areas
                                - Census 2000, Metropolitan and Micropolitan Statistical Areas and Related Statistical Areas, Hydrography, States and Counties.
                            </xsl:element>
                        </xsl:element>

                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template name="getCapibilitiesURL">
        <xsl:variable name="fullURLLink" select="/default:WMS_Capabilities/default:Capability/default:Request/default:GetCapabilities/default:DCPType/default:HTTP/default:Get/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"/>
        <xsl:variable name="fullURL" select="concat($fullURLLink, 'service=wms&amp;version=1.1.1&amp;request=GetCapabilities')"/>
        <xsl:element name="gmd:transferOptions">
            <xsl:element name="gmd:MD_DigitalTransferOptions">
                <xsl:element name="gmd:onLine">
                    <xsl:element name="gmd:CI_OnlineResource">
                        
                        <xsl:element name="gmd:linkage"> 
                         <!--    <xsl:element name="gmd:URL"><xsl:value-of select="$fullURL"/></xsl:element>--> 
                            <xsl:element name="gmd:URL"><xsl:value-of select="$fullURLLink"/></xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:name">
                            <!--  <xsl:element name="gco:CharacterString">Get Cabilities function</xsl:element>-->
                            <xsl:element name="gco:CharacterString">The root URL</xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:description">
                           <!--   <xsl:element name="gco:CharacterString">This is the get cabilities function. Please replace &amp; with the ampersand. </xsl:element>-->
                            <xsl:element name="gco:CharacterString">This is the root URL. For more information on how to use the OGC Web Mapping Service, see http://www.opengeospatial.org/standards/wms </xsl:element>
                        </xsl:element>
                        
                    </xsl:element> <!-- gmd:CI_OnlineResource  -->
                </xsl:element><!-- gmd:onLine -->
            </xsl:element><!-- gmd:MD_DigitalTransferOptions -->
          </xsl:element><!-- gmd:transferOptions  -->
        
        
    </xsl:template>
</xsl:stylesheet>
