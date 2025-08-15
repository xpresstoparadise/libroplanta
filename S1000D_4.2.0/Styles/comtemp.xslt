<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" exclude-result-prefixes="fn xs xef">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="offsetStart" select="-1"></xsl:param>
  <xsl:param name="offsetLength" select="0"></xsl:param>
  <xsl:variable name="rn">
    <xsl:text>&#160;</xsl:text>
  </xsl:variable>
  <xsl:template match="content">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Paragraph>
        <Update>
          <Structure Template="TOC" Context="TOC"></Structure>
        </Update>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
   <xsl:template match="content/refs">
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="beforeSetBlock"></xsl:call-template>
		<Paragraph TextAlignment="Center" FontSize="16" Margin="0,10,0,10">
            <Run FontWeight="Bold" FontStyle="Italic" Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_refs','comtemp.xslt')"></xsl:value-of>
            </Run>
		</Paragraph> 
		<Paragraph Id="ChildrenNodesContainer">
		  <xsl:apply-templates></xsl:apply-templates>
		</Paragraph>
		<xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="refs">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock" />
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock" />
    </Section>
  </xsl:template>
  <xsl:template match="commonInfo">
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" FontStyle="Italic" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_common_information','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Section>
  </xsl:template>
  <xsl:template match="referencedApplicGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColorDark}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_referenced_applic_group','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Section Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="referencedApplicGroupRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColorDark}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_referenced_applic_group_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Section Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="warningsAndCautions">
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColorDark}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_warnings_and_cautions','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Section Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="warningsAndCautionsRef">
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColorDark}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_warnings_and_cautions_refs','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Section Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="warning">
    <Section Margin="0,5,0,5" TextAlignment="Center" FontSize="20" BorderThickness="20" BorderBrush="WarningBrush">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}" FontWeight="Bold">
          <xsl:text>◈ </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}" TextDecoration="Underline" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_warning','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" TextAlignment="Left" FontSize="14" Padding="20,0,20,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="caution">
    <Section Margin="0,5,0,5" TextAlignment="Center" FontSize="20" BorderThickness="20" BorderBrush="CautionBrush">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:text>◈ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" TextDecoration="Underline" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_caution','comtemp.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" TextAlignment="Left" FontSize="14" Padding="20,0,20,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="warningRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_warning_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenAttributesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="@*" />
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="warningRef/@warningIdentNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Paragraph Foreground="Gray" Margin="17,0,0,0">
        <Run>
          <xsl:value-of select="xef:GetWarningTextFromRep(.)"></xsl:value-of>
        </Run>
      </Paragraph>
    </Span>
  </xsl:template>
  <xsl:template match="cautionRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_caution_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenAttributesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="@*" />
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="cautionRef/@cautionIdentNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Paragraph Foreground="Gray" Margin="17,0,0,0">
        <Run>
          <xsl:value-of select="xef:GetCautionTextFromRep(.)"></xsl:value-of>
        </Run>
      </Paragraph>
    </Span>
  </xsl:template>
  <xsl:template match="@warningRefs">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="warningsRef" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="@cautionRefs">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="cautionsRef" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="note">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_note','comtemp.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0" FontSize="14">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="footnote">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Foreground="{$autoTextColor}" FontWeight="Bold">
        <Run>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_footnote','comtemp.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Run>
          <Update>
            <Text XPath="count(preceding::footnote)+1" Context="Self"></Text>
          </Update>
        </Run>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0" FontSize="14">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="inlineSignificantData">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Background="#d2d2d2">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="indexFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$noteColor}" ToolTip="{concat('1: ',@indexLevelOne,'&#xA;','2: ',@indexLevelTwo,'&#xA;','3: ',@indexLevelThree,'&#xA;','4: ',@indexLevelFour)}">
        <Update>
          <Attribute Name="ToolTip" XPath="concat('1: ',@indexLevelOne,'&#xA;','2: ',@indexLevelTwo,'&#xA;','3: ',@indexLevelThree,'&#xA;','4: ',@indexLevelFour)" Context="Self"></Attribute>
        </Update>
        <xsl:text>✹</xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="verbatimText">
    <Span Foreground="DarkViolet">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="changeInline">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="quantity">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="quantityGroup">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='quantityUnitOfMeasure')" FontWeight="Bold">
        <xsl:apply-templates select="@*[local-name()!=quantityUnitOfMeasure]"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='quantityUnitOfMeasure')" FontWeight="Bold">
        <xsl:apply-templates select="@quantityUnitOfMeasure"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="quantityValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@quantityUnitOfMeasure"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="quantityTolerance">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='quantityToleranceType')" FontWeight="Bold">
        <xsl:apply-templates select="@quantityToleranceType"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='quantityUnitOfMeasure')" FontWeight="Bold">
        <xsl:apply-templates select="@quantityUnitOfMeasure"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@quantityUnitOfMeasure">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@quantityToleranceType">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColorDark}">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='plus'"> + </xsl:when>
        <xsl:when test=".='minus'"> − </xsl:when>
        <xsl:when test=".='plusorminus'"> ± </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="internalRef">
    <Hyperlink>
      <xsl:call-template name="idtemplateSimple" />
      <Update>
        <Attribute Name="Foreground" Template="internalRefColor" Context="IDRefs"></Attribute>
        <Attribute Name="IdRef" Template="idRef" Context="IDRefs"></Attribute>
      </Update>
      <xsl:call-template name="before"></xsl:call-template>
      <Span>
        <xsl:call-template name="changeMarksSimple" />
      </Span>
      <Span>
        <Update>
          <Structure Template="internalRef" Context="IDRefs"></Structure>
        </Update>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Hyperlink>
  </xsl:template>
  <xsl:template name="Hyperlink">
    <Hyperlink>
      <Update>
        <Attribute Name="Foreground" Template="internalRefColor" Context="IDRefs"></Attribute>
        <Attribute Name="IdRef" Template="idRef" Context="IDRefs"></Attribute>
      </Update>
      <Span>
        <Update>
          <Structure Template="internalRef" Context="IDRefs"></Structure>
        </Update>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Hyperlink>
  </xsl:template>
  <xsl:template match="footnoteRef">
    <Hyperlink Foreground="{$refColor}">
      <xsl:call-template name="idtemplateSimple" />
      <Update>
        <Attribute Name="Foreground" Template="internalRefColor" Context="IDRefs"></Attribute>
        <Attribute Name="IdRef" Template="idRef" Context="IDRefs"></Attribute>
      </Update>
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span>
        <xsl:call-template name="changeMarksSimple" />
      </Span>
      <Span>
        <Update>
          <Structure Template="internalFootnoteRef" Context="IDRefs"></Structure>
        </Update>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Hyperlink>
  </xsl:template>
  <xsl:template match="footnoteRemarks">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_footnote_remarks','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Section Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="remarks">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_remarks','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Section Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="levelledParaAlts|commonInfoDescrParaAlts|proceduralStepAlts|figureAlts|multimediaAlts">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="levelledPara|commonInfoDescrPara|proceduralStep">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <!-- <xsl:call-template name="beforeSetBlock"></xsl:call-template> -->
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$autoTextColor}">
        <Update>
          <Attribute Name="FontSize" XPath="if (count(ancestor::*[local-name()='levelledPara' or local-name()='commonInfoDescrPara' or local-name()='proceduralStep'])=0) then '16' else '14'" Context="Self"></Attribute>
          <Attribute Name="FontWeight" XPath="if (count(ancestor::*[local-name()='levelledPara' or local-name()='commonInfoDescrPara' or local-name()='proceduralStep'])&gt;1) then 'Normal' else 'Bold'" Context="Self"></Attribute>
        </Update>
        <ListItem MarkerWidth="80">
          <xsl:choose>
            <xsl:when test="self::levelledPara">
              <Update>
                <Attribute Name="MarkerValue" Template="levelledParaNumber" Context="Self"></Attribute>
              </Update>
            </xsl:when>
            <xsl:when test="self::commonInfoDescrPara">
              <Update>
                <Attribute Name="MarkerValue" Template="commonInfoDescrParaNumber" Context="Self"></Attribute>
              </Update>
            </xsl:when>
            <xsl:when test="self::proceduralStep">
              <Update>
                <Attribute Name="MarkerValue" Template="proceduralStepNumber" Context="Self"></Attribute>
              </Update>
            </xsl:when>
          </xsl:choose>
          <!-- <xsl:call-template name="beforeSetBlock"></xsl:call-template> -->
          <Section Id="ChildrenNodesContainer" Test="boolean(not(preceding-sibling::*))" FontWeight="Normal" Foreground="{$textColor}" FontSize="14">
            <xsl:apply-templates select="node()[not(preceding-sibling::*)]"></xsl:apply-templates>
          </Section>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" Test="boolean(preceding-sibling::*)" FontSize="14" Foreground="{$textColor}" FontWeight="Normal">
        <xsl:apply-templates select="node()[preceding-sibling::*]"></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
 <xsl:template match="@independentCheck">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_independent_check','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run FontWeight="Bold" Event="AttributeEditor" MouseCursor="Hand">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>

  <xsl:template match="@itemCharacteristic">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_item_characteristic','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run FontWeight="Bold" Event="AttributeEditor" MouseCursor="Hand">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'itemCharacteristic',.)"></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>	
	
  <xsl:template match="@crewMemberType">
    <Span Foreground="{$autoTextColor}" FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text> [</xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'crewMemberType',.)"></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>] </xsl:text>
      </Run>	
    </Span>
  </xsl:template>
	
		
  <xsl:template match="definitionListItem">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Normal" Foreground="{$textColor}" FontSize="14" Test="boolean(self::title)">
        <xsl:apply-templates select="title"></xsl:apply-templates>
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="110,0,0,0" MarkerWidth="110" Foreground="{$autoTextColor}" Id="ChildrenNodesContainer" Test="boolean(not(self::title))">
        <xsl:apply-templates select="listItemTerm|listItemDefinition"></xsl:apply-templates>
      </List>
      <xsl:call-template name="afterSetBlock" />
    </Span>
  </xsl:template>
  <xsl:template match="definitionListHeader">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:if test="self::termTitle">
        <xsl:attribute name="FontWeight">Bold</xsl:attribute>
      </xsl:if>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="170,0,0,0" MarkerWidth="170" Foreground="{$autoTextColor}" Id="ChildrenNodesContainer">
        <xsl:apply-templates select="termTitle|definitionTitle"></xsl:apply-templates>
      </List>
    </Span>
  </xsl:template>
  <xsl:template match="listItemTerm">
    <ListItem MarkerWidth="110" Margin="0,5,0,0">
      <xsl:attribute name="MarkerValue">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_term','comtemp.xslt')"></xsl:value-of>:</xsl:attribute>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Normal" Foreground="{$textColor}" FontSize="14">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </ListItem>
  </xsl:template>
  <xsl:template match="termTitle">
    <ListItem MarkerWidth="170" Margin="0,5,0,0" FontWeight="Bold">
      <xsl:attribute name="MarkerValue">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_term_title','comtemp.xslt')"></xsl:value-of>:</xsl:attribute>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold" Foreground="{$textColor}" FontSize="14">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </ListItem>
  </xsl:template>
  <xsl:template match="listItemDefinition">
    <ListItem MarkerWidth="110">
      <xsl:attribute name="MarkerValue">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_definition','comtemp.xslt')"></xsl:value-of>:</xsl:attribute>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Normal" Foreground="{$textColor}" FontSize="14">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </ListItem>
  </xsl:template>
  <xsl:template match="definitionTitle">
    <ListItem MarkerWidth="170" FontWeight="Bold">
      <xsl:attribute name="MarkerValue">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_definition_title','comtemp.xslt')"></xsl:value-of>:</xsl:attribute>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold" Foreground="{$textColor}" FontSize="14">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </ListItem>
  </xsl:template>
  <xsl:template match="levelledPara/title|commonInfoDescrPara/title|proceduralStep/title|definitionList/title|randomList/title|sequentialList/title">
    <Span FontWeight="Bold" Foreground="{$textColor}">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$textColor}" Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="randomList|attentionRandomList|reducedRandomList">
    <Span>
      <xsl:call-template name="idtemplate" />
      <List Id="ChildrenNodesContainer" BindingAndListType="ListUnordered" Margin="30,0,0,0" MarkerWidth="30" Foreground="{$autoTextColor}">
        <Update>
          <Attribute Name="MarkerValue" XPath="if(@listItemPrefix='pf01') then '' else        if(@listItemPrefix='pf02' or not(@listItemPrefix)) then if ((count(ancestor-or-self::*[local-name()='randomList' or local-name()='attentionRandomList']) mod 2) = 1) then '–' else '•' else        if(@listItemPrefix='pf03') then '–' else        if(@listItemPrefix='pf04') then '⊚' else        if(@listItemPrefix='pf05') then '○' else        if(@listItemPrefix='pf06') then '□' else        if(@listItemPrefix='pf07') then '•' else ''" Context="Self"></Attribute>
        </Update>
        <xsl:apply-templates></xsl:apply-templates>
      </List>
    </Span>
  </xsl:template>
  <xsl:template match="sequentialList|attentionSequentialList">
    <Span>
      <xsl:call-template name="idtemplate" />
      <List Id="ChildrenNodesContainer" BindingAndListType="ListOrdered" Margin="30,0,0,0" MarkerWidth="30">
        <xsl:apply-templates></xsl:apply-templates>
      </List>
    </Span>
  </xsl:template>
  <xsl:template match="listItem|attentionRandomListItem|attentionSequentialListItem|reducedRandomListItem">
    <ListItem MarkerWidth="30" StringFormat="{{0}}">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </ListItem>
  </xsl:template>
	<xsl:template match="figure">
		<Section>
			<xsl:call-template name="idtemplate" />
			<Paragraph Margin="0,10,0,5">
				<xsl:call-template name="before"></xsl:call-template>
				<Span Id="ChildrenAttributesContainer">
					<xsl:apply-templates select="@*" />
				</Span>
				<xsl:call-template name="first"></xsl:call-template>
				<Span Foreground="#2a579a" FontWeight="Bold">
					<Run>
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_figure','comtemp.xslt')"></xsl:value-of>
						<xsl:text>&#160;</xsl:text>
					</Run>
					<Run>
						<Update>
							<Text Template="figureNumber" Context="Self"></Text>
						</Update>
					</Run>
					<Run>
						<xsl:text>&#160;</xsl:text>
					</Run>
				</Span>
				<Span Id="ChildrenNodesContainer">
					<xsl:apply-templates></xsl:apply-templates>
				</Span>
				<xsl:call-template name="afterSetBlock"></xsl:call-template>
			</Paragraph>
		</Section>
	</xsl:template>
	<xsl:template match="multimedia">
		<Section>
			<xsl:call-template name="idtemplate" />
			<Paragraph Margin="0,10,0,5">
				<xsl:call-template name="before"></xsl:call-template>
				<Span Id="ChildrenAttributesContainer">
					<xsl:apply-templates select="@*" />
				</Span>
				<xsl:call-template name="first"></xsl:call-template>
				<Span Foreground="#2a579a" FontWeight="Bold">
					<Run>
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_multimedia','comtemp.xslt')"></xsl:value-of>
						<xsl:text>&#160;</xsl:text>
					</Run>
					<Run>
						<Update>
							<Text Template="multimediaNumber" Context="Self"></Text>
						</Update>
					</Run>
					<Run>
						<xsl:text>&#160;</xsl:text>
					</Run>
				</Span>
				<Span Id="ChildrenNodesContainer">
					<xsl:apply-templates></xsl:apply-templates>
				</Span>
				<xsl:call-template name="afterSetBlock"></xsl:call-template>
			</Paragraph>
		</Section>
	</xsl:template>
  <xsl:template match="graphic|multimediaObject">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Paragraph Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="hotspot|parameter">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="17,0,0,0" Foreground="{$autoTextColor}">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold">
          <xsl:text>● </xsl:text>
        </Run>
        <Run>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_hotspot','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*" />
        </Span>
        <Run IsEditable="True">
          <Update>
            <Cursor Name="NewTextHandler" Context="Self"></Cursor>
          </Update>
        </Run>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@applicationStructureIdent">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_aps_id','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run FontWeight="Bold" Event="AttributeEditor" MouseCursor="Hand">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@applicationStructureName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_aps_name','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run FontWeight="Bold" Event="AttributeEditor" MouseCursor="Hand">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@hotspotTitle">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text>[</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_title','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run FontWeight="Bold" Event="AttributeEditor" MouseCursor="Hand">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="graphic/@infoEntityIdent|multimediaObject/@infoEntityIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <BlockUIContainer IsEditable="False">
          <xsl:attribute name="infoEntityIdent">
            <xsl:value-of select="."></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="uri">
            <xsl:value-of select="xef:UnparsedEntityUri(.)"></xsl:value-of>
          </xsl:attribute>
        </BlockUIContainer>
      </Paragraph>
      <Paragraph TextAlignment="Center">
        <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="."></xsl:value-of>
        </Run>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="symbol">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
	<xsl:template match="symbol/@infoEntityIdent">
		<Span>
			<xsl:call-template name="idtemplate" />
			<InlineUIContainer IsEditable="False">
				<xsl:attribute name="infoEntityIdent">
					<xsl:value-of select="."></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="uri">
					<xsl:value-of select="xef:UnparsedEntityUri(.)"></xsl:value-of>
				</xsl:attribute>
				<Update>
					<Attribute Name="Width" XPath="string(parent::*/@reproductionWidth)" Context="Self"></Attribute>
					<Attribute Name="Height" XPath="string(parent::*/@reproductionHeight)" Context="Self"></Attribute>
					<Attribute Name="Scale" XPath="string(parent::*/@reproductionScale)" Context="Self"></Attribute>
				</Update>
			</InlineUIContainer>
		</Span>
	</xsl:template>
  <xsl:template match="table">
    <Section FontSize="14" Type="Table">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*" />
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="#2a579a" FontWeight="Bold">
          <Run>
            <Update>
              <Text Template="tablePrefixAndNumber" Context="Self"></Text>
            </Update>
          </Run>
        </Span>
        <Run>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Test="boolean(self::title)">
          <xsl:apply-templates select="title"></xsl:apply-templates>
        </Span>
        <Table BorderBrush="Black" Width="100">
          <Update>
            <Attribute Name="BorderThickness" XPath="if(@frame='all' or not(@frame)) then '1,1,1,1' else         if(@frame='topbot') then '0,1,0,1' else         if(@frame='none') then '0,0,0,0' else         if(@frame='sides') then '1,0,1,0' else         if(@frame='bottom') then '0,0,0,1' else         if(@frame='top') then '0,1,0,0' else '1,1,1,1'" Context="Self"></Attribute>
          </Update>
          <TableGroup>
            <Row>
              <Entry>
                <Section BorderBrush="None" Padding="0">
                  <Update>
                    <Attribute Name="BorderThickness" XPath="if(@frame='all' or not(@frame)) then '0,0,0,0' else                   if(@frame='topbot') then '1,0,0,0' else                   if(@frame='none') then '1,1,0,0' else                   if(@frame='sides') then '0,1,0,0' else                   if(@frame='bottom') then '1,1,0,0' else                   if(@frame='top') then '1,0,0,0' else '0,0,0,0'" Context="Self"></Attribute>
                  </Update>
                  <Span Id="ChildrenNodesContainer" Test="boolean(not(self::title))">
                    <xsl:apply-templates select="node()[not(self::title)]"></xsl:apply-templates>
                  </Span>
                </Section>
              </Entry>
            </Row>
          </TableGroup>
        </Table>
        <xsl:call-template name="last"></xsl:call-template>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
   <xsl:template match="caption">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
		<Span>
            <Update>
              <Attribute Name="InlineHeight" XPath="string(@captionHeight)" Context="Self" Target="Block"></Attribute>
			  <Attribute Name="InlineHeight" XPath="string(@captionHeight)" Context="Self"></Attribute>
			  <Attribute Name="InlineWidth" XPath="string(@captionWidth)" Context="Self"></Attribute>
			  <Attribute Name="InlineAlignment" XPath="string(@alignCaption)" Context="Self"></Attribute>
              <Attribute Name="Background" XPath="        if (@color='co00') then 'Transparent' else         if (@color='co01') then 'Green' else         if (@color='co02') then '#FF9900' else         if (@color='co03') then 'Yellow' else         if (@color='co04') then 'Red' else         if (@color='co07') then 'White' else         if (@color='co08') then '#818181' else         if (@color='co09') then 'Transparent' else         if (@color='co10') then 'Black' else 'Transparent'" Context="Self"></Attribute>
              <Attribute Name="Foreground" XPath="        if (@color='co00') then 'Black' else         if (@color='co01') then 'White' else         if (@color='co02') then 'Black' else         if (@color='co03') then 'Black' else         if (@color='co04') then 'White' else         if (@color='co07') then 'Black' else         if (@color='co08') then 'White' else         if (@color='co09') then 'Black' else         if (@color='co10') then 'White' else 'Black'" Context="Self"></Attribute>				
            </Update>			
            <Span Id="ChildrenNodesContainer">
                <xsl:apply-templates select="node()"></xsl:apply-templates>
            </Span>
        </Span>
    </Span>
  </xsl:template>		
		
	
  <xsl:template match="captionLine">
    <Span>
      <xsl:call-template name="idtemplate" />
          <Span Id="ChildrenAttributesContainer">
            <xsl:apply-templates select="@*" />
          </Span>
		<Span>
			<Run>
                <Update>
                    <Text XPath="if(preceding-sibling::captionLine) then ' ' else ''" Context="Self"></Text>
                </Update>		
			</Run>
		</Span>
          <Span Id="ChildrenNodesContainer">
            <xsl:apply-templates select="node()"></xsl:apply-templates>
          </Span>
    </Span>
  </xsl:template>
  <xsl:template match="tgroup">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Table Width="100" BorderCollapse="True" Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Table>
    </Span>
  </xsl:template>
  <xsl:template match="captionGroup">
    <Span Type="Table">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Table Width="100" BorderCollapse="True" Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Table>
    </Span>
  </xsl:template>
  <xsl:template match="colspec">
    <Column>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Column Name="colwidth"></Column>
      </Update>
    </Column>
  </xsl:template>
 <xsl:template match="thead">
    <TableGroup Id="ElementECContainer" xId="{concat('ElemEC_',generate-id(.))}" FontWeight="Bold" Background="LightBlue">
      <xsl:call-template name="idtemplate" />
      <xsl:apply-templates></xsl:apply-templates>
    </TableGroup>
  </xsl:template>
  <xsl:template match="tfoot">
    <TableGroup Id="ElementECContainer" xId="{concat('ElemEC_',generate-id(.))}" FontWeight="Bold" Background="LightYellow">
      <xsl:call-template name="idtemplate" />
      <xsl:apply-templates></xsl:apply-templates>
    </TableGroup>
  </xsl:template>
  <xsl:template match="tbody|captionBody">
    <TableGroup Id="ElementECContainer" xId="{concat('ElemEC_',generate-id(.))}">
      <xsl:call-template name="idtemplate" />
      <xsl:apply-templates></xsl:apply-templates>
    </TableGroup>
  </xsl:template>
  <xsl:template match="row|captionRow">
    <Row Id="ElementECContainer" xId="{concat('ElemEC_',generate-id(.))}">
      <xsl:call-template name="idtemplate" />
      <xsl:apply-templates></xsl:apply-templates>
    </Row>
  </xsl:template>
  <xsl:template match="entry|captionEntry">
    <Entry Padding="3" BorderThickness="0,0,1,1">
      <xsl:call-template name="idtemplate" />
      <Update>
        <Attribute Name="RowSpan" XPath="GetRowSpan(xs:integer(@morerows))" Context="Self"></Attribute>
        <Attribute Name="ColSpan" XPath="GetColSpan(.)" Context="Self"></Attribute>
        <Attribute Name="BorderBrush" XPath="getSeps(.)" Context="Self"></Attribute>
        <Attribute Name="TextAlignment" XPath="getHAlign(.)" Context="Self"></Attribute>
        <Attribute Name="VerticalAlignment" XPath="getVAlign(.)" Context="Self"></Attribute>
      </Update>
      <Paragraph>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*" />
        </Span>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
      </Paragraph>
    </Entry>
  </xsl:template>
  <xsl:template match="acronym">
    <Span VerticalAlignment="Bottom">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="acronymTerm">
    <Span VerticalAlignment="Bottom">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" Foreground="Green">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="acronymDefinition">
    <Span VerticalAlignment="Bottom">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> (</xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">)</Run>
    </Span>
  </xsl:template>
  <xsl:template match="emphasis">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="superScript">
    <Span FontSize="10">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="subScript">
    <Span FontSize="10">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
	
  <xsl:template match="functionalItemRef|circuitBreakerRef|controlIndicatorRef|partRef|accessPointRef|zoneRef|supplyRqmtRef|materialSetRef">
	  <xsl:choose>
	      <xsl:when test="xef:GetXmlSchemaContentType2(parent::*)=3 and not(parent::workLocation) and not(parent::zoneGroup)">
                <Span Foreground="{$autoTextColor}">
                  <xsl:call-template name="idtemplate" />
                  <xsl:call-template name="before"></xsl:call-template>
                  <Span Id="ChildrenAttributesContainer">
                    <xsl:apply-templates select="@*"></xsl:apply-templates>
                  </Span>
                  <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
                    <Update>
                      <Text XPath="if (./*) then ' (' else ''" Context="Self"></Text>
                    </Update>
                  </Run>
                  <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
                    <xsl:apply-templates></xsl:apply-templates>
                  </Span>
                  <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
                    <Update>
                      <Text XPath="if (./*) then ')' else ''" Context="Self"></Text>
                    </Update>
                  </Run>
                  <xsl:call-template name="afterSetInline"></xsl:call-template>
                </Span>
	      </xsl:when>
		  <xsl:otherwise>
            <Paragraph Foreground="{$autoTextColor}">
              <xsl:call-template name="idtemplate" />
              <xsl:call-template name="beforeSetBlock"></xsl:call-template>
              <Run Foreground="{$autoTextColor}">
				  <xsl:choose>
					    <xsl:when test="self::functionalItemRef">
                            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_item_ref','comtemp.xslt')"></xsl:value-of>					  
					    </xsl:when>
                        <xsl:when test="self::circuitBreakerRef">
                            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_ref','cir.xslt')"></xsl:value-of>					  
					    </xsl:when>
                        <xsl:when test="self::controlIndicatorRef">
					        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_control_indicator_ref','comtemp.xslt')"></xsl:value-of>					  
				        </xsl:when>
                        <xsl:when test="self::partRef">
				            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_part_ref','comtemp.xslt')"></xsl:value-of>					  
				        </xsl:when>
					    <xsl:when test="self::accessPointRef">
				            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_access_point_ref','comtemp.xslt')"></xsl:value-of>
				        </xsl:when>
					    <xsl:when test="self::zoneRef">
				            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_zone_ref','comtemp.xslt')"></xsl:value-of>
				        </xsl:when>		
					    <xsl:when test="self::supplyRqmtRef">
				            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_supply_rqmt_ref','comtemp.xslt')"></xsl:value-of>
				        </xsl:when>	 
						<xsl:when test="self::materialSetRef">
				            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_material_set_reference','comtemp.xslt')"></xsl:value-of>  
			            </xsl:when>
				  </xsl:choose>
                  <xsl:text>: </xsl:text>
              </Run>
              <Span Id="ChildrenAttributesContainer">
                  <xsl:apply-templates select="@*"></xsl:apply-templates>
              </Span>
              <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
                <xsl:apply-templates></xsl:apply-templates>
              </Span>
              <xsl:call-template name="afterSetBlock"></xsl:call-template>
            </Paragraph>
		  </xsl:otherwise>
	  </xsl:choose>
    
  </xsl:template>

  <xsl:template match="@functionalItemNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@controlIndicatorNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@circuitBreakerNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@partNumberValue">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="identAndStatusSection//skillLevel|updateIdentAndStatusSection//skillLevel">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_skill_level','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@skillLevelCode">
	<Span Foreground="{$autoTextColor}">
		<xsl:call-template name="idtemplate" />
		<Run> [</Run>
        <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
          <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'skillLevelCode',.)"></xsl:value-of>
        </Run>
	   <Run>] </Run>
	</Span>
  </xsl:template>
  <xsl:template match="functionalItemRef/refs">
    <Span Visibility="Collapsed">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="text()[ancestor::emphasis or ancestor::superScript or ancestor::subScript]">
    <Run cursor="NotAllowed" IsEditable="True" TextAllowed="1">
      <xsl:call-template name="idtemplate" />
      <Update>
        <Attribute Name="VerticalAlignment" XPath="if (ancestor::superScript) then 'Super' else if (ancestor::subScript) then 'Sub' else 'Baseline'" Context="Self"></Attribute>
        <Attribute Name="FontWeight" XPath="if (ancestor::emphasis[@emphasisType='em01' or not(@emphasisType)]) then 'Bold' else 'Normal'" Context="Self"></Attribute>
        <Attribute Name="FontStyle" XPath="if (ancestor::emphasis[@emphasisType='em02']) then 'Italic' else 'Normal'" Context="Self"></Attribute>
        <Attribute Name="TextDecoration" XPath="      concat(if (ancestor::emphasis[@emphasisType='em03']) then 'Underline' else '',',',if (ancestor::emphasis[@emphasisType='em04']) then 'Overline' else '',',',if (ancestor::emphasis[@emphasisType='em05']) then 'Strikethrough' else '')" Context="Self"></Attribute>
      </Update>
      <xsl:call-template name="partOfText"></xsl:call-template>
    </Run>
  </xsl:template>
  <xsl:template match="text()">
    <Run cursor="NotAllowed" IsEditable="True" TextAllowed="1">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="partOfText"></xsl:call-template>
    </Run>
  </xsl:template>
  <xsl:template name="partOfText">
    <xsl:choose>
      <xsl:when test="$offsetStart=-1">
        <xsl:value-of select="." />
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="substring(., $offsetStart, $offsetLength)" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="@reasonForUpdateRefIds[not(parent::changeInline)]">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="reasonForUpdateRefIds" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="@applicRefId">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="applicRefId" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="@derivativeClassificationRefId[parent::*[local-name()!='security']]">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="derivativeClassificationRefId" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="@securityClassification[parent::*[local-name()!='security']]">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="securityClassification" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="@commercialClassification[parent::*[local-name()!='security']]">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="commercialClassification" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="@caveat[parent::*[local-name()!='security']]">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="caveat" Context="IDRefs"></Structure>
      </Update>
    </Section>
  </xsl:template>
  <xsl:template match="legend">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColorDark}" FontWeight="Bold" FontStyle="Italic">
          <Run>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_legend_to_fig','comtemp.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </Run>
          <Run>
            <Update>
              <Text XPath="concat(' ',count(preceding::figure))" Context="Self"></Text>
            </Update>
          </Run>
        </Span>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <!--proced-->
  <xsl:template match="preliminaryRqmts">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_preliminary_requirements','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="productionMaintData">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_production_management_data','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="thresholdInterval">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_threshold_interval','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='thresholdUnitOfMeasure')">
          <xsl:apply-templates select="@*[local-name()!='thresholdUnitOfMeasure']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='thresholdUnitOfMeasure')">
          <xsl:apply-templates select="@thresholdUnitOfMeasure"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@thresholdUnitOfMeasure">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'thresholdUnitOfMeasure',.)"></xsl:value-of>
    </Run>
  </xsl:template>
	
  <xsl:template match="workAreaLocationGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_work_area_location','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
	
  <xsl:template match="workLocation">
    <Section>
      <xsl:call-template name="idtemplate" />
			<Span Foreground="{$autoTextColor}">
				<Run>
		            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_work_location','comtemp.xslt')"></xsl:value-of>
		            <xsl:text>: </xsl:text>
				</Run>
			</Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Test="boolean(self::text())">
          <xsl:apply-templates select="text()"></xsl:apply-templates>
        </Span>
		<Paragraph Id="ChildrenNodesContainer" Test="boolean(not(self::text()))" Margin="17,0,0,0">
			<xsl:apply-templates select="node()[not(self::text())]"></xsl:apply-templates>
		</Paragraph>
		<xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
	
  <xsl:template match="workArea">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
			<Run Foreground="{$autoTextColor}">
		        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_work_area','comtemp.xslt')"></xsl:value-of>
		        <xsl:text>: </xsl:text>
			</Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>

	<xsl:template match="installationLocation">
		<Paragraph>
			<xsl:call-template name="idtemplate" />
			<xsl:call-template name="beforeSetInline"></xsl:call-template>
			<Run Foreground="{$autoTextColor}">
				<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_installation_location','comtemp.xslt')"></xsl:value-of>
				<xsl:text>: </xsl:text>
			</Run>
			<Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='unitOfMeasure')">
				<xsl:apply-templates select="@*[local-name()!='unitOfMeasure']"></xsl:apply-templates>
			</Span>
			<xsl:call-template name="first"></xsl:call-template>
			<Span Id="ChildrenNodesContainer">
				<xsl:apply-templates></xsl:apply-templates>
			</Span>
			<Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='unitOfMeasure')">
				<xsl:apply-templates select="@unitOfMeasure"></xsl:apply-templates>
			</Span>
			<xsl:call-template name="afterSetInline"></xsl:call-template>
		</Paragraph>
	</xsl:template>
	
  <xsl:template match="productItem">
    <Paragraph>
		<xsl:call-template name="idtemplate" />
        <xsl:call-template name="beforeSetInline"></xsl:call-template>
		<Run Foreground="{$autoTextColor}">
			<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_product_item','comtemp.xslt')"></xsl:value-of>
			<xsl:text>: </xsl:text>
		</Run>
		<Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
	
  <xsl:template match="@productItemName">
    <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>	

  <xsl:template match="@productItemType">
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
		<xsl:call-template name="idtemplate" />
		<xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'productItemType',.)"></xsl:value-of>
	    <xsl:text>] </xsl:text>
      </Run>
  </xsl:template>	
	
			
  <xsl:template match="taskDuration">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="     boolean(local-name()!='unitOfMeasure' and      local-name()!='startupDuration' and      local-name()!='procedureDuration' and      local-name()!='closeupDuration')">
          <xsl:apply-templates select="@*[local-name()!='unitOfMeasure' and      local-name()!='startupDuration' and      local-name()!='procedureDuration' and      local-name()!='closeupDuration']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_maintenance_task_duration','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='startupDuration')">
            <xsl:apply-templates select="@startupDuration"></xsl:apply-templates>
          </Span>
          <Span>
            <Run>
              <xsl:text> - </xsl:text>
            </Run>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='procedureDuration')">
            <xsl:apply-templates select="@procedureDuration"></xsl:apply-templates>
          </Span>
          <Span>
            <Run>
              <xsl:text> - </xsl:text>
            </Run>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='closeupDuration')">
            <xsl:apply-templates select="@closeupDuration"></xsl:apply-templates>
          </Span>
          <Span>
            <Run>
              <xsl:text>&#160;</xsl:text>
            </Run>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='unitOfMeasure')">
            <xsl:apply-templates select="@unitOfMeasure"></xsl:apply-templates>
          </Span>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="  @startupDuration|  @procedureDuration|  @closeupDuration">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@startupDuration|@procedureDuration|@closeupDuration">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="reqTechInfoGroup">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_required_technical_info','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reqTechInfo">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@reqTechInfoCategory">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'reqTechInfoCategory',.)"></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="closeRqmts">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_requirements_after_job_completion','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="reqCondGroup">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_required_conditions','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reqCondNoRef|reqCondDm|reqCondPm|reqCondExternalPub|reqCondCircuitBreaker">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_condition','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
	
  <xsl:template match="circuitBreakerDescr|circuitBreakerDescrGroup|circuitBreakerDescrSubGroup">
      <Paragraph Margin="17,0,0,0">
		<xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
		  <Span Foreground="{$autoTextColor}">
			  <Run>
		          <xsl:choose>
		            <xsl:when test="self::circuitBreakerDescr">
			          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_circuit_breaker_descr','comtemp.xslt')"></xsl:value-of>
			        </xsl:when>
                    <xsl:when test="self::circuitBreakerDescrGroup">
			          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_circuit_breaker_group','comtemp.xslt')"></xsl:value-of>
		            </xsl:when>
                    <xsl:when test="self::circuitBreakerDescrSubGroup">
		              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_circuit_breaker_subgroup','comtemp.xslt')"></xsl:value-of>
			        </xsl:when>
		          </xsl:choose>
			</Run>
	        <Run><xsl:text>: </xsl:text></Run>  
		</Span>
		  <Span Id="ChildrenAttributesContainer">
			  <xsl:apply-templates select="@*"></xsl:apply-templates>
		  </Span>
		  <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>	

    <xsl:template match="@circuitBreakerAction">
		<Span Foreground="{$autoTextColor}">
			<xsl:call-template name="idtemplate" />
			<Run>
				<xsl:text> / </xsl:text>
			</Run>
			<Run Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
				<xsl:choose>
					<xsl:when test=".='open'">
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_open','cir.xslt')" />
					</xsl:when>
					<xsl:when test=".='close'">
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_close','cir.xslt')" />
					</xsl:when>
					<xsl:when test=".='verif-open'">
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_verify_open','cir.xslt')" />
					</xsl:when>
					<xsl:when test=".='verif-close'">
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_verify_closed','cir.xslt')" />
					</xsl:when>
					<xsl:when test=".='open-order'">
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_open_order','cir.xslt')" />
					</xsl:when>
					<xsl:when test=".='close-order'">
						<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_close_order','cir.xslt')" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="."/>
					</xsl:otherwise>
				</xsl:choose>
		    </Run>
		</Span>
	</xsl:template>


	<xsl:template match="@checkSum">
		<Span Foreground="{$autoTextColor}">
			<xsl:call-template name="idtemplate" />
			<Run>
				<xsl:text> / </xsl:text>
				<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_check_sum','comtemp.xslt')" />
				<xsl:text>: </xsl:text>
			</Run>			
			<Run Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
				<xsl:value-of select="."/>
			</Run>
		</Span>
	</xsl:template>	
	
	
  <xsl:template match="noConds|noSupportEquips|noSupplies|noSpares|noSafety">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_none','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reqPersons">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_required_persons','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="person">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='man')">
          <xsl:apply-templates select="@*[local-name()!='man']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_person','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='man')">
          <xsl:apply-templates select="@man"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="personnel">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='numRequired')">
          <xsl:apply-templates select="@*[local-name()!='numRequired']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_personnel','comtemp.xslt')"></xsl:value-of>
          <xsl:text> - </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">(<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_quantity','comtemp.xslt')"></xsl:value-of><xsl:text>: </xsl:text></Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='numRequired')">
          <xsl:apply-templates select="@numRequired"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">)</Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@man|@numRequired">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@personCategoryCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="personCategory">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_category','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="personSkill">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_skill_level','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="trade">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_trade','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="estimatedTime">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_estimated_time','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='unitOfMeasure')">
          <xsl:apply-templates select="@*[local-name()!='unitOfMeasure']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='unitOfMeasure')">
          <xsl:apply-templates select="@unitOfMeasure"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@unitOfMeasure">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text>&#160;</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="reqSupportEquips">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_support_equipment','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reqSupplies">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_consumables_materials_and_expendables','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reqSpares">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_spares','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reqSafety">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_safety_conditions','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="supportEquipDescrGroup|supplyDescrGroup|spareDescrGroup">
    <xsl:call-template name="block"></xsl:call-template>
  </xsl:template>
  <xsl:template match="supportEquipDescr">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_support_equipment_descr','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>

  <xsl:template match="embeddedSupportEquipDescr">
      <Paragraph>
		<xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_embedded_support_equipment_descr','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>		
		
  <xsl:template match="supplyDescr">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_supply_descr','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="spareDescr">
      <Paragraph>
		<xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_spare_descr','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
	
  <xsl:template match="embeddedSpareDescr">
      <Paragraph>
		<xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_embedded_spare_descr','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>		
			
  <xsl:template match="name">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> ◉ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_name','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
		<Run><xsl:text> </xsl:text></Run>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template match="shortName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> ◉ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_short_name','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
		<Run><xsl:text> </xsl:text></Run>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template match="catalogSeqNumberRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="     boolean(     local-name()!='modelIdentCode' and     local-name()!='systemDiffCode' and     local-name()!='systemCode' and      local-name()!='subSystemCode' and      local-name()!='subSubSystemCode' and      local-name()!='assyCode' and      local-name()!='figureNumber' and      local-name()!='figureNumberVariant' and      local-name()!='itemLocationCode' and      local-name()!='item' and      local-name()!='itemVariant' and     local-name()!='itemSeqNumberValue' and      local-name()!='initialProvisioningProjectNumber' and      local-name()!='responsiblePartnerCompanyCode'        )">
          <xsl:apply-templates select="@*[     local-name()!='modelIdentCode' and      local-name()!='systemDiffCode' and      local-name()!='systemCode' and      local-name()!='subSystemCode' and      local-name()!='subSubSystemCode' and      local-name()!='assyCode' and      local-name()!='figureNumber' and      local-name()!='figureNumberVariant' and      local-name()!='itemLocationCode' and      local-name()!='item' and      local-name()!='itemVariant' and      local-name()!='itemSeqNumberValue' and      local-name()!='initialProvisioningProjectNumber' and      local-name()!='responsiblePartnerCompanyCode'            ]"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_csn_ref','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Foreground="{$refColor}" FontWeight="Bold">
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='modelIdentCode')">
            <xsl:apply-templates select="@modelIdentCode"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='systemDiffCode')">
            <xsl:apply-templates select="@systemDiffCode"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='systemCode')">
            <xsl:apply-templates select="@systemCode"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='subSystemCode')">
            <xsl:apply-templates select="@subSystemCode"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='subSubSystemCode')">
            <xsl:apply-templates select="@subSubSystemCode"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='assyCode')">
            <xsl:apply-templates select="@assyCode"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='figureNumber')">
            <xsl:apply-templates select="@figureNumber"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='figureNumberVariant')">
            <xsl:apply-templates select="@figureNumberVariant"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='itemLocationCode')">
            <xsl:apply-templates select="@itemLocationCode"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='item')">
            <xsl:apply-templates select="@item"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='itemVariant')">
            <xsl:apply-templates select="@itemVariant"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='itemSeqNumberValue')">
            <xsl:apply-templates select="@itemSeqNumberValue"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='initialProvisioningProjectNumber')">
            <xsl:apply-templates select="@initialProvisioningProjectNumber"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='responsiblePartnerCompanyCode')">
            <xsl:apply-templates select="@responsiblePartnerCompanyCode"></xsl:apply-templates>
          </Span>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="  @figureNumber|  @figureNumberVariant|  @item|  @itemVariant|  @responsiblePartnerCompanyCode|  @initialProvisioningProjectNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="natoStockNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_nsn','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="fullNatoStockNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="description//identNumber">
    <Span>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
		<Run Foreground="{$autoTextColor}">(</Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
	    <Run Foreground="{$autoTextColor}">)</Run>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>	
  <xsl:template match="identNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_ident_number','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="description//identNumber/manufacturerCode">
    <Span>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">[</Run>
		<xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
		<Run Foreground="{$autoTextColor}">]</Run>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>	
  <xsl:template match="manufacturerCode">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_manufactorer_code_value','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="description//identNumber/partAndSerialNumber">
    <Span>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
		<xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>		
  <xsl:template match="partAndSerialNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_part_and_serial_number','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="description//identNumber/partAndSerialNumber/partNumber">
    <Span>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">[</Run>
		<xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
		<Run Foreground="{$autoTextColor}">]</Run>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>	
  <xsl:template match="partNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_part_number','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="description//identNumber/partAndSerialNumber/serialNumber">
    <Span>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
		<xsl:call-template name="first"></xsl:call-template>
		<Run Foreground="{$autoTextColor}">[</Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">]</Run>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>	
  <xsl:template match="serialNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='serialNumberValue' and local-name()!='serialNumberForm')">
          <xsl:apply-templates select="@*[local-name()!='serialNumberValue' and local-name()!='serialNumberForm']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_identnumber_serialnumber','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <Span Foreground="{$autoTextColor}" FontWeight="Bold" Id="ChildrenAttributesContainer" Test="boolean(local-name()='serialNumberForm')">
          <xsl:apply-templates select="@serialNumberForm"></xsl:apply-templates>
        </Span>
        <Span>
          <Run>
            <xsl:text> - </xsl:text>
          </Run>
        </Span>
        <Span Foreground="{$autoTextColor}" FontWeight="Bold" Id="ChildrenAttributesContainer" Test="boolean(local-name()='serialNumberValue')">
          <xsl:apply-templates select="@serialNumberValue"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>

  <xsl:template match="@serialNumberValue">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="description//identNumber/partAndSerialNumber/serialNumber/@serialNumberForm">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
		<xsl:text>◉</xsl:text>
	  </Run>
  </xsl:template>		  
  <xsl:template match="@serialNumberForm">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='single'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_single','comtemp.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='range'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_range','comtemp.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="toolRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_tool_ref','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@toolNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
	
  <xsl:template match="@zoneNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>

  <xsl:template match="@supplyRqmtNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>

	
  <xsl:template match="@accessPointNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
	

  <xsl:template match="@materialSetIdent">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  
  <xsl:template match="@materialSetIssue">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
	  <xsl:text> [</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
	  <xsl:text>] </xsl:text>
    </Run>
  </xsl:template>
	  
  <xsl:template match="reqQuantity">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_quantity','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='functionalItemNumber')">
          <xsl:apply-templates select="@*[local-name()!='unitOfMeasure']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='unitOfMeasure')">
          <xsl:apply-templates select="@unitOfMeasure"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="preliminaryRqmts//dmRef[not(ancestor::warning) and not(ancestor::caution)]|preliminaryRqmts//pmRef[not(ancestor::warning) and not(ancestor::caution)]|preliminaryRqmts//externalPubRef[not(ancestor::warning) and not(ancestor::caution)]">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="17,0,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_reference','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@manufacturerCodeValue">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text> [</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text>] </xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="limit">
    <Section Margin="0,3,0,3">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='limitTypeValue' and local-name()!='limitCond')">
          <xsl:apply-templates select="@*[local-name()!='limitTypeValue' and local-name()!='limitCond']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_inspection_definition','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Paragraph Id="ChildrenAttributesContainer" Test="boolean(local-name()='limitTypeValue' or local-name()='limitCond')">
          <xsl:apply-templates select="@*[local-name()='limitTypeValue' or local-name()='limitCond']"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@limitTypeValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">[<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_limit_type','comtemp.xslt')"></xsl:value-of><xsl:text>: </xsl:text></Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='po'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_perform_once','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='oc'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_on_condition','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='pe'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_perform_periodically','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@limitCond">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">[<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_limit_cond','comtemp.xslt')"></xsl:value-of><xsl:text>: </xsl:text></Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="sampling">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sampling','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@samplingValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sampling_value','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@samplingUnit">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sampling_unit','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@samplingRatio">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sampling_ratio','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="inspectionType">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_inspection_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Paragraph Id="ChildrenAttributesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@inspectionTypeCategory">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_inspection_type_category','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="trigger">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='releaseEvent' and local-name()!='occurrenceTrigger')">
          <xsl:apply-templates select="@*[local-name()!='releaseEvent' and local-name()!='occurrenceTrigger']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_trigger','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='releaseEvent' or local-name()='occurrenceTrigger')">
          <xsl:apply-templates select="@*[local-name()='releaseEvent' or local-name()='occurrenceTrigger']"></xsl:apply-templates>
        </Span>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@occurrenceTrigger">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_occurrence_trigger','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@releaseEvent">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_trigger_event','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='before'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_before','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='with'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_with','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='after'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_after','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="limitRange">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_limit_range','comtemp.xslt')"></xsl:value-of>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="limitRangeFrom">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_limit_range_from','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="limitRangeTo">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_limit_range_to','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="timeLimit">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_time_limit','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="limitType">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='limitUnitType')">
        <xsl:apply-templates select="@*[local-name()!='limitUnitType']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_limit_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>:	</xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='limitUnitType')">
        <xsl:apply-templates select="@*[local-name()='limitUnitType']"></xsl:apply-templates>
      </Span>
      <Run>
        <xsl:text> / </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@limitUnitType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>
        <xsl:text>[</xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'limitUnitType',.)"></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>]</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="threshold">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='!thresholdUnitOfMeasure')">
        <xsl:apply-templates select="@*[local-name()='!thresholdUnitOfMeasure']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='thresholdValue')">
        <xsl:apply-templates select="thresholdValue"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='thresholdUnitOfMeasure')">
        <xsl:apply-templates select="@*[local-name()='thresholdUnitOfMeasure']"></xsl:apply-templates>
      </Span>
      <Span>
        <Run>
          <xsl:text>&#160;</xsl:text>
        </Run>
      </Span>
      <Span Id="ChildrenNodesContainer" Test="boolean(local-name()!='thresholdValue')">
        <xsl:apply-templates select="*[local-name()!='thresholdValue']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@thresholdType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='threshold'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_threshold','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='interval'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_interval','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
      <Run>
        <xsl:text>: </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="tolerance">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:text> / </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='toleranceType')">
        <xsl:apply-templates select="@toleranceType"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='toleranceValue')">
        <xsl:apply-templates select="@toleranceValue"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='thresholdUnitOfMeasure')">
        <xsl:apply-templates select="@thresholdUnitOfMeasure"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@toleranceType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='plus'"> -</xsl:when>
          <xsl:when test=".='minus'"> +</xsl:when>
          <xsl:when test=".='plusorminus'"> ±</xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@toleranceValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
</xsl:stylesheet>