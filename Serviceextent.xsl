<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmd="http://www.isotc211.org/2005/gmd"
xmlns:gmi="http://www.isotc211.org/2005/gmi" xmlns:gmx="http://www.isotc211.org/2005/gmx"
xmlns:gsr="http://www.isotc211.org/2005/gsr" xmlns:gss="http://www.isotc211.org/2005/gss"
xmlns:gts="http://www.isotc211.org/2005/gts" xmlns:gml="http://www.opengis.net/gml/3.2"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns:default="http://www.opengis.net/wms" xmlns:srv="http://www.isotc211.org/2005/srv"
xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf"
xmlns:fn="http://www.w3.org/2005/xpath-functions"
xmlns:grp="http://www.altova.com/Mapforce/grouping"
xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
exclude-result-prefixes="fn grp vmf xs xsi xsl xd" xmlns="http://www.isotc211.org/2005/gmi">



<xd:desc>
    <xd:p><xd:b>Created on:</xd:b> Oct 21, 2013</xd:p>
    <xd:p><xd:b>Author:</xd:b> Matthew McCready</xd:p>
    <xd:p>e</xd:p>
</xd:desc>



<xsl:output method="xml" version="1.0" encoding="ISO-8859-1" indent="yes"/>
    
    <xsl:template name="serviceExtent">
       <!--  <xsl:comment>In the ServiceExtent Layer</xsl:comment>
          <xsl:comment>Pre-choose!!!!!!!!!!!!!!!!!</xsl:comment>-->
        <xsl:choose>
            <xsl:when test="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer">
                          <!-- /default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:EX_GeographicBoundingBox[1]/default:westBoundLongitude[1] -->
        <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer">
            <xsl:variable name="defaultLayer" select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer"/>
            <xsl:variable name="layerName" select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer/default:Name"/>
            
            <!-- /WMS_Capabilities/Capability[1]/Layer[1]/Layer[7]/Name[1] -->
          <xsl:comment> Here is the value: <xsl:value-of select="$layerName"/> !!!!!!!!!!!</xsl:comment>
           <xsl:choose>
               <xsl:when test="contains(.,'Labels')"/>
                <xsl:when test="contains($layerName,'Labels')"/>
               <xsl:when test="contains($layerName,'Metropolitan Statistical Areas')"/>
               <xsl:when test="contains($layerName,'Micropolitan Statistical Areas')"> 
                   <xsl:element name="srv:extent">
                       <xsl:element name="gmd:EX_Extent">
                           <xsl:comment> Here is the value: <xsl:value-of select="."/> !!!!!!!!!!!</xsl:comment>
                           <xsl:element name="gmd:description">
                               <xsl:element name="gco:CharacterString"> Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA)other </xsl:element>
                           </xsl:element>
                           
                           <xsl:element name="gmd:geographicElement">
                               <xsl:element name="gmd:EX_GeographicBoundingBox">
                                   
                                   <xsl:element name="gmd:westBoundLongitude">
                                       <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:westBoundLongitude"/></xsl:element>
                                   </xsl:element>
                                   
                                   <xsl:element name="gmd:eastBoundLongitude">
                                       <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:eastBoundLongitude"/></xsl:element>
                                   </xsl:element>
                                   
                                   <xsl:element name="gmd:southBoundLatitude">
                                       <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:southBoundLatitude"/></xsl:element>
                                   </xsl:element>
                                   
                                   <xsl:element name="gmd:northBoundLatitude">
                                       <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:northBoundLatitude"/></xsl:element>
                                   </xsl:element>
                                   
                               </xsl:element>
                           </xsl:element>
                       </xsl:element>
                   </xsl:element>
              <!--  --> </xsl:when>
          
          <xsl:otherwise>
            <xsl:element name="srv:extent">
                <xsl:comment> Here is the value: <xsl:value-of select="$defaultLayer"/> !!!!!!!!!!!</xsl:comment>
                <xsl:element name="gmd:EX_Extent">
                    
                    <xsl:element name="gmd:description">
                        <xsl:element name="gco:CharacterString"> <xsl:value-of select="./default:Name"></xsl:value-of> </xsl:element>
                    </xsl:element>
                    
                    <xsl:element name="gmd:geographicElement">
                        <xsl:element name="gmd:EX_GeographicBoundingBox">
                            
                            <xsl:element name="gmd:westBoundLongitude">
                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:westBoundLongitude"/></xsl:element>
                            </xsl:element>
                            
                            <xsl:element name="gmd:eastBoundLongitude">
                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:eastBoundLongitude"/></xsl:element>
                            </xsl:element>
                            
                            <xsl:element name="gmd:southBoundLatitude">
                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:southBoundLatitude"/></xsl:element>
                            </xsl:element>
                            
                            <xsl:element name="gmd:northBoundLatitude">
                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:northBoundLatitude"/></xsl:element>
                            </xsl:element>
                            
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
            </xsl:otherwise>
             </xsl:choose>
            
            
            </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <!--   <xsl:comment>In the otherwise!!!!!!!!!!!!!!!!!!!!!!!!!!!!</xsl:comment>-->
                <xsl:variable name="layerName" select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer/default:Layer/default:Name"/>
                <xsl:for-each select="/default:WMS_Capabilities/default:Capability/default:Layer/default:Layer">
                    <xsl:choose>
                        <xsl:when test="contains(.,'Labels')"/>
                        
                        <xsl:when test="contains($layerName,'Labels')"/>
                        <xsl:when test="contains($layerName,'Metropolitan Statistical Areas')"/> 
                        <xsl:when test="contains($layerName,'Micropolitan Statistical Areas')">
                            <xsl:element name="srv:extent">
                                <xsl:element name="gmd:EX_Extent">
                                    <xsl:comment> Here is the value: <xsl:value-of select="."/> !!!!!!!!!!!</xsl:comment>
                                    <xsl:element name="gmd:description">
                                        <xsl:element name="gco:CharacterString"> Current Metropolitan Statistical Area/Micropolitan Statistical Area (CBSA)other </xsl:element>
                                    </xsl:element>
                                    
                                    <xsl:element name="gmd:geographicElement">
                                        <xsl:element name="gmd:EX_GeographicBoundingBox">
                                            
                                            <xsl:element name="gmd:westBoundLongitude">
                                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:westBoundLongitude"/></xsl:element>
                                            </xsl:element>
                                            
                                            <xsl:element name="gmd:eastBoundLongitude">
                                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:eastBoundLongitude"/></xsl:element>
                                            </xsl:element>
                                            
                                            <xsl:element name="gmd:southBoundLatitude">
                                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:southBoundLatitude"/></xsl:element>
                                            </xsl:element>
                                            
                                            <xsl:element name="gmd:northBoundLatitude">
                                                <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:northBoundLatitude"/></xsl:element>
                                            </xsl:element>
                                            
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:element>
                            </xsl:element>
                        </xsl:when>
                        <xsl:otherwise>
                <xsl:element name="srv:extent">
                    <xsl:element name="gmd:EX_Extent">
                        <!-- /WMS_Capabilities/Capability[1]/Layer[1]/Layer[2]/EX_GeographicBoundingBox[1]/westBoundLongitude[1] -->
                        <xsl:element name="gmd:description">
                            <xsl:element name="gco:CharacterString"> <xsl:value-of select="./default:Name"></xsl:value-of> </xsl:element>
                        </xsl:element>
                        
                        <xsl:element name="gmd:geographicElement">
                            <xsl:element name="gmd:EX_GeographicBoundingBox">
                                
                                <xsl:element name="gmd:westBoundLongitude">
                                    <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:westBoundLongitude"/></xsl:element>
                                </xsl:element>
                                
                                <xsl:element name="gmd:eastBoundLongitude">
                                    <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:eastBoundLongitude"/></xsl:element>
                                </xsl:element>
                                
                                <xsl:element name="gmd:southBoundLatitude">
                                    <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:southBoundLatitude"/></xsl:element>
                                </xsl:element>
                                
                                <xsl:element name="gmd:northBoundLatitude">
                                    <xsl:element name="gco:Decimal"><xsl:value-of select="./default:EX_GeographicBoundingBox/default:northBoundLatitude"/></xsl:element>
                                </xsl:element>
                                
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
                        </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
            
    </xsl:template>
    
</xsl:stylesheet>