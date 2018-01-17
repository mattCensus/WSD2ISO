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
            <xd:p/>
        </xd:desc>
    </xd:doc>
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Apr 24, 2015</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p></xd:p>
        </xd:desc>
    </xd:doc>
    
    <xsl:template name="EAContentInfo">
        <xsl:variable name="eaFileURL">http://meta.geo.census.gov/data/existing/decennial/GEO/GPMB/TIGERline/TIGER2016/</xsl:variable>
        <xsl:variable name="year">2016</xsl:variable>
        <xsl:variable name="FeatureCat">Feature Catalog for the </xsl:variable>
       <xsl:variable name="EntityAndAttribute">Entity and Attributes for the </xsl:variable>
        <xsl:comment> in the EA Content Section !!!!!!!!!!!</xsl:comment>
        
        <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer">
            
            <xsl:variable name="layerName" select="./default:Name"/>
            <!--  <xsl:comment>layerName:<xsl:value-of select="$layerName"/></xsl:comment>-->
            <xsl:choose>
                <xsl:when test="contains($layerName,'Labels')"/> <!-- seperates out the labels -->
            
            <xsl:otherwise>
            <xsl:variable name="catTiltle" select="concat($FeatureCat,$year,' ',$layerName)"/>
            
            <xsl:element name="gmd:transferOptions">
                <xsl:element name="gmd:MD_DigitalTransferOptions">
                    <xsl:element name="gmd:onLine">
                        <xsl:element name="gmd:CI_OnlineResource">
                
               
               <xsl:choose>
                <xsl:when test="$layerName = 'Counties'">
                    <xsl:variable name="abbr">county</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                    
                </xsl:when>
                   
                   <xsl:when test="$layerName = 'Traffic Analysis Zones'">
                       <xsl:variable name="abbr">TAZ</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> Feature Catolog for the 2010 Census Traffic Analysis Zone (TAZ) State-based Shapefile</xsl:element>
                       </xsl:element>
                   </xsl:when>
                 
                   <xsl:when test="$layerName = 'Traffic Analysis Districts'">
                       <xsl:variable name="abbr">TAZ</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> Feature Catalog for 2011 2010 Census Traffic Analysis District (TAD) National Shapefile</xsl:element>
                       </xsl:element>
                   </xsl:when>
                   
                <xsl:when test="$layerName= 'States'">
                    <xsl:variable name="abbr">state</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Micropolitan Statistical Areas'">
                    <xsl:variable name="abbr">msa</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                   <!-- Metropolitan Statistical Areas -->
                   <xsl:when test="$layerName= 'Metropolitan Statistical Areas'">
                       <xsl:variable name="abbr">msa</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL">http://tigerweb.geo.census.gov/arcgis/rest/services/TIGERweb/tigerWMS_Current/MapServer/80</xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> Metropolitan Statistical Areas</xsl:element>
                       </xsl:element>
                   </xsl:when>
                   
                <xsl:when test="$layerName= 'Metropolitan Divisions'">
                    <xsl:variable name="abbr">metdiv</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Combined Statistical Areas'">
                    <xsl:variable name="abbr">csa</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Micropolitan New England City and Town Areas'">
                    <xsl:variable name="abbr">necta</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="$layerName= 'Metropolitan New England City and Town Areas'">
                    <xsl:variable name="abbr">necta</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"/></xsl:element>
                    </xsl:element>
                </xsl:when>

                <xsl:when test="$layerName= 'New England City and Town Area Divisions'">
                    <xsl:variable name="abbr">nectadiv</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Combined New England City and Town Areas'">
                    <xsl:variable name="abbr">cnecta</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census Urban Clusters'">
                    <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census Urbanized Areas'">
                    <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Regions'">
                    <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Divisions'">
                    <xsl:variable name="abbr">uac10</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2013 State Legislative Districts - Lower'">
                    <xsl:variable name="abbr">sldl</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                   
                   
                   <xsl:when test="$layerName= '2014 State Legislative Districts - Lower'">
                       <xsl:variable name="abbr">sldl</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                       </xsl:element>
                   </xsl:when>
                
                <xsl:when test="$layerName= '2013 State Legislative Districts - Upper'">
                    <xsl:variable name="abbr">sldu</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                   <xsl:when test="$layerName= '2014 State Legislative Districts - Upper'">
                       <xsl:variable name="abbr">sldu</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                       </xsl:element>
                   </xsl:when>
                   
                   <xsl:when test="$eaFileURL='111th Congressional Districts'">
                       <xsl:variable name="abbr">cd113</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> TIGER/Line&#174; Shapefiles 2010 Technical Documentation Shapefiles</xsl:element>
                       </xsl:element>
                   </xsl:when>
                   
                   
                <xsl:when test="$layerName= '113th Congressional Districts'">
                    <xsl:variable name="abbr">cd113</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                   
                   <xsl:when test="$layerName= '114th Congressional Districts'">
                       <xsl:variable name="abbr">cd114</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                       </xsl:element>
                   </xsl:when>   
                   
                   <xsl:when test="$layerName= '115th Congressional Districts'">
                       <xsl:variable name="abbr">cd115</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                       </xsl:element>
                   </xsl:when>   
                   
                
                <xsl:when test="$layerName= 'American Indian Joint-Use Areas'">
                    <xsl:variable name="abbr">aitsn</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Designated Statistical Areas'">
                    <xsl:variable name="abbr">tsa</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'State Designated Tribal Statistical Areas'">
                    <xsl:variable name="abbr">tsa</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Oklahoma Tribal Statistical Areas'">
                    <xsl:variable name="abbr">tsa</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Alaska Native Village Statistical Areas'">
                    <xsl:variable name="abbr">anrc</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Hawaiian Home Lands'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'State American Indian Reservations'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Off-Reservation Trust Lands'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Federal American Indian Reservations'">
                    <xsl:variable name="abbr">aiannh</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Subdivisions'">
                    <xsl:variable name="abbr">aitsn</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Alaska Native Regional Corporations'">
                    <xsl:variable name="abbr">anrc</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Designated Places'">
                    <xsl:variable name="abbr">place</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Incorporated Places'">
                    <xsl:variable name="abbr">place</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Consolidated Cities'">
                    <xsl:variable name="abbr">concity</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Subbarrios'">
                    <xsl:variable name="abbr">subbarrios</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'County Subdivisions'">
                    <xsl:variable name="abbr">cousub</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Estates'">
                    <xsl:variable name="abbr">estate</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Elementary School Districts'">
                    <xsl:variable name="abbr">elsd</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Secondary School Districts'">
                    <xsl:variable name="abbr">scsd</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Unified School Districts'">
                    <xsl:variable name="abbr">unsd</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Census Block Groups'">
                    <xsl:variable name="abbr">bg</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"/></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                
                   <xsl:when test="$layerName= '2010 Census Blocks'">
                       <xsl:variable name="abbr">bg</xsl:variable>
                       <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                       <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                       <xsl:element name="gmd:linkage">
                           <xsl:element name="gmd:URL">ftp://ftp2.census.gov/geo/tiger/TIGER2010/BG/2010/ </xsl:element>
                       </xsl:element>
                       <xsl:element name="gmd:name">
                           <xsl:element name="gco:CharacterString"> 2010 Block Groups</xsl:element>
                       </xsl:element>
                   </xsl:when>
                
                
                <xsl:when test="$layerName= 'Census Tracts'">
                    <xsl:variable name="abbr">tract</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Block Groups'">
                    <xsl:variable name="abbr">tbg</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= 'Tribal Census Tracts'">
                    <xsl:variable name="abbr">ttract</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census ZIP Code Tabulation Areas'">
                    <xsl:variable name="abbr">zcta510</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>
                
                <xsl:when test="$layerName= '2010 Census Public Use Microdata Areas'">
                    <xsl:variable name="abbr">puma10</xsl:variable>
                    <xsl:variable name="eaFile" select="concat($eaFileURL,$abbr,'/',$year,'_',$abbr,'.ea.iso.xml')"/>
                    <xsl:variable name="finalEAName" select="concat($EntityAndAttribute,$year, $layerName)"></xsl:variable>
                    <xsl:element name="gmd:linkage">
                        <xsl:element name="gmd:URL"><xsl:value-of select="$eaFile"/> </xsl:element>
                    </xsl:element>
                    <xsl:element name="gmd:name">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="$catTiltle"></xsl:value-of></xsl:element>
                    </xsl:element>
                </xsl:when>             
                            
                      <xsl:otherwise>
                          <xsl:comment>Unknown layer: <xsl:value-of select="$layerName"></xsl:value-of></xsl:comment>
                      </xsl:otherwise>
     
               </xsl:choose>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>