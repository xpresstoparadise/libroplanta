<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:import href="partInfo.xslt"></xsl:import>
  <xsl:import href="enterpriseInfo.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="commonRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_common_information_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="controlIndicatorRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_control_indicator_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="controlIndicatorGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_control_or_indicator_group','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="controlIndicatorSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='controlIndicatorNumber')">
          <xsl:apply-templates select="@*[local-name()!='controlIndicatorNumber']"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='controlIndicatorNumber')">
          <xsl:apply-templates select="@controlIndicatorNumber"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:text> - </xsl:text>
        </Run>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_control_or_indicator_spec','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@controlIndicatorNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="controlIndicatorGroup/internalRef|zone/internalRef|functionalItem/internalRef|tool/internalRef">
    <xsl:variable name="internalRefId" select="@internalRefId"></xsl:variable>
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="Hyperlink"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="controlIndicatorKey">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_control_or_indicator_key','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="controlIndicatorName">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_name','comtemp.xslt')"></xsl:value-of>
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
  <xsl:template match="controlIndicatorSpec/shortName|zone/shortName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_short_name','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template match="controlIndicatorDescr">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_description','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="controlIndicatorFunction">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_control_or_indicator_function','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="zoneRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="zoneSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='zoneType')">
          <xsl:apply-templates select="@*[local-name()!='zoneType']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_spec','cir.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='zoneType')">
          <xsl:apply-templates select="@zoneType"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@zoneType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_type','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run>]</Run>
    </Span>
  </xsl:template>
  <xsl:template match="zoneIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='zoneNumber')">
        <xsl:apply-templates select="@*[local-name()!='zoneNumber']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_ident','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='zoneNumber')">
        <xsl:apply-templates select="@zoneNumber"></xsl:apply-templates>
      </Span>
      <Run>
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
  <xsl:template match="@zoneNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="zoneRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='zoneRefType')">
          <xsl:apply-templates select="@*[local-name()!='zoneRefType']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_references_to_other_zones','cir.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='zoneRefType')">
          <xsl:apply-templates select="@zoneRefType"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@zoneRefType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>]</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="zoneAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_alternate_group','cir.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="zone">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='altNumber')">
          <xsl:apply-templates select="@*[local-name()!='altNumber']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='altNumber')">
          <xsl:apply-templates select="@altNumber"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@altNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="itemDescr">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_description','comtemp.xslt')"></xsl:value-of>
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
  <xsl:template match="zoneSide">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='zoneSideValue')">
        <xsl:apply-templates select="@*[local-name()!='zoneSideValue']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_side','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='zoneSideValue')">
        <xsl:apply-templates select="@zoneSideValue"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@zoneSideValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='lh'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_lh','cir.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='rh'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_rh','cir.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='lr'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_lr','cir.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="boundaryFrom">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_boundary_from','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="boundaryTo">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_zone_boundary_to','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="boundary">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_boundary','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="zoneSpec/refs|applicSpec/refs|partSpec/refs|enterpriseSpec/refs|supplySpec/refs|supplyRqmt/refs|supplyRqmtSpec/refs">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_references','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Foreground="{$textColor}" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalPhysicalAreaRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_physical_area_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="functionalPhysicalAreaSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_physical_area','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="functionalPhysicalAreaIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
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
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='disassyCode')">
          <xsl:apply-templates select="@disassyCode"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='disassyCodeVariant')">
          <xsl:apply-templates select="@disassyCodeVariant"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="  functionalPhysicalAreaIdent/@subSystemCode|  functionalPhysicalAreaIdent/@assyCode|  functionalPhysicalAreaIdent/@disassyCode|  functionalPhysicalAreaRef/@subSystemCode|  functionalPhysicalAreaRef/@assyCode|  functionalPhysicalAreaRef/@disassyCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>-</Run>
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="  functionalPhysicalAreaIdent/@systemCode|  functionalPhysicalAreaRef/@systemCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>-</Run>
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColorDark}">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="functionalPhysicalAreaIdent/@systemDiffCode|       functionalPhysicalAreaIdent/@disassyCodeVariant|       functionalPhysicalAreaIdent/@subSubSystemCode|       functionalPhysicalAreaRef/@systemDiffCode|       functionalPhysicalAreaRef/@disassyCodeVariant|       functionalPhysicalAreaRef/@subSubSystemCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="functionalPhysicalAreaRef//dmRefIdent">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}"> (</Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">) </Run>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="name">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_name','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="shortName">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_short_name','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalPhysicalAreaRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_physical_area_ref_group','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="functionalPhysicalAreaRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='systemDiffCode' and local-name()!='systemCode' and local-name()!='subSystemCode' and local-name()!='subSubSystemCode' and local-name()!='assyCode' and local-name()!='disassyCode' and local-name()!='disassyCodeVariant')">
        <xsl:apply-templates select="@*[local-name()!='systemDiffCode' and local-name()!='systemCode' and local-name()!='subSystemCode' and local-name()!='subSubSystemCode' and local-name()!='assyCode' and local-name()!='disassyCode' and local-name()!='disassyCodeVariant']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_physical_area_ref','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Foreground="{$refColor}" FontWeight="Bold">
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
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='disassyCode')">
          <xsl:apply-templates select="@disassyCode"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='disassyCodeVariant')">
          <xsl:apply-templates select="@disassyCodeVariant"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Section>
  </xsl:template>
  <xsl:template match="applicRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_applicability_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="applicSpec">
    <xsl:variable name="applicMapRefId" select="@applicMapRefId"></xsl:variable>
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='applicMapRefId']">
          <xsl:apply-templates select="@*[local-name()!='applicMapRefId']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_applicability','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='applicMapRefId']">
          <xsl:apply-templates select="@*[local-name()='applicMapRefId']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@applicMapRefId">
    <xsl:variable name="applicMapRefId" select="."></xsl:variable>
    <Span FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <Hyperlink Foreground="{$refColor}">
        <xsl:attribute name="IdRef">
          <xsl:call-template name="id">
            <xsl:with-param name="context" select="//*[@id=$applicMapRefId]"></xsl:with-param>
          </xsl:call-template>
        </xsl:attribute>
        <Span>
          <Update>
            <Structure Template="applicMapRefId" Context="IDRefs"></Structure>
          </Update>
        </Span>
      </Hyperlink>
    </Span>
  </xsl:template>
  <xsl:template match="applicSpecIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='applicIdentValue')">
        <xsl:apply-templates select="@*[local-name()!='applicIdentValue']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_applic_identifier','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='applicIdentValue')">
        <xsl:apply-templates select="@applicIdentValue"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="applicSpecIdent/@applicIdentValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="warningRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_warning_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="cautionRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_caution_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="warningSpec">
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_warning','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="cautionSpec">
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_caution','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="warningIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='warningIdentNumber')">
        <xsl:apply-templates select="@*[local-name()!='warningIdentNumber']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_warning_identifier','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='warningIdentNumber')">
        <xsl:apply-templates select="@warningIdentNumber"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="cautionIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='cautionIdentNumber')">
        <xsl:apply-templates select="@*[local-name()!='cautionIdentNumber']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_caution_identifier','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='cautionIdentNumber')">
        <xsl:apply-templates select="@cautionIdentNumber"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="warningIdent/@warningIdentNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="cautionIdent/@cautionIdentNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="functionalItemRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_item_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="functionalItemIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='functionalItemNumber' and local-name()!='functionalItemType' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()!='functionalItemNumber' and local-name()!='functionalItemType' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_item_identification','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='functionalItemNumber' or local-name()='functionalItemType' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()='functionalItemNumber' or local-name()='functionalItemType' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="commonRepository//@functionalItemNumber">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_item_number','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="commonRepository//@functionalItemType">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_item_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'functionalItemType',.)"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalItemRepository//@installationIdent|circuitBreakerRepository//@installationIdent">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_installation_identifier','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalItemRepository//@contextIdent|circuitBreakerRepository//@contextIdent">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_context_identification','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalItemRepository//@manufacturerCodeValue|partIdent//@manufacturerCodeValue|partRef//@manufacturerCodeValue|circuitBreakerRepository//@manufacturerCodeValue">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_manufactorer_code_value','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalItemRepository//@itemOriginator|circuitBreakerRepository//@itemOriginator">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_originator','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'itemOriginator',.)"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="toolRepository//@toolNumber">
    <Paragraph Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_tool_number','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="toolRef/@manufacturerCodeValue|toolIdent/@manufacturerCodeValue">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_manufactorer_code_value','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalItemSpec">
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontSize="14" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_item','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="functionalItemAlts">
    <Section Margin="0,10,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_item_alternate_group','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="functionalItemRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='functionalItemRefType')">
          <xsl:apply-templates select="@*[local-name()!='functionalItemRefType']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_functional_item_ref_group','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='functionalItemRefType')">
          <xsl:apply-templates select="@*[local-name()='functionalItemRefType']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@functionalItemRefType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'functionalItemRefType',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="functionalItemRef">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='functionalItemNumber' and local-name()!='functionalItemType' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()!='functionalItemNumber' and local-name()!='functionalItemType' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_item_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='functionalItemNumber' or local-name()='functionalItemType' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()='functionalItemNumber' or local-name()='functionalItemType' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalItem">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='normativeComponentFlag' and local-name()!='sealedFlag' and local-name()!='altNumber')">
        <xsl:apply-templates select="@*[local-name()!='normativeComponentFlag' and local-name()!='sealedFlag' and local-name()!='altNumber']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_item_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='normativeComponentFlag' or local-name()='sealedFlag' or local-name()='altNumber')">
        <xsl:apply-templates select="@*[local-name()='normativeComponentFlag' or local-name()='sealedFlag' or local-name()='altNumber' or local-name()='contextIdent']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="groundingType">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_grounding_type','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="softwareClassification">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='softwareClassificationValue')">
          <xsl:apply-templates select="@*[local-name()!='softwareClassificationValue']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_software_classification','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='softwareClassificationValue')">
          <xsl:apply-templates select="@*[local-name()='softwareClassificationValue']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="@softwareClassificationValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'softwareClassificationValue',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="softwareCustomizationStatus">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='softwareCustomizationStatusValue')">
          <xsl:apply-templates select="@*[local-name()!='softwareCustomizationStatusValue']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_software_customization_status','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='softwareCustomizationStatusValue')">
          <xsl:apply-templates select="@*[local-name()='softwareCustomizationStatusValue']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="@softwareCustomizationStatusValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'softwareCustomizationStatusValue',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="location">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_location','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="installationLocation">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_installation_location','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='installationLocationType')">
          <xsl:apply-templates select="@installationLocationType"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='unitOfMeasure')">
          <xsl:apply-templates select="@unitOfMeasure"></xsl:apply-templates>
        </Span>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="accessFrom">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_from','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Foreground="{$textColor}" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="functionalItemFamily">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_family','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="location/quantity|supplySpec/quantity">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_quantity','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="partRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_part_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="partSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='partNumberUnavailableFlag')">
          <xsl:apply-templates select="@*[local-name()!='partNumberUnavailableFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_part_spec','cir.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='partNumberUnavailableFlag')">
          <xsl:apply-templates select="@partNumberUnavailableFlag"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@partNumberUnavailableFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_part_number_unavailable','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">]</Run>
    </Span>
  </xsl:template>
  <xsl:template match="partIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='partNumberValue' and local-name()!='manufacturerCodeValue')">
        <xsl:apply-templates select="@*[local-name()!='partNumberValue' and local-name()!='manufacturerCodeValue']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_part_number_identification','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='partNumberValue' or local-name()='manufacturerCodeValue')">
        <xsl:apply-templates select="@*[local-name()='partNumberValue' or local-name()='manufacturerCodeValue']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="partIdent/@partNumberValue|partRef/@partNumberValue">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_part_number','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="toolRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_tool_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="toolSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='partNumberUnavailableFlag')">
          <xsl:apply-templates select="@*[local-name()!='partNumberUnavailableFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_part_spec','cir.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='partNumberUnavailableFlag')">
          <xsl:apply-templates select="@partNumberUnavailableFlag"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="toolIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='toolNumber' and local-name()!='manufacturerCodeValue')">
        <xsl:apply-templates select="@*[local-name()!='toolNumber' and local-name()!='manufacturerCodeValue']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_tool_number_identification','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Paragraph Margin="17,0,0,0" TextAlignment="Left" Id="ChildrenAttributesContainer" Test="boolean(local-name()='toolNumber' or local-name()='manufacturerCodeValue')">
        <xsl:apply-templates select="@*[local-name()='toolNumber' or local-name()='manufacturerCodeValue']"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="toolRefGroup">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='toolRefType')">
        <xsl:apply-templates select="@*[local-name()!='toolRefType']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_relationships_with_other_tools','cir.xslt')"></xsl:value-of>: </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='toolRefType')">
        <xsl:apply-templates select="@*[local-name()='toolRefType']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="toolRepository//toolRef">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_tool_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Foreground="{$autoTextColor}" Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@toolRefType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="toolAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_tool_alts','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="tool">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='altNumber' and local-name()!='deliveredSpecificationFlag')">
          <xsl:apply-templates select="@*[local-name()!='altNumber' and local-name()!='deliveredSpecificationFlag']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_tool','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='altNumber')">
          <xsl:apply-templates select="@*[local-name()='altNumber']"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='deliveredSpecificationFlag')">
          <xsl:apply-templates select="@*[local-name()='deliveredSpecificationFlag']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@deliveredSpecificationFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_delivered_specification','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="rcmdQuantity">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_recommended_quantity','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="packaging">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_packaging','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="taskCategory">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='taskCategoryCode')">
        <xsl:apply-templates select="@*[local-name()!='taskCategoryCode']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_task_category_code','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='taskCategoryCode')">
        <xsl:apply-templates select="@*[local-name()='taskCategoryCode']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@taskCategoryCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="simpleRemark">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_simple_remark','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="enterpriseRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_enterprise_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="supplyRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="supplySpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='manufacturedFlag' and local-name()!='obsoleteFlag' and local-name()!='specialLabelFlag')">
          <xsl:apply-templates select="@*[local-name()!='manufacturedFlag' and local-name()!='obsoleteFlag' and local-name()!='specialLabelFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_specification','cir.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='manufacturedFlag' or local-name()='obsoleteFlag' or local-name()='specialLabelFlag')">
          <xsl:apply-templates select="@*[local-name()='manufacturedFlag' or local-name()='obsoleteFlag' or local-name()='specialLabelFlag']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@manufacturedFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_manufactured_flag','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@obsoleteFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_obsolete_flag','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@specialLabelFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_special_label_flag','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="supplyIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='supplyNumber' and local-name()!='supplyNumberType')">
        <xsl:apply-templates select="@*[local-name()!='supplyNumber' and local-name()!='supplyNumberType']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_ident','cir.xslt')"></xsl:value-of>
        <xsl:text>&#160;</xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='supplyNumber' or local-name()='supplyNumberType')">
        <xsl:apply-templates select="@*[local-name()='supplyNumber' or local-name()='supplyNumberType']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@supplyNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_number','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@supplyNumberType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'supplyNumberType',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="supplySetGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_set_group','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="supplySet">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_supply_set','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="supplyClassification">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_classification','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="specGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='vendorFlag')">
          <xsl:apply-templates select="@*[local-name()!='vendorFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_specification_list','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='vendorFlag')">
          <xsl:apply-templates select="@*[local-name()='vendorFlag']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@vendorFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_vendor','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="enterpriseGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='vendorFlag')">
          <xsl:apply-templates select="@*[local-name()!='vendorFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_enterprise_list','cir.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='vendorFlag')">
          <xsl:apply-templates select="@*[local-name()='vendorFlag']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="lowestAuthorizedLevelGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='vendorFlag')">
          <xsl:apply-templates select="@*[local-name()!='vendorFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_lowest_authorized_maintenance_level_group','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='vendorFlag')">
          <xsl:apply-templates select="@*[local-name()='vendorFlag']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="lowestAuthorizedLevel">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_lowest_authorized_maintenance_level','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@lowestLevel">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'lowestLevel',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="rcmd">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_recommendation','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="supplyRqmtRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_requirement_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="supplyRqmtSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_rqmt_specification','cir.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="supplyRqmtIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='materialCategory' and local-name()!='supplyRqmtNumber' and local-name()!='vendorFlag')">
        <xsl:apply-templates select="@*[local-name()!='materialCategory' and local-name()!='supplyRqmtNumber' and local-name()!='vendorFlag']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_ident','cir.xslt')"></xsl:value-of>
        <xsl:text>&#160;</xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='materialCategory' or local-name()='supplyRqmtNumber' or local-name()='vendorFlag')">
        <xsl:apply-templates select="@*[local-name()='materialCategory' or local-name()='supplyRqmtNumber' or local-name()='vendorFlag']"></xsl:apply-templates>
      </Span>
      <Run>
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
  <xsl:template match="@materialCategory">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_material_category','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@supplyRqmtNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_requirement_number','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="physicalChemicalDescr">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_physical_and_or_chemical_description','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="usage">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_usage','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="complianceCategory">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='complianceCategoryValue')">
        <xsl:apply-templates select="@*[local-name()!='complianceCategoryValue']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_compliance_category','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='complianceCategoryValue')">
        <xsl:apply-templates select="@*[local-name()='complianceCategoryValue']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="processCategory">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_process_category','cir.xslt')"></xsl:value-of>
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
  <xsl:template match="@complianceCategoryValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="supplyRqmtStatus">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='supplyRqmtStatusValue')">
          <xsl:apply-templates select="@*[local-name()!='supplyRqmtStatusValue']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_requirement_status','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='supplyRqmtStatusValue')">
          <xsl:apply-templates select="@*[local-name()='supplyRqmtStatusValue']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@supplyRqmtStatusValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="supplyRqmtRef">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='materialCategory' and local-name()!='supplyRqmtNumber' and local-name()!='vendorFlag')">
        <xsl:apply-templates select="@*[local-name()!='materialCategory' and local-name()!='supplyRqmtNumber' and local-name()!='vendorFlag']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_requirement_ref','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='materialCategory' or local-name()='supplyRqmtNumber' or local-name()='vendorFlag')">
        <xsl:apply-templates select="@*[local-name()='materialCategory' or local-name()='supplyRqmtNumber' or local-name()='vendorFlag']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="supplyRqmtAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_requirement_alts','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="supplyRqmt">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='productCategory' and local-name()!='supplyRqmtType')">
        <xsl:apply-templates select="@*[local-name()!='productCategory' and local-name()!='supplyRqmtType']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_requirement','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='productCategory' or local-name()='supplyRqmtType')">
        <xsl:apply-templates select="@*[local-name()='productCategory' or local-name()='supplyRqmtType']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@productCategory">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_product_category','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'productCategory',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@supplyRqmtType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="supplyRqmtAltsIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='materialCategory' and local-name()!='supplyRqmtNumber' and local-name()!='vendorFlag')">
        <xsl:apply-templates select="@*[local-name()!='materialCategory' and local-name()!='supplyRqmtNumber' and local-name()!='vendorFlag']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_ident','cir.xslt')"></xsl:value-of>
        <xsl:text>&#160;</xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='materialCategory' or local-name()='supplyRqmtNumber' or local-name()='vendorFlag')">
        <xsl:apply-templates select="@*[local-name()='materialCategory' or local-name()='supplyRqmtNumber' or local-name()='vendorFlag']"></xsl:apply-templates>
      </Span>
      <Run>
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
  <xsl:template match="safetyCategory">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='safetyCategoryValue')">
        <xsl:apply-templates select="@*[local-name()!='safetyCategoryValue']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_safety_category','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='safetyCategoryValue')">
        <xsl:apply-templates select="@*[local-name()='safetyCategoryValue']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@safetyCategoryValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="supplyRef">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='supplyNumber' and local-name()!='supplyNumberType')">
        <xsl:apply-templates select="@*[local-name()!='supplyNumber' and local-name()!='supplyNumberType']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_supply_ref','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='supplyNumber' or local-name()='supplyNumberType')">
        <xsl:apply-templates select="@*[local-name()='supplyNumber' or local-name()='supplyNumberType']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="circuitBreakerRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="circuitBreakerSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_spec','cir.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="circuitBreakerIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='circuitBreakerNumber' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()!='circuitBreakerNumber' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_ident','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='circuitBreakerNumber' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()='circuitBreakerNumber' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="circuitBreakerRepository//@circuitBreakerNumber">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_number','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="circuitBreakerRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='zoneRefType')">
          <xsl:apply-templates select="@*[local-name()!='zoneRefType']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_ref_group','cir.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='zoneRefType')">
          <xsl:apply-templates select="@zoneRefType"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="circuitBreakerRef">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='circuitBreakerNumber' and local-name()!='circuitBreakerType' and local-name()!='circuitBreakerAction' and local-name()!='checkSum' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()!='circuitBreakerNumber' and local-name()!='circuitBreakerType' and local-name()!='circuitBreakerAction' and local-name()!='checkSum' and local-name()!='installationIdent' and local-name()!='contextIdent' and local-name()!='manufacturerCodeValue' and local-name()!='itemOriginator']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_ref','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='circuitBreakerNumber' or local-name()='circuitBreakerType' or local-name()='circuitBreakerAction' or local-name()='checkSum' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator')">
        <xsl:apply-templates select="@*[local-name()='circuitBreakerNumber' or local-name()='circuitBreakerType' or local-name()='circuitBreakerAction' or local-name()='checkSum' or local-name()='installationIdent' or local-name()='contextIdent' or local-name()='manufacturerCodeValue' or local-name()='itemOriginator']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template match="circuitBreakerRepository//@checkSum">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_checksum','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="circuitBreakerRepository//@circuitBreakerType">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'circuitBreakerType',.)"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="circuitBreakerRepository//@circuitBreakerAction">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_action','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='open'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_open','cir.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='close'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_close','cir.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='verif-open'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_verify_open','cir.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='verif-close'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_verify_closed','cir.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='open-order'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_open_order','cir.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='close-order'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_cb_close_order','cir.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="circuitBreakerAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_alts','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="circuitBreaker">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='altNumber' and local-name()!='monitoredFlag' and local-name()!='collaredCircuitBreakerFlag' and local-name()!='provisionedFlag')">
        <xsl:apply-templates select="@*[local-name()!='altNumber' and local-name()!='monitoredFlag' and local-name()!='collaredCircuitBreakerFlag' and local-name()!='provisionedFlag']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_full','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='altNumber' or local-name()='monitoredFlag' or local-name()='collaredCircuitBreakerFlag' or local-name()='provisionedFlag')">
        <xsl:apply-templates select="@*[local-name()='altNumber' or local-name()='monitoredFlag' or local-name()='collaredCircuitBreakerFlag' or local-name()='provisionedFlag']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template match="@monitoredFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_monitored','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@collaredCircuitBreakerFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_collared','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@provisionedFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_provisioned','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="circuitBreakerClass">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='circuitBreakerType')">
        <xsl:apply-templates select="@*[local-name()!='circuitBreakerType']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_circuit_breaker_class','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='circuitBreakerType')">
        <xsl:apply-templates select="@*[local-name()='circuitBreakerType']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="amperage">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='unitOfMeasure')">
        <xsl:apply-templates select="@*[local-name()!='unitOfMeasure']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_amperage','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='unitOfMeasure')">
        <xsl:apply-templates select="@*[local-name()='unitOfMeasure']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="accessPointRepository">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_repository','cir.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="accessPointSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontWeight="Bold" FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_spec','cir.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="accessPointIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_identification','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="accessPointAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_alts','cir.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="accessPoint">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Span>
  </xsl:template>
  <xsl:template match="accessPointType">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='accessPointTypeValue')">
        <xsl:apply-templates select="@*[local-name()!='accessPointTypeValue']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_type','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='accessPointTypeValue')">
        <xsl:apply-templates select="@*[local-name()='accessPointTypeValue']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@accessPointTypeValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'accessPointTypeValue',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="accessPointRef/@accessPointTypeValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> (</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'accessPointTypeValue',.)"></xsl:value-of>
        <xsl:text>) </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="accessTo">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_to','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="otherItems">
    <Paragraph Foreground="{$autoTextColor}" Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_other_items','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="accessPointRefGroup">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='accessPointRefType')">
        <xsl:apply-templates select="@*[local-name()!='accessPointRefType']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_ref_group','cir.xslt')"></xsl:value-of>
        <xsl:text>&#160;</xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='accessPointRefType')">
        <xsl:apply-templates select="@accessPointRefType"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@accessPointRefType">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text>(</xsl:text>
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>)</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="fastener">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_fastener','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="fastenerType">
    <Paragraph Foreground="{$autoTextColor}" Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="fastenerQuantity">
    <Paragraph Foreground="{$autoTextColor}" Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_quantity','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="accessPoint/quantity">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_quantity','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="hoursToClose">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_hours_to_close','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="hoursToOpen">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cir_access_point_hours_to_open','cir.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
</xsl:stylesheet>