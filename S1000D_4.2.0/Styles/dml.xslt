<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="/dml">
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
  <xsl:template match="dmlIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_data_management_list_code','dml.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="dmlCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='modelIdentCode')">
          <xsl:apply-templates select="@modelIdentCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='senderIdent')">
          <xsl:apply-templates select="@senderIdent"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='dmlType')">
          <xsl:apply-templates select="@dmlType"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='yearOfDataIssue')">
          <xsl:apply-templates select="@yearOfDataIssue"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='seqNumber')">
          <xsl:apply-templates select="@seqNumber"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="  @senderIdent|  @dmlType|  @yearOfDataIssue|  @seqNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="dmlIdent/issueInfo">
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
  <xsl:template match="dmlStatus/brexDmRef">
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
  <xsl:template match="dmlAddressItems/issueDate">
    <Section Foreground="{$autoTextColor}">
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
    </Section>
  </xsl:template>
  <xsl:template match="dmlContent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_data_management_list','dml.xslt')"></xsl:value-of>
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
  <xsl:template match="dmlEntry">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_dml_entry','dml.xslt')"></xsl:value-of>
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
  <xsl:template match="dmlEntry/responsiblePartnerCompany">
    <Section>
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
    </Section>
  </xsl:template>
  <xsl:template match="dmlEntry/answer">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_answer','dml.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@answerToEntry">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='y'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_yes','comtemp.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='n'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_no','comtemp.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="@dmlEntryType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_dml_entry_type','dml.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='c'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_entry_type_c','dml.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='d'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_entry_type_d','dml.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='n'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_dml_entry_type_n','dml.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="dmlEntry/@issueType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issue_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,concat('tlp_comtemp_issue_',.),'comtemp.xslt')"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="dmlStatus/@issueType">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issue_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,concat('tlp_comtemp_issue_',.),'comtemp.xslt')"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="dmlStatus/dmlRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_data_management_list_reference','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="commentRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="commentCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='modelIdentCode')">
          <xsl:apply-templates select="@modelIdentCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='senderIdent')">
          <xsl:apply-templates select="@senderIdent"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='yearOfDataIssue')">
          <xsl:apply-templates select="@yearOfDataIssue"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='seqNumber')">
          <xsl:apply-templates select="@seqNumber"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='commentType')">
          <xsl:apply-templates select="@commentType"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@commentType|@infoEntityRefIdent">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="infoEntityRef">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='infoEntityRefIdent')">
          <xsl:apply-templates select="@infoEntityRefIdent"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
</xsl:stylesheet>