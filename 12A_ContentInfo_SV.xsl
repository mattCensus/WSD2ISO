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

    <xsl:import href="layer2abbreviation.xsl"/>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 29, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="contentInfo">
          <!--   <xsl:comment>In the contentInfo template</xsl:comment>-->
        <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer">
            <!--               /default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer/default:Name[1] -->           
            <!--               /default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer/default:Name -->
            <!--               /default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer/default:Name  -->
            <!--              /default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Name -->
            <xsl:choose>
                <xsl:when test="./default:Layer/default:Name">
                  <!--  <xsl:comment>double layer!!!!!!!!!!!!!!!!!!!!!</xsl:comment> -->
                    <xsl:variable name="layerName" select="./default:Layer/default:Name"/>
                   <!--   <xsl:comment>layerName: <xsl:value-of select="$layerName"/></xsl:comment>-->
                    <xsl:variable name="contains" select="contains($layerName,'Labels')"/>
                    <!-- <xsl:comment>contains:<xsl:value-of select="$contains"/></xsl:comment> -->
                    <xsl:choose>
                        <xsl:when test="contains($layerName,'Labels')"/>
                        <xsl:when test="contains($layerName, 'Micropolitan Statistical Areas')"/>
                        <xsl:otherwise>
                            <xsl:variable name="eaFileURL">http://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TIGER2016/</xsl:variable>
                            <xsl:variable name="year">2016</xsl:variable>
                            <xsl:variable name="eaFile" select="concat($eaFileURL,$year,'_',$layerName,'.ea.iso.xml')"/>
                            <xsl:variable name="FeatureCat">Feature Catalog for the </xsl:variable>
                            <xsl:variable name="catTiltle" select="concat($FeatureCat,$year,' ',$layerName)"/>
                            <xsl:element name="gmd:contentInfo">
                                <xsl:element name="gmd:MD_FeatureCatalogueDescription">
                                    
                                    <xsl:element name="gmd:includedWithDataset">
                                        <xsl:element name="gco:Boolean">false</xsl:element>
                                    </xsl:element>
                                    
                                    <xsl:element name="gmd:featureTypes">
                                        <xsl:element name="gco:LocalName">
                                            <xsl:value-of select="$layerName"/>
                                        </xsl:element>
                                    </xsl:element>
                                    
                                    <xsl:element name="gmd:featureCatalogueCitation">
                                        
                                        <xsl:element name="gmd:CI_Citation">
                                            <xsl:element name="gmd:title">
                                                <xsl:choose>
                                                    <xsl:when test="contains($layerName,'Micropolitan Statistical Areas')">
                                                        <xsl:element name="gco:CharacterString">Feature Catalog for the 2016 Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA)</xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($layerName,'Metropolitan Statistical Areas')">
                                                        <xsl:element name="gco:CharacterString">Feature Catalog for the 2016 Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA)</xsl:element>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                    <xsl:element name="gco:CharacterString"><xsl:value-of select="$catTiltle"/></xsl:element></xsl:otherwise>
                                              </xsl:choose>
                                            </xsl:element>
                                            
                                            <xsl:element name="gmd:date">
                                                <xsl:element name="gmd:CI_Date">
                                                    
                                                    <xsl:element name="gmd:date">
                                                        <xsl:element name="gco:Date">
                                                            <xsl:value-of select="$year"/>
                                                        </xsl:element>
                                                    </xsl:element>
                                                    
                                                    <xsl:element name="gmd:dateType">
                                                        <xsl:element name="gmd:CI_DateTypeCode">
                                                            <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                            <xsl:attribute name="codeListValue">publication</xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:element>
                                                    
                                                    
                                                    
                                                </xsl:element>
                                            </xsl:element>
                                            
                                            <xsl:element name="gmd:citedResponsibleParty">
                                                <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/186104a8-278b-412d-9b61-d4d488142f3c</xsl:attribute>
                                                <xsl:attribute name="xlink:title">pointofContact - U.S. Department of Commerce, U.S. Census Bureau, Geography Division</xsl:attribute>
                                            </xsl:element>
                                            
                                            <!--  <xsl:element name="gmd:otherCitationDetails">
                                                <xsl:element name="gco:CharacterString"> <xsl:value-of select="$eaFile"/> </xsl:element>
                                                </xsl:element> -->
                                            <xsl:call-template name="lalyer2Abbr"/>
                                        </xsl:element>
                                        
                                        
                                    </xsl:element>
                                    
                                </xsl:element>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="./default:Name">


                    <xsl:variable name="layerName" select="./default:Name"/>

                    <xsl:variable name="contains" select="contains($layerName,'Labels')"/>
                    <!-- <xsl:comment>contains:<xsl:value-of select="$contains"/></xsl:comment> -->
                    <xsl:choose>
                        <xsl:when test="contains($layerName,'Labels')"/>
                        <xsl:otherwise>
                            <xsl:variable name="eaFileURL">http://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TIGER2015/</xsl:variable>
                            <xsl:variable name="year">2016</xsl:variable>
                            <xsl:variable name="eaFile" select="concat($eaFileURL,$year,'_',$layerName,'.ea.iso.xml')"/>
                            <xsl:variable name="FeatureCat">Feature Catalog for the </xsl:variable>
                            <xsl:variable name="catTiltle" select="concat($FeatureCat,$year,' ',$layerName)"/>
                            <xsl:element name="gmd:contentInfo">
                                <xsl:element name="gmd:MD_FeatureCatalogueDescription">

                                    <xsl:element name="gmd:includedWithDataset">
                                        <xsl:element name="gco:Boolean">false</xsl:element>
                                    </xsl:element>

                                    <xsl:element name="gmd:featureTypes">
                                        <xsl:element name="gco:LocalName">
                                            <xsl:value-of select="$layerName"/>
                                        </xsl:element>
                                    </xsl:element>

                                    <xsl:element name="gmd:featureCatalogueCitation">

                                        <xsl:element name="gmd:CI_Citation">
                                            <xsl:element name="gmd:title">
                                                <xsl:choose>
                                                    <xsl:when test="contains($layerName,'Micropolitan Statistical Areas')">
                                                        <xsl:element name="gco:CharacterString">Feature Catalog for the 2015 Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA)</xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="contains($layerName,'Metropolitan Statistical Areas')">
                                                        <xsl:element name="gco:CharacterString">Feature Catalog for the 2015 Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA)</xsl:element>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:element name="gco:CharacterString"><xsl:value-of select="$catTiltle"/></xsl:element></xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:element>

                                            <xsl:element name="gmd:date">
                                                <xsl:element name="gmd:CI_Date">

                                                  <xsl:element name="gmd:date">
                                                  <xsl:element name="gco:Date">
                                                  <xsl:value-of select="$year"/>
                                                  </xsl:element>
                                                  </xsl:element>

                                                  <xsl:element name="gmd:dateType">
                                                  <xsl:element name="gmd:CI_DateTypeCode">
                                                  <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                                  <xsl:attribute name="codeListValue">publication</xsl:attribute>
                                                  </xsl:element>
                                                  </xsl:element>



                                                </xsl:element>
                                            </xsl:element>

                                            <xsl:element name="gmd:citedResponsibleParty">
                                                <xsl:attribute name="xlink:href">https://www.ngdc.noaa.gov/docucomp/186104a8-278b-412d-9b61-d4d488142f3c</xsl:attribute>
                                                <xsl:attribute name="xlink:title">pointofContact - U.S. Department of Commerce, U.S. Census Bureau, Geography Division</xsl:attribute>
                                            </xsl:element>

                                            <!--  <xsl:element name="gmd:otherCitationDetails">
                                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$eaFile"/> </xsl:element>
                                    </xsl:element> -->
                                            <xsl:call-template name="lalyer2Abbr"/>
                                        </xsl:element>


                                    </xsl:element>

                                </xsl:element>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
               
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
