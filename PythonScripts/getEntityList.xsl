<?xml version='1.0'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="text"/>

<xsl:template match="/">
	<xsl:apply-templates select="//@infoEntityIdent"/>
</xsl:template>

<xsl:template match="@infoEntityIdent">
    <xsl:value-of select="unparsed-entity-uri(.)"/>
    <xsl:text>&#10;</xsl:text>
</xsl:template>

</xsl:stylesheet>