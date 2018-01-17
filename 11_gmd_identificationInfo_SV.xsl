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

    <xsl:import href="../WMS2ISO/IDCitation.xsl"/>
    <xsl:import href="../WMS2ISO/IDKeywords.xsl"/>
    <xsl:import href="../WMS2ISO/Serviceextent.xsl"/>
    <xsl:import href="../WMS2ISO/ServiceOperations.xsl"/>
    <xsl:import href="../WMS2ISO/LayerNameKeywords.xsl"/>
    <xsl:import href="../WMS2ISO/05_gmd_contact.xsl"/>
    <xsl:import href="../WMS2ISO/Abstract.xsl"/>

    <!-- file:/U:/ReleasedPerlScriptsandSchemas/XSLTSSchemsaModules/WMS2ISO/Serviceextent.xsl -->
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Oct 18, 2013</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="SV_IdentificationInfo">
        <xsl:element name="gmd:identificationInfo">
            <xsl:element name="srv:SV_ServiceIdentification">
                <xsl:call-template name="IDCitation"/>
                <xsl:call-template name="IDAbstract"/>
                <xsl:call-template name="idStatus"/>
                <xsl:call-template name="pointOfContact"/>
                <xsl:call-template name="idResourceMaintenance"/>
                <xsl:call-template name="IDKeywords"/>
                <xsl:call-template name="StatePlaceKeywords"/>
                <xsl:call-template name="serviceType"/>

                <xsl:call-template name="serviceExtent"/>
                <xsl:call-template name="couplingType"/>
                <xsl:call-template name="containsOperations"/>

            </xsl:element>
        </xsl:element>
    </xsl:template>

  

    <xsl:template name="idStatus">
        <xsl:element name="gmd:status">
            <xsl:element name="gmd:MD_ProgressCode">
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_ProgressCode</xsl:attribute>
                <xsl:attribute name="codeListValue">completed</xsl:attribute>
                <xsl:attribute name="codeSpace">001</xsl:attribute> completed </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="idResourceMaintenance">
        <xsl:element name="gmd:resourceMaintenance">
            <xsl:element name="gmd:MD_MaintenanceInformation">
                <xsl:element name="gmd:maintenanceAndUpdateFrequency">
                    <xsl:element name="gmd:MD_MaintenanceFrequencyCode">
                        <xsl:attribute name="codeList">http://www.isotc211.org/2005/resources/Codelist/gmxCodelists.xml#MD_MaintenanceFrequencyCode</xsl:attribute>
                        <xsl:attribute name="codeListValue">biannually</xsl:attribute>
                        <xsl:attribute name="codeSpace">007</xsl:attribute> biannually
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="serviceType">

        <xsl:element name="srv:serviceType">
            <xsl:element name="gco:LocalName">urn:ogc:serviceType:WebMapService</xsl:element>
        </xsl:element>

        <xsl:element name="srv:serviceTypeVersion">
            <xsl:element name="gco:CharacterString">1.3.0</xsl:element>
        </xsl:element>

        <xsl:element name="srv:keywords">
            <xsl:element name="gmd:MD_Keywords">
                <xsl:element name="gmd:keyword">
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="/default:WMS_Capabilities/default:Service[1]/default:Name[1]"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>

        <xsl:call-template name="LayerKeywords"/>
    </xsl:template>

    <xsl:template name="couplingType">
        <xsl:element name="srv:couplingType">
            <xsl:element name="srv:SV_CouplingType">
                <xsl:attribute name="codeList">http://www.isotc211.org/2005/iso19119/resources/Codelist/gmxCodelists.xml#SV_CouplingType</xsl:attribute>
                <xsl:attribute name="codeListValue">loose</xsl:attribute>
                <xsl:attribute name="codeSpace">001</xsl:attribute> loose </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
