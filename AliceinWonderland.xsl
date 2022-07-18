<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    
    xmlns:tei="https://www.tei-c.org/ns/1.0"
    
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
            </head>
            <body>
                
                <div class="container">
                    <div class="row">
                        <div class="col-sm">
                            <div id="openseadragon" style="width: 250px; height: 100px;"></div>
                            <script src="https://cdn.jsdelivr.net/npm/openseadragon@2.4/build/openseadragon/openseadragon.min.js"></script>
                            <script type="text/javascript">
                                var viewer = OpenSeadragon({
                                id: "openseadragon",
                                prefixUrl: "https://cdn.jsdelivr.net/npm/openseadragon@2.4/build/openseadragon/images/",
                                tileSources:   [{
                                "@context": "http://iiif.io/api/image/2/context.json",
                                "@id": "<xsl:value-of select="//tei:div1/tei:pb/@facs"/>",
                                "height": 6176,
                                "width": 4128,
                                "profile": [ "http://iiif.io/api/image/2/level2.json" ],
                                "protocol": "http://iiif.io/api/image",
                                "tiles": [{
                                "scaleFactors": [ 1, 2, 4, 8, 16, 32 ],
                                "width": 1000
                                }]
                                }]
                                });
                            </script>
                        </div>
                        <div class="col-sm" style="margin-left: 5em">
                            
                            <xsl:apply-templates select="//tei:text"/>
                            
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//tei:head">
        <h2>
            <ins><xsl:apply-templates/></ins>
        </h2>
    </xsl:template>
    
    <xsl:template match="//tei:p">
        <p><xsl:apply-templates/></p><br/>
    </xsl:template>
    
</xsl:stylesheet>
