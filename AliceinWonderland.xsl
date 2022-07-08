<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    
    xmlns:tei="https://www.tei-c.org/ns/1.0"
    
    exclude-result-prefixes="xs"
    version="2.0">
    
    <xsl:template match="tei:TEI">
        <html>
            <head>
                <meta charset="UTF-8"/>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="//tei:head">
        <h2>
            <ins><xsl:apply-templates/></ins>
        </h2>
    </xsl:template>
    
    <xsl:template match="//tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="//tei:pb">
        <xsl:choose>
            <xsl:when test="@pb='facs'">
                <span style="center; position: absolute;">
                    <xsl:apply-templates/></span>
            </xsl:when>
            <xsl:otherwise>
                <s><xsl:apply-templates/></s>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>
