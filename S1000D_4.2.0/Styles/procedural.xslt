<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="procedure">
      <Paragraph TextAlignment="Center" Padding="0,15,0,0">
		<xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}" FontSize="18">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_procedural_procedure','procedural.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" TextAlignment="Left">
            <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>	  
      </Paragraph>
  </xsl:template>
  <xsl:template match="mainProcedure">
      <Paragraph TextAlignment="Center" Padding="0,15,0,0">
		<xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}" FontSize="18">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_procedural_main_procedure','procedural.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" TextAlignment="Left">
            <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>	
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
</xsl:stylesheet>