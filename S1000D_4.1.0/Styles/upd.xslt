<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:import href="cir.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="/dataUpdateFile">
    <Root>
      <Section LineHeight="1.3" VerticalAlignment="Bottom" FontSize="14">
        <xsl:call-template name="idtemplate" />
        <Paragraph TextAlignment="Right" Foreground="{$autoTextColorDark}" FontWeight="Bold">
          <xsl:call-template name="before"></xsl:call-template>
          <Run>
            <xsl:value-of select="xef:GetDocumentType()"></xsl:value-of>
          </Run>
          <Run>
            <xsl:text> - </xsl:text>
          </Run>
          <Run>
            <xsl:value-of select="xef:GetDocumentTemplate()"></xsl:value-of>
          </Run>
        </Paragraph>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
      </Section>
    </Root>
  </xsl:template>
  <xsl:template match="updateIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_data_update_file_code','upd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="updateCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='objectIdentCode')">
          <xsl:apply-templates select="@objectIdentCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='modelIdentCode')">
          <xsl:apply-templates select="@modelIdentCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='systemDiffCode')">
          <xsl:apply-templates select="@systemDiffCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='systemCode')">
          <xsl:apply-templates select="@systemCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='subSystemCode')">
          <xsl:apply-templates select="@subSystemCode"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='subSubSystemCode')">
          <xsl:apply-templates select="@subSubSystemCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='assyCode')">
          <xsl:apply-templates select="@assyCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='disassyCode')">
          <xsl:apply-templates select="@disassyCode"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='disassyCodeVariant')">
          <xsl:apply-templates select="@disassyCodeVariant"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='infoCode')">
          <xsl:apply-templates select="@infoCode"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='infoCodeVariant')">
          <xsl:apply-templates select="@infoCodeVariant"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='itemLocationCode')">
          <xsl:apply-templates select="@itemLocationCode"></xsl:apply-templates>
        </Span>
        <Span Foreground="{$autoTextColorDark}">
          <Run Event="AttributeEditor" MouseCursor="Hand">
            <Update>
              <Text XPath="if (@learnCode) then '-' else ''" Context="Self"></Text>
            </Update>
          </Run>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='learnCode')">
            <xsl:apply-templates select="@learnCode"></xsl:apply-templates>
          </Span>
          <Run Event="AttributeEditor" MouseCursor="Hand">
            <Update>
              <Text XPath="if (@learnEventCode) then '-' else ''" Context="Self"></Text>
            </Update>
          </Run>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='learnEventCode')">
            <xsl:apply-templates select="@learnEventCode"></xsl:apply-templates>
          </Span>
        </Span>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@objectIdentCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="updateIdent/issueInfo">
    <Section Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issue_information','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='issueNumber')">
          <xsl:apply-templates select="@issueNumber"></xsl:apply-templates>
        </Span>
        <Run>
          <Update>
            <Text XPath="if (@inWork) then '-' else ''" Context="Self"></Text>
          </Update>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='inWork')">
          <xsl:apply-templates select="@inWork"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="targetDmIssueInfo">
    <Section Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_target_dm_issue_information','upd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='issueNumber')">
          <xsl:apply-templates select="@issueNumber"></xsl:apply-templates>
        </Span>
        <Run>
          <Update>
            <Text XPath="if (@inWork) then '-' else ''" Context="Self"></Text>
          </Update>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='inWork')">
          <xsl:apply-templates select="@inWork"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="updateAddress/issueDate">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:if test="parent::dmRefAddressItems or parent::pmRefAddressItems or parent::externalPubRefAddressItems">
          <xsl:text> / </xsl:text>
        </xsl:if>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issuedate','comtemp.xslt')"></xsl:value-of>
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
    </Span>
  </xsl:template>
  <xsl:template match="updateIdent/language">
    <Section Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_language','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='languageIsoCode')">
          <xsl:apply-templates select="@languageIsoCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='countryIsoCode')">
          <xsl:apply-templates select="@countryIsoCode"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="security">
    <Section Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_security','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='securityClassification')" FontWeight="Bold">
        <xsl:apply-templates select="@securityClassification"></xsl:apply-templates>
      </Span>
      <Run>
        <Update>
          <Text XPath="if (@commercialClassification) then ' / ' else ''" Context="Self"></Text>
        </Update>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='commercialClassification')" FontWeight="Bold">
        <xsl:apply-templates select="@commercialClassification"></xsl:apply-templates>
      </Span>
      <Run>
        <Update>
          <Text XPath="if (@caveat) then ' / ' else ''" Context="Self"></Text>
        </Update>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='caveat')" FontWeight="Bold">
        <xsl:apply-templates select="@caveat"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="updateStatus/brexDmRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_brex_dm_reference','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="updateAddressItems/issueDate">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:if test="parent::dmRefAddressItems or parent::pmRefAddressItems or parent::externalPubRefAddressItems">
          <xsl:text> / </xsl:text>
        </xsl:if>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issuedate','comtemp.xslt')"></xsl:value-of>
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
    </Span>
  </xsl:template>
	
  <xsl:template match="updateStatus">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_update_status','upd.xslt')"></xsl:value-of>
        </Run>
		<xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Section>
  </xsl:template>		
			
  <xsl:template match="targetDmStatus">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_target_dm_status','upd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Section>
  </xsl:template>
  <xsl:template match="updateStatus/responsiblePartnerCompany|targetDmStatus/responsiblePartnerCompany">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
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
    </Section>
  </xsl:template>
  <xsl:template match="updateStatus/originator|targetDmStatus/originator">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
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
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="updateStatus/applicCrossRefTableRef|targetDmStatus/applicCrossRefTableRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_applicability_cross_reference_table_reference','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="updateStatus/brexDmRef|targetDmStatus/brexDmRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_brex_dm_reference','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="updateStatus/sourceDmIdent|targetDmStatus/sourceDmIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_source_data_module_identification','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="update">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_data_update_file','upd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Section>
  </xsl:template>
  <xsl:template match="insertObjectGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_insert_object_group','upd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="deleteObjectGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_delete_object_group','upd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="replaceObjectGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_replace_object_group','upd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reinstateObjectGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_reinstate_object_group','upd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="insertObject">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_insert_object','upd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="deleteObject">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_delete_object','upd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="replaceObject">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_replace_object','upd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="reinstateObject">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_reinstate_object','upd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@insertionOrder">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_upd_insertion_order','upd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='before'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_before','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='after'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_after','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@targetPath">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_target_path','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
</xsl:stylesheet>