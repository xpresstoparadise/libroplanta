<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="brex">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_business_rules_exchange','brex.xslt')"></xsl:value-of>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Section>
  </xsl:template>
  <xsl:template match="contextRules">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_context_rules','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="snsRules">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sns_rules','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="snsTitle">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
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
  <xsl:template match="snsDescr">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_sns_descr','brex.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="snsSystem">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='snsCode')">
          <xsl:apply-templates select="snsCode"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_sns_system','brex.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='snsTitle')" Margin="17,0,0,0">
        <xsl:apply-templates select="snsTitle"></xsl:apply-templates>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='snsSubSystem')" Margin="17,0,0,0">
        <xsl:apply-templates select="snsSubSystem"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="snsSubSystem">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='snsCode')">
          <xsl:apply-templates select="snsCode"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_sns_sub_system','brex.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='snsTitle')" Margin="17,0,0,0">
        <xsl:apply-templates select="snsTitle"></xsl:apply-templates>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='snsSubSubSystem')" Margin="17,0,0,0">
        <xsl:apply-templates select="snsSubSubSystem"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="snsSubSubSystem">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='snsCode')">
          <xsl:apply-templates select="snsCode"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_sns_sub_sub_system','brex.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='snsTitle')" Margin="17,0,0,0">
        <xsl:apply-templates select="snsTitle"></xsl:apply-templates>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='snsAssy')" Margin="17,0,0,0">
        <xsl:apply-templates select="snsAssy"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="snsAssy">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='snsCode')">
          <xsl:apply-templates select="snsCode"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> - </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_sns_assy','brex.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='snsTitle')" Margin="17,0,0,0">
        <xsl:apply-templates select="snsTitle"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="nonContextRules">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_non_context_rules','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="structureObjectRuleGroup">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_structure_object_rule_group','brex.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="notationRuleList">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_notation_rule_list','brex.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="notationName">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='allowedNotationFlag')">
          <xsl:apply-templates select="@*[local-name()!='allowedNotationFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_notation_name','brex.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">[</Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='allowedNotationFlag')">
          <xsl:apply-templates select="@allowedNotationFlag"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>] - </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="notationRule">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_notation_rule','brex.xslt')"></xsl:value-of>
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
  <xsl:template match="nonContextRule">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_non_context_rule','brex.xslt')"></xsl:value-of>
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
  <xsl:template match="objectPath">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='allowedObjectFlag')">
          <xsl:apply-templates select="@*[local-name()!='allowedObjectFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_object_path','brex.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">[</Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='allowedObjectFlag')">
          <xsl:apply-templates select="@allowedObjectFlag"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>] - </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="structureObjectRule">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_structure_object_rule','brex.xslt')"></xsl:value-of>
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
  <xsl:template match="objectPath">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='allowedObjectFlag')">
          <xsl:apply-templates select="@*[local-name()!='allowedObjectFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_object_path','brex.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">[</Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='allowedObjectFlag')">
          <xsl:apply-templates select="@allowedObjectFlag"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>] - </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@allowedObjectFlag">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='0'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_allowed_object_flag_no','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='1'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_allowed_object_flag_yes','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='2'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_allowed_object_flag_optionally','brex.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="objectUse">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_object_use','brex.xslt')"></xsl:value-of>
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
  <xsl:template match="objectValue">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='valueTailoring' and local-name()!='valueForm' and local-name()!='valueAllowed')">
          <xsl:apply-templates select="@*[local-name()!='valueTailoring' and local-name()!='valueForm' and local-name()!='valueAllowed']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColorDark}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_object_value','brex.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='valueAllowed')">
          <xsl:apply-templates select="@valueAllowed"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> / </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_value_form','brex.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='valueForm')">
          <xsl:apply-templates select="@valueForm"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> / </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_tailoring','brex.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='valueTailoring')">
          <xsl:apply-templates select="@valueTailoring"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> / [</xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_meaning','brex.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">]</Run>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@allowedObjectFlag|@allowedNotationFlag">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='0'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_allowed_object_flag_no','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='1'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_allowed_object_flag_yes','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='2'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_allowed_object_flag_optionally','brex.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="@valueAllowed">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@valueTailoring">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='restrictable'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_restrictable','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='lexical'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_lexical','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='closed'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_closed','brex.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="@valueForm">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='single'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_value_form_single','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='pattern'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_value_form_pattern','brex.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='range'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_brex_value_form_range','brex.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
</xsl:stylesheet>