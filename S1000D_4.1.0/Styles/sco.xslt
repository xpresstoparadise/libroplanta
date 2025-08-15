<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="scoContent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='scoEntryType')">
          <xsl:apply-templates select="@*[local-name()!='scoEntryType']"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_sco_scorm_content_data','sco.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='scoEntryType')">
          <xsl:apply-templates select="@*[local-name()='scoEntryType']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="@scoEntryType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text> — </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'scoEntryType',.)"></xsl:value-of>
        <xsl:text>]</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="trainingStep">
    <Section Margin="0,3,0,0">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" FontWeight="Bold" Foreground="{$autoTextColor}">
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" Template="pmEntryNumber" Context="Self"></Attribute>
          </Update>
          <Run FontWeight="Bold" Foreground="{$autoTextColor}">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_sco_training_step','sco.xslt')"></xsl:value-of>
            <xsl:text>: </xsl:text>
          </Run>
          <Run>
            <xsl:text>&#160;</xsl:text>
          </Run>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" FontSize="14" Foreground="{$textColor}" FontWeight="Normal" Margin="80,0,0,0">
        <xsl:apply-templates select="*"></xsl:apply-templates>
      </Section>
    </Section>
  </xsl:template>
  <xsl:template match="trainingStep//dmRefIdent|trainingStep//pmRefIdent|trainingStep//enternalPubRefIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="trainingStep//dmRefAddressItems|trainingStep//pmRefAddressItems|trainingStep//enternalPubRefAddressItems">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="trainingStep//dmRef|trainingStep//pmRef|trainingStep//externalPubRef">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="trainingStep//dmSegmentRef">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='targetPath')" FontWeight="Normal" Foreground="{$textColor}" FontSize="14">
        <xsl:apply-templates select="*[local-name()!='targetPath']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='targetPath')" FontWeight="Normal" Foreground="{$textColor}" FontSize="14">
        <xsl:apply-templates select="*[local-name()='targetPath']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@targetPath">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <Run FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_target_path','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="extraResources">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_sco_extra_resources','sco.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
</xsl:stylesheet>