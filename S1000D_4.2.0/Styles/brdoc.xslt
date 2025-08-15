<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="brDoc">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_document','brdoc.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="brLevelledPara">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$autoTextColor}">
        <Update>
          <Attribute Name="FontSize" XPath="if (count(ancestor::brLevelledPara)=0) then '16' else '14'" Context="Self"></Attribute>
          <Attribute Name="FontWeight" XPath="if (count(ancestor::brLevelledPara)&gt;1) then 'Normal' else 'Bold'" Context="Self"></Attribute>
        </Update>
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" Template="brLevelledParaNumber" Context="Self"></Attribute>
          </Update>
          <Section Id="ChildrenNodesContainer" Test="boolean(self::title)" FontWeight="Normal" Foreground="{$textColor}" FontSize="14">
            <xsl:apply-templates select="title"></xsl:apply-templates>
          </Section>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" Test="boolean(not(self::title))" FontSize="14" Foreground="{$textColor}" FontWeight="Normal">
        <xsl:apply-templates select="*[not(self::title)]"></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="brPara">
    <Paragraph Margin="0,0,0,4">
      <xsl:if test="parent::brLevelledPara and preceding-sibling::*">
        <xsl:attribute name="Margin">80,0,0,4</xsl:attribute>
      </xsl:if>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brDecisionPointUniqueIdent' and local-name()!='brDecisionPointPriority')">
        <xsl:apply-templates select="@*[local-name()!='brDecisionPointUniqueIdent' and local-name()!='brDecisionPointPriority']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>● </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brDecisionPointUniqueIdent' or local-name()='brDecisionPointPriority')">
        <xsl:apply-templates select="@*[local-name()='brDecisionPointUniqueIdent' or local-name()='brDecisionPointPriority']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brDecisionPointUniqueIdent|@brDecisionPointRefUniqueIdent">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@brDecisionPointPriority">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_priority','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'brDecisionPointPriority',.)"></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>) </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@brStatus">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'brStatus',.)"></xsl:value-of>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="brLevelledPara/title">
    <Span FontWeight="Bold" Foreground="{$textColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$textColor}" Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="brRelatedTo">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_related_to','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brDecisionPointContent">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_point_content','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brDecisionPointText">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_point_text','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brDecisionPointValueGroup">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_point_value_group','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brDecisionValueGroup">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_value_group','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brDecisionValueSelection">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='single'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_single','brdoc.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='multiple'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_multiple','brdoc.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="brDecisionValue">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_value_registered','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brDecisionValueRegistered">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="brDecisionPointValue">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_point_value','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brDecisionValueAllowed">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="brDecision">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brDecisionIdentNumber' and local-name()!='brexRuleFlag' and local-name()!='brSeverityLevel')">
        <xsl:apply-templates select="@*[local-name()!='brDecisionIdentNumber' and local-name()!='brexRuleFlag' and local-name()!='brSeverityLevel']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brDecisionIdentNumber' or local-name()='brexRuleFlag' or local-name()='brSeverityLevel')">
        <xsl:apply-templates select="@*[local-name()='brDecisionIdentNumber' or local-name()='brexRuleFlag' or local-name()='brSeverityLevel']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brexRuleFlag">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_brex_flag','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='1'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_yes','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='0'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_no','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>) </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@brSeverityLevel">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'brSeverityLevel',.)"></xsl:value-of>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="brDecisionText">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_text','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brDecisionRef">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brDecisionIdentNumber')">
        <xsl:apply-templates select="@*[local-name()!='brDecisionIdentNumber']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_business_rules_decision_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brDecisionIdentNumber')">
        <xsl:apply-templates select="@brDecisionIdentNumber"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
	
  <xsl:template match="brDecisionPointRef">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brDecisionPointUniqueIdent')">
        <xsl:apply-templates select="@*[local-name()!='brDecisionPointUniqueIdent']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_point_ref','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brDecisionPointUniqueIdent')">
        <xsl:apply-templates select="@brDecisionPointUniqueIdent"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>		
			
  <xsl:template match="brDecisionExplanation|brDecisionPointExplanation">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_explanation','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="example">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_example','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="markupExample">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_markup_example','brdoc.xslt')"></xsl:value-of>
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
  <xsl:template match="brDecisionPending">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_decision_pending','brdoc.xslt')"></xsl:value-of>
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
  <xsl:template match="@brDecisionIdentNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="brAudit">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brDecisionPointRefUniqueIdent')">
        <xsl:apply-templates select="@*[local-name()!='brDecisionPointRefUniqueIdent']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_audit','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brDecisionPointRefUniqueIdent')">
        <xsl:apply-templates select="@brDecisionPointRefUniqueIdent"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brAction">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brDecisionPointRefUniqueIdent' and local-name()!='brActionOwner' and local-name()!='brActionCompleted')">
        <xsl:apply-templates select="@*[local-name()!='brDecisionPointRefUniqueIdent' and local-name()!='brActionOwner' and local-name()!='brActionCompleted']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_action','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brDecisionPointRefUniqueIdent' or local-name()='brActionOwner' or local-name()='brActionCompleted')">
        <xsl:apply-templates select="@*[local-name()='brDecisionPointRefUniqueIdent' or local-name()='brActionOwner'  or local-name()='brActionCompleted']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Margin="24,0,0,0" Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brActionOwner">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:text> [</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text>] </xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="@brActionCompleted">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_action_completed','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='1'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_yes','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='0'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_no','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>) </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="brCurrentStatus">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brDecisionPointRefUniqueIdent' and local-name()!='brStatus')">
        <xsl:apply-templates select="@*[local-name()!='brDecisionPointRefUniqueIdent' and local-name()!='brStatus']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_current_status','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brDecisionPointRefUniqueIdent' or local-name()='brStatus')">
        <xsl:apply-templates select="@*[local-name()='brDecisionPointRefUniqueIdent' or local-name()='brStatus']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
	
  <xsl:template match="brCurrentStatus/responsiblePartnerCompany">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_responsible_partner_company','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>		
  <xsl:template match="brCurrentStatus/originator">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_originator','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>			
			
  <xsl:template match="brRequiredDate">
	<Paragraph Margin="24,0,0,0">
	 <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_required_date','brdoc.xslt')"></xsl:value-of>
		  <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" Test="boolean(local-name()='day')">
          <xsl:apply-templates select="@day"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" Test="boolean(local-name()='month')">
          <xsl:apply-templates select="@month"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" Test="boolean(local-name()='year')">
          <xsl:apply-templates select="@year"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
	</Paragraph>
  </xsl:template>
	
  <xsl:template match="brStatusDate">
	<Paragraph Margin="24,0,0,0">
	 <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_status_date','brdoc.xslt')"></xsl:value-of>
	  <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" Test="boolean(local-name()='day')">
          <xsl:apply-templates select="@day"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" Test="boolean(local-name()='month')">
          <xsl:apply-templates select="@month"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" Test="boolean(local-name()='year')">
          <xsl:apply-templates select="@year"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
	</Paragraph>
  </xsl:template>
		
			
  <xsl:template match="brRelatedTo/remarks">
    <Section Margin="24,0,0,0">
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
  <xsl:template match="sourceDocRef">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_source_doc_ref','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brCategoryGroup">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_category_group','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brCategory">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='brCategoryNumber')">
        <xsl:apply-templates select="@*[local-name()!='brCategoryNumber']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_category','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='brCategoryNumber')">
        <xsl:apply-templates select="@brCategoryNumber"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="brCategory/title|brDecision/title|brAction/title">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span FontWeight="Bold" Foreground="{$textColor}">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Foreground="{$textColor}" Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="after"></xsl:call-template>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brCategoryNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="brCategoryDescription">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_category_description','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="s1000dSchemas">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_s1000d_schemas','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="configAttributes">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_configurable_attributes','brdoc.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@appliccrossreftableXsd">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_appliccrossreftable_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brdocXsd">
    <Paragraph Margin="24,0,0,0">
       <xsl:call-template name="idtemplate" />		
       <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_brdoc_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brexXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_brex_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@checklistXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_checklist_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@commentXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_comment_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@comrepXsd">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_comrep_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@condcrossreftableXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_condcrossreftable_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@containerXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_container_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@crewXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_crew_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@ddnXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_ddn_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@descriptXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_descript_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@dmlXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_dml_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@faultXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_fault_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@frontmatterXsd">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_frontmatter_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@icnmetadataXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_icnmetadata_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@ipdXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_ipd_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@learningXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_learning_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@pmXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_pm_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@prdcrossreftableXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_prdcrossreftable_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@procedXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_proced_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@processXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_process_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sbXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sb_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@schedulXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_schedul_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@scocontentXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_scocontent_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@scromcontentpackageXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_scromcontentpackage_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@updateXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_update_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@wrngdataXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_wrngdata_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@wrngfldsXsd">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_wrngflds_xsd','brdoc.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@accessPointTypeValueAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_accessPointTypeValueAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@acronymTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_acronymTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@actionIdentTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_actionIdentTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@barCodeSymbologyAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_barCodeSymbologyAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brDecisionPointPriorityAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_brDecisionPointPriorityAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brSeverityLevelAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_brSeverityLevelAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@brStatusAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_brStatusAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@cancelCaptionAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_cancelCaptionAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@caveatAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_caveatAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@checkListCategoryAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_checkListCategoryAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@circuitBreakerRefTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_circuitBreakerRefTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@circuitBreakerTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_circuitBreakerTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@colorAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_colorAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@commentPriorityCodeAttRelation">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_commentPriorityCodeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@commercialClassificationAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_commercialClassificationAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@crewMemberTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_crewMemberTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@crewStepConditionAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_crewStepConditionAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@defaultBrSeverityLevelAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_defaultBrSeverityLevelAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@drillTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_drillTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@emphasisTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_emphasisTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@frontMatterInfoTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_frontMatterInfoTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@frontMatterTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_frontMatterTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@functionAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_functionAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@functionalItemRefTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_functionalItemRefTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@functionalItemTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_functionalItemTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@genericPropertyTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_genericPropertyTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@hazardousClassValueAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_hazardousClassValueAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@icnInfoItemTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_icnInfoItemTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@icnResourceFileTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_icnResourceFileTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@icnSourceFileTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
      <xsl:call-template name="idtemplate" />		
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_icnSourceFileTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@installationLocationTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_installationLocationTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@internalRefTargetTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_internalRefTargetTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@itemCharacteristicAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_itemCharacteristicAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@itemOriginatorAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_itemOriginatorAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@limitUnitTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_limitUnitTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@listItemPrefixAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_listItemPrefixAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@lowestLevelAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_lowestLevelAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@maintLevelCodeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_maintLevelCodeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@materialUsageAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_materialUsageAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@operationTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_operationTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@partCharacteristicAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_partCharacteristicAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@partStatusAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_partStatusAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@partUsageCodeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_partUsageCodeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@pmEntryTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_pmEntryTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@pmTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_pmTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@productCategoryAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_productCategoryAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@productItemTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_productItemTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@quantityTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_quantityTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@quantityUnitOfMeasureAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_quantityUnitOfMeasureAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@refTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_refTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@reqCondCategoryAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_reqCondCategoryAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@reqTechInfoCategoryAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_reqTechInfoCategoryAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@resetCaptionAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_resetCaptionAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@responseTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_responseTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sbComplianceCategoryAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sbComplianceCategoryAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sbImpactTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sbImpactTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sbMaterialTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sbMaterialTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sbTaskCategoryAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sbTaskCategoryAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sbTimeComplianceTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sbTimeComplianceTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sbTopicTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sbTopicTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@scoEntryTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_scoEntryTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@securityClassificationAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_securityClassificationAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@significantParaDataTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_significantParaDataTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@skillLevelCodeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_skillLevelCodeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@skillTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_skillTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@softwareClassificationValueAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_softwareClassificationValueAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@softwareCustomizationStatusValueAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_softwareCustomizationStatusValueAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sourceCriticalityAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sourceCriticalityAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sourceTypeCodeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sourceTypeCodeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@sourcingTypeValueAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_sourcingTypeValueAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@submitCaptionAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_submitCaptionAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@supervisorLevelCodeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_supervisorLevelCodeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@supplyNumberTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_supplyNumberTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@taskCodeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_taskCodeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@thresholdUnitOfMeasureAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_thresholdUnitOfMeasureAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@updateReasonTypeAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_updateReasonTypeAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@verbatimStyleAttRelation">
    <Paragraph Margin="24,0,0,0">
	  <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>  -  </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brdoc_business_rules_verbatimStyleAttRelation','brdoc.xslt')" />
      </Run>
    </Paragraph>
  </xsl:template>
</xsl:stylesheet>