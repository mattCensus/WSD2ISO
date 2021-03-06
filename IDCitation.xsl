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
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="IDCitation">
        <xsl:element name="gmd:citation">
            <xsl:element name="gmd:CI_Citation">

                <xsl:element name="gmd:title">
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/default:WMS_Capabilities/default:Capability[1]/default:Layer[1]/default:Title[1]"/>
                    </xsl:element>
                </xsl:element>

                <xsl:variable name="altTitle" select="/default:WMS_Capabilities/default:Service[1]/default:Title[1]"/>
                <xsl:variable name="mapServerAltTitlle" select="concat($altTitle, ' (MapServer)')"/>

                <xsl:element name="gmd:alternateTitle">
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$mapServerAltTitlle"/>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="gmd:alternateTitle">
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$altTitle"/>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="gmd:date">
                    <xsl:element name="gmd:CI_Date">

                        <xsl:element name="gmd:date">
                            <xsl:element name="gco:Date">    <xsl:comment>PLEASE INSERT THE DATE!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment></xsl:element>
                        </xsl:element>

                        <xsl:element name="gmd:dateType">
                            <xsl:element name="gmd:CI_DateTypeCode">
                                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#CI_DateTypeCode</xsl:attribute>
                                <xsl:attribute name="codeListValue">publication</xsl:attribute>
                                <xsl:attribute name="codeSpace">002</xsl:attribute> publication
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="gmd:collectiveTitle">
                    <xsl:element name="gco:CharacterString">TIGERweb Web Map Service (tigerWMS)</xsl:element>
                </xsl:element>



            </xsl:element>

        </xsl:element>

    </xsl:template>

</xsl:stylesheet>
