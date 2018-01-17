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
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Jul 29, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> matt</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xsl:template name="lalyer2Abbr">
        <!--  <xsl:comment>In the lalyer2Abbr template</xsl:comment>-->
        <xsl:variable name="eaFileURL">https://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TIGER2016/</xsl:variable>
        <xsl:variable name="year">tl_2016</xsl:variable>
        <xsl:variable name="year2012">TL2012</xsl:variable>
       <!--  <xsl:for-each select="../default:Layer"> -->
            <xsl:variable name="layerName" select="./default:Name"/>
            <xsl:choose>
                <xsl:when test="$layerName = 'Counties'">
                    <xsl:variable name="abbrA">county</xsl:variable>
                    <xsl:variable name="abbr">us_county</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbrA,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'States'">
                    <xsl:variable name="abbrA">state</xsl:variable>
                    <xsl:variable name="abbr">us_state</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbrA,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Micropolitan Statistical Areas'">
                    <xsl:variable name="abbr">cbsa</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName='Metropolitan Statistical Areas'">
                    <xsl:variable name="abbr">cbsa</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Metropolitan Divisions'">
                    <xsl:variable name="abbr">metdiv</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Combined Statistical Areas'">
                    <xsl:variable name="abbr">csa</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Micropolitan New England City and Town Areas'">
                    <xsl:variable name="abbrA">necta</xsl:variable>
                    <xsl:variable name="abbr">us_necta</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbrA,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                          <!--    <xsl:comment>check this one!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Metropolitan New England City and Town Areas'">
                    <xsl:variable name="abbrA">necta</xsl:variable>
                    <xsl:variable name="abbr">us_necta</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbrA,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>

                <xsl:when test="$layerName= 'New England City and Town Area Divisions'">
                    <xsl:variable name="abbr">nectadiv</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Combined New England City and Town Areas'">
                    <xsl:variable name="abbrA">cnecta</xsl:variable>
                    <xsl:variable name="abbr">cnecta</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbrA,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census Urban Clusters'">
                    <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <!--  <xsl:when test="$layerName= 'containUrban Clusters'">-->
                <xsl:when test="contains($layerName,'Urban Clusters')">
                  <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census Urbanized Areas'">
                    <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'Urbanized Areas')">
                    <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Regions'">
                 <!--     <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>-->
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Divisions'">
          <!--           <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>--> 
                </xsl:when>
                
                <xsl:when test="$layerName= '2013 State Legislative Districts - Lower'">
                    <xsl:variable name="abbr">sldl</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/','2013','_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'State Legislative Districts - Lower')">
                    <xsl:variable name="abbr">sldl</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2013 State Legislative Districts - Upper'">
                    <xsl:variable name="abbr">sldu</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'State Legislative Districts - Upper')">
                    <xsl:variable name="abbr">sldu</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '111th Congressional Districts'">
                    <xsl:variable name="abbr">cd111</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">http://www2.census.gov/geo/pdfs/maps-data/data/tiger/tgrshp2010/TGRSHP10SF1.pdf</xsl:element>
                    </xsl:element>
                </xsl:when>
                
                
                <xsl:when test="$layerName= '113th Congressional Districts'">
                    <xsl:variable name="abbr">cd113</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '114th Congressional Districts'">
                    <xsl:variable name="abbr">cd114</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'American Indian Joint-Use Areas'">
                    <xsl:variable name="abbr">aitsn</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Designated Statistical Areas'">
                    <xsl:variable name="abbr">aitsn</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'State Designated Tribal Statistical Areas'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Oklahoma Tribal Statistical Areas'">
                    <xsl:variable name="abbr">aitsn</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Alaska Native Village Statistical Areas'">
                    <xsl:variable name="abbr">anrc</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Hawaiian Home Lands'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'State American Indian Reservations'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Off-Reservation Trust Lands'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Federal American Indian Reservations'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Subdivisions'">
                    <xsl:variable name="abbr">aitsn</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Alaska Native Regional Corporations'">
                    <xsl:variable name="abbr">anrc</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Designated Places'">
                    <xsl:variable name="abbr">place</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Incorporated Places'">
                    <xsl:variable name="abbr">place</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Consolidated Cities'">
                    <xsl:variable name="abbr">concity</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Subbarrios'">
                    <xsl:variable name="abbrA">subbarrio</xsl:variable>
                    <xsl:variable name="abbr">subbarrio</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'County Subdivisions'">
                    <xsl:variable name="abbr">cousub</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Estates'">
                    <xsl:variable name="abbr">estate</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Elementary School Districts'">
                    <xsl:variable name="abbr">elsd</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Secondary School Districts'">
                    <xsl:variable name="abbr">scsd</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Unified School Districts'">
                    <xsl:variable name="abbr">unsd</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Block Groups'">
                    <xsl:variable name="abbr">bg</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Tracts'">
                    <xsl:variable name="abbr">tract</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Block Groups'">
                    <xsl:variable name="abbr">tbg</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Census Tracts'">
                    <xsl:variable name="abbrA">ttract</xsl:variable>
                    <xsl:variable name="abbr">us_ttract</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbrA,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census ZIP Code Tabulation Areas'">
                    <xsl:variable name="abbr">zcta510</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'ZIP Code Tabulation Areas')">
                    <xsl:variable name="abbr">zcta510</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census Public Use Microdata Areas'">
                    <xsl:variable name="abbr">puma10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'Public Use Microdata Areas')">
                    <xsl:variable name="abbr">puma10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                
                <xsl:when test="$layerName= 'State Legislative Districts - Upper'">
                    <xsl:variable name="abbr">sldu</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'State Legislative Districts - Lower'">
                    <xsl:variable name="abbr">sldl</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'Voting Districts')">
                    <xsl:variable name="abbr">vtd10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year2012,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName, 'Census Blocks')">
                    <xsl:variable name="abbr">bg</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'Urban Growth Areas')">
                    <xsl:variable name="abbr">vtd10</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year2012,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">http://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TL2012/ISO/uga10/2012_uga10.ea.iso.xml</xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'Traffic Analysis Zones')">
                    <xsl:variable name="abbr">taz</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year2012,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">http://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TL2011/taz/2011_taz10.ea.iso.xml</xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="contains($layerName,'Traffic Analysis Districts')">
                    <xsl:variable name="abbr">tad</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year2012,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">http://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TL2011/tad/tl_2011_us_tad10.ea.xml</xsl:element>
                    </xsl:element>
                </xsl:when>
                    
                <xsl:otherwise>
                    <xsl:variable name="abbr">Unknown</xsl:variable>
                    <xsl:element name="gmd:otherCitationDetails">
                        <xsl:variable name="eaFile"
                            select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.shp.ea.iso.xml')"/>
                        <xsl:element name="gco:CharacterString">
                            <xsl:value-of select="$eaFile"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:otherwise>
                
            </xsl:choose>

       <!--  </xsl:for-each> -->
    </xsl:template>
</xsl:stylesheet>
