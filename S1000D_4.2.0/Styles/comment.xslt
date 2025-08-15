<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="/comment">
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
		  <xsl:call-template name="first"></xsl:call-template>
        </Paragraph>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Section>
    </Root>
  </xsl:template>
  <xsl:template match="commentIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_code','comment.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
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
      <xsl:call-template name="first"></xsl:call-template>		
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
  <xsl:template match="@senderIdent|@commentType|@yearOfDataIssue|@seqNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="commentIdent/language">
    <Section Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>		
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
      <xsl:call-template name="first"></xsl:call-template>			
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
  <xsl:template match="commentStatus/brexDmRef">
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
  <xsl:template match="commentAddressItems/issueDate">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
	  <xsl:call-template name="first"></xsl:call-template>
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
	  <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="dispatchAddress">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_address','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
	  <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="enterprise">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_enterprise','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="enterprise/enterpriseName">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_enterprise_name','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="enterpriseUnit">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_enterprise_unit','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="division">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_division','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="address">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_address','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="department">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_department','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="street">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_street','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="postOfficeBox">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_post_office_box','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="postalZipCode">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_postal_zip_code','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="city">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_city','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="country">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_country','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="state">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_state','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="province">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_province','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="building">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_building','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="room">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_room','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="SITA">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sita','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="phoneNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_phone_number','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@contactRole">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text>) </xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="faxNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_fax_number','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="email">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_email_address','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="internet">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_internet_address','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dispatchPerson">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_dnn_dispatch_person','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@contactPrefix">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text>) </xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="lastName">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_lastname','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="middleName">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_middlename','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="firstName">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_firstname','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="jobTitle">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_jobtitle','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="commentContent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment','comment.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
	  <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="commentPriority">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_priority','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@commentPriorityCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'commentPriorityCode',.)"></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="commentResponse">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_response','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@responseType">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'responseType',.)"></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="commentOriginator">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_originator','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
	  <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="commentRefs">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_references','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="noReferences">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_no','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" FontWeight="Bold">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>	  
	    <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dmlRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_dml_ref_group','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
	  <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="dmlRef">
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
  <xsl:template match="dmlCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>		
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
          <xsl:apply-templates select="@receiverIdent"></xsl:apply-templates>
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
  <xsl:template match="@dmlType|@receiverIdent">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="dmRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_dm_ref_group','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
	   <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="pmRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_pm_ref_group','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
	   <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="ddnRefGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_ddn_ref_group','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
	   <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="ddnRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_comment_ddn_ref','comment.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="ddnCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
	  <xsl:call-template name="first"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='modelIdentCode')">
          <xsl:apply-templates select="@modelIdentCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='senderIdent')">
          <xsl:apply-templates select="@senderIdent"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='receiverIdent')">
          <xsl:apply-templates select="@receiverIdent"></xsl:apply-templates>
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
  <xsl:template match="attachmentRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comment_reference_to_attachment','comment.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
	    <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@attachmentNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@fileExtension">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text>.</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
</xsl:stylesheet>