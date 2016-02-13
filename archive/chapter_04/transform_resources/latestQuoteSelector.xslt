<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ns="http://services.samples"
                xmlns:ax21="http://services.samples/xsd"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                exclude-result-prefixes="ns ax21 xsi">
    <xsl:output method="xml" omit-xml-declaration="yes" indent="yes"/>

    <xsl:template match="/">
        <xsl:apply-templates select="//ns:getFullQuoteResponse/ns:return"/>
    </xsl:template>

    <xsl:template match="ns:return">
        <tradeHistory>
            <xsl:for-each select="ax21:tradeHistory">
                <xsl:choose>
                    <xsl:when test="ax21:day &gt; 354">
                        <tradeInfo>
                            <day><xsl:value-of select="ax21:day"/></day>
                            <quote>
                                <companyName><xsl:value-of select="ax21:quote/ax21:name"/></companyName>
                                <earnings><xsl:value-of select="ax21:quote/ax21:earnings"/></earnings>
                            </quote>
                        </tradeInfo>
                    </xsl:when>
                    <xsl:otherwise>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </tradeHistory>
    </xsl:template>
</xsl:stylesheet>

