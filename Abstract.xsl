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
            <xd:p><xd:b>Created on:</xd:b> Jan 2, 2014</xd:p>
            <xd:p><xd:b>Author:</xd:b> mccre004</xd:p>
            <xd:p/>
        </xd:desc>
    </xd:doc>

    <xsl:template name="IDAbstract">

        <xsl:variable name="ACSDescription">This web mapping service contains data from the American Community Survey (ACS), which is an ongoing survey that provides
            data every year in order to give communities the current information they need to plan investments and services. Information from the survey generates data
            that help determine how more than $400 billion in federal and state funds are distributed each year. This survey contains information about the age, sex,
            race, family and relationships, income and benefits, health insurance, education, veteran status, disabilities and the cost of living of the communities
            surveyed. </xsl:variable>

        <xsl:variable name="PhysicalFeaturesDescription">The Physical Features WMS contains information about the transportation, hydrography and other features of the
            physical landscape. These other features include national parks, correctional facilities, colleges and universities and military installations.</xsl:variable>

        <xsl:variable name="CurrentDescription"> The Census Current WMS contains information about the various types of geography Census uses to describe the country. A
            chart describing these geographies can be found at http://www.census.gov/geo/reference/pdfs/geodiagram.pdf. A more detailed description of each type of
            geographic entity can be found at http://www.census.gov/geo/reference/terms.html.</xsl:variable>

        <xsl:variable name="CensusDescription2010">This WMS contains information about the geography of the nation as it existed during the 2010 Census. A chart
            describing these geographies can be found at http://www.census.gov/geo/reference/pdfs/geodiagram.pdf. A more detailed description of each type of geographic
            entity can be found at http://www.census.gov/geo/reference/terms.html.</xsl:variable>
        
        <xsl:variable name="CensusDescription2000">This WMS contains information about the geography of the nation as it existed during the 2000 Census. A chart
            describing these geographies can be found at http://www.census.gov/geo/reference/pdfs/geodiagram.pdf. A more detailed description of each type of geographic
            entity can be found at http://www.census.gov/geo/reference/terms.html.</xsl:variable>
        
        <xsl:variable name="EconomicPlace">An economic census place is used to tabulate economic census data. The entities included as an economic place include incorporated places, census designated places (CDPs), minor civil divisions (MCDs), and balances of MCDs or counties. Each of these is discussed in more detail below.
            
            An incorporated place, CDP, MCD, or balance of MCD qualifies as an economic census place if it contains:
            
            2,500 or more people according to the 2010 Decennial Census (5,000 was used for the 2007 Economic Census), or
            2,500 or more jobs according to data from the 2006-2010 5-year ACS period estimates (5,000 was used for the 2007 Economic Census), or
            Is a new or significantly revised place since the 2010 Census and has an estimated population of 2,500 or greater.
        </xsl:variable>



        <xsl:element name="gmd:abstract">
            <xsl:variable name="mainPart"
                select="/default:WMS_Capabilities/default:Capability[1]/default:Layer[1]/default:Title[1]"/>
            <!--  <xsl:comment>mainPart:<xsl:value-of select="$mainPart"/>
                </xsl:comment> -->
            <xsl:variable name="WMSName">Census Current (2013) </xsl:variable>
            <xsl:variable name="vintage"> web mapping service contains data as of January 1,</xsl:variable>

            <xsl:choose>
                <xsl:when test="contains($mainPart,'Physical Features')">
                    <xsl:variable name="URL"
                        select="/default:WMS_Capabilities/default:Capability[1]/default:Request[1]/default:GetMap[1]/default:DCPType[1]/default:HTTP[1]/default:Get[1]/default:OnlineResource[1]/@*[namespace-uri()='http://www.w3.org/1999/xlink' and local-name()='href']"/>
                    <!-- <xsl:comment>Url:<xsl:value-of select="$URL"/></xsl:comment> -->
                    <xsl:choose>
                        <xsl:when test="contains($URL,'Census2010')">
                            <xsl:variable name="year">2010</xsl:variable>
                            <xsl:variable name="finalAbstract"
                                select="concat($PhysicalFeaturesDescription,' The ', $mainPart, $vintage, $year,'.')"/>
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="$finalAbstract"/>
                            </xsl:element>
                        </xsl:when>

                        <xsl:otherwise>
                            <!-- This variable to update -->
                            <xsl:variable name="yearPF">2016</xsl:variable>
                            <xsl:variable name="finalAbstract"
                                select="concat($PhysicalFeaturesDescription, ' The ', $mainPart, $vintage, $yearPF,'.')"/>
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="$finalAbstract"/>
                            </xsl:element>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="contains($mainPart,'ACS')">
                    <!--   <xsl:comment>In the ACS!!!!!!</xsl:comment> -->
                    <xsl:variable name="yeara" select="substring-after($mainPart,'ACS')"/>
                    <xsl:variable name="year" select="substring-before($yeara,' WMS')"/>
                    <xsl:variable name="finalAbstract"
                        select="concat($ACSDescription, 'The ', $mainPart, $vintage, $year,'.')"/>
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$finalAbstract"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="contains($mainPart,'Current')">
                    <!--  <xsl:comment>In the Current!!!!!!!</xsl:comment> -->
                    <xsl:variable name="yeara" select="substring-after($mainPart,'Current (')"/>
                    <xsl:variable name="year" select="substring-before($yeara,')')"/>
                   <!--  <xsl:comment>yeara;<xsl:value-of select="$yeara"/></xsl:comment> -->
                    <xsl:variable name="finalAbstract"
                        select="concat($CurrentDescription,' The ', $mainPart, $vintage, $year,'.')"/>
                    <xsl:element name="gco:CharacterString">
                        <xsl:value-of select="$finalAbstract"/>
                    </xsl:element>
                </xsl:when>
                <xsl:when test="contains($mainPart,'Census')">
                  <!--  <xsl:comment> IN the Census!!!!!!!!!!!!</xsl:comment> -->
                    <xsl:variable name="yeara" select="substring-after($mainPart,'Census')"/>
                    <xsl:variable name="year" select="substring-before($yeara,' WMS')"/>
                    <xsl:choose>
                        <xsl:when test="contains($year,'2010')">
                            <xsl:variable name="finalAbstract"
                                select="concat($CensusDescription2010,' The ', $mainPart, $vintage, $year,'.')"/>
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="$finalAbstract"/>
                            </xsl:element>
                        </xsl:when>
                        <xsl:when test="contains($year,'2000')">
                            <xsl:variable name="finalAbstract"
                                select="concat($CensusDescription2000,' The ', $mainPart, $vintage, $year,'.')"/>
                            <xsl:element name="gco:CharacterString">
                                <xsl:value-of select="$finalAbstract"/>
                            </xsl:element>
                        </xsl:when>
                    </xsl:choose>
                </xsl:when>
                <xsl:when test="contains($mainPart,'Economic')">
                <xsl:variable name="year">2012</xsl:variable>
                <xsl:variable name="finalAbstract"
                    select="concat($EconomicPlace,' The ', $mainPart, $vintage, $year,'.')"/>
                <xsl:element name="gco:CharacterString">
                    <xsl:value-of select="$finalAbstract"/>
                </xsl:element>
                </xsl:when>
            </xsl:choose>



        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
