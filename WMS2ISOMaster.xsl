<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
    xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
    xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:grp="http://www.altova.com/Mapforce/grouping"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:srv="http://www.isotc211.org/2005/srv"
    exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">

    <xsl:import href="../WMS2ISO/01_gmd_FileIdentifier.xsl"/>
    <xsl:import href="../WMS2ISO/02_gmd_language.xsl"/>
    <xsl:import href="../WMS2ISO/03_gmd_characterSet.xsl"/>
    <xsl:import href="../WMS2ISO/03B_gmd_parentIdentifier.xsl"/>
    <xsl:import href="../WMS2ISO/04_gmd_hierarchySet.xsl"/>
    <xsl:import href="../WMS2ISO/05_gmd_contact.xsl"/>
    <xsl:import href="../WMS2ISO/06_gmd_dateStamp.xsl"/>
    <xsl:import href="../WMS2ISO/07_gmd_metadataStandardName.xsl"/>
    <xsl:import href="../WMS2ISO/08_gmd_dataSetURI.xsl"/>
    <xsl:import href="../WMS2ISO/11_gmd_identificationInfo_SV.xsl"/>
    <xsl:import href="../WMS2ISO/12A_ContentInfo_SV.xsl"/>
    <xsl:import href="../WMS2ISO/12_gmddistributionInfo_SV.xsl"/>
    <xsl:import href="../WMS2ISO/15A_gmd_metadataConstraint_SV.xsl"/>
    <xsl:import href="../WMS2ISO/15_gmd_metadataMaintenance_SV.xsl"/>
    <xsl:import href="../WMS2ISO/EAContentInfo.xsl"/>
    
    <xd:desc>
        <xd:p><xd:b>Created on:</xd:b> Oct 17, 2013</xd:p>
        <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
        <xd:p>This is the master stylesheet for WMS2ISO transforms. It converts a WMS xml page into an ISO 19115 file</xd:p>
        <xd:p>Date</xd:p>
    </xd:desc>

    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p>mrf2ISO/mrf2ISOMaster.xsl</xd:p>
            <xd:p><xd:b>Created on:</xd:b> Jan 7, 2014</xd:p>
            <xd:p>Calls the gmdfileIdentifier, gmdLanguage, gmd_characterSet, parentIdentifier, hierarchySet, contact, dateStamp, StandardName </xd:p>
            <xd:p>dataSetURI, spatialRepresentationInfo and referenceSystemInfo templates</xd:p>
            <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
            <xd:ul>
                <xd:li>Stylesheet                         Template                                                   Explanation                </xd:li>
                
            </xd:ul>
        </xd:desc>
    </xd:doc>
    


    <xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
    <!--  -->



    <xsl:template match="/">
        <!-- <xsl:comment> This is the July 19 Version </xsl:comment> -->
        <xsl:element name="gmi:MI_Metadata">
            
            <!-- inserts the xlinx namspace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='xlink']"/>
            <!-- inserts the gmd namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gmd']"/>
            <!-- inserts the gco namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gco']"/>
            <!-- inserts the gml namespace -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='gml']"/>
            <!-- INSERTS THE srv NAMESPACE -->
            <xsl:copy-of select="document('')/*/namespace::*[name()='srv']"/>
            
            <!--<xsl:attribute name="xsi:schemaLocation" separator=" ">
                 <xsl:sequence
                    select="'http://www.isotc211.org/2005/gmi Q:/users/mize.jacqueline/ISO/ISOngdc/schema/gmi/gmi.xsd'"
                /> 
            </xsl:attribute>-->

            <xsl:attribute name="xsi:schemaLocation">http://www.isotc211.org/2005/gmi http://www.ngdc.noaa.gov/metadata/published/xsd/schema.xsd</xsl:attribute>
            <xsl:call-template name="FileIdentifier"/>
            <xsl:call-template name="Metadata_Language"/>
            <xsl:call-template name="Metadata_Character_Set"/>
            <xsl:call-template name="parentIdentifier"/>
            <xsl:call-template name="hierarchySet"/>
            <xsl:call-template name="contact"/>
            <xsl:call-template name="dateStamp"/>
            <xsl:call-template name="StandardName"/>
            <xsl:call-template name="dataSetURI"/>
            <xsl:call-template name="SV_IdentificationInfo"/>
          <!--    <xsl:comment>The content Info should go here!!!!!!!!!!!</xsl:comment>-->
            <xsl:call-template name="contentInfo"/>
            <xsl:call-template name="distInfo"/>
            <xsl:call-template name="metadataConstraints"/>
            <xsl:call-template name="metadataMaintenance"/>
            
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
