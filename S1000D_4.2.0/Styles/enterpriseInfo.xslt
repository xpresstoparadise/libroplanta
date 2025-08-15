<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="frontMatter//enterpriseSpec|sb//enterpriseSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_manufacturer','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="commonRepository//enterpriseSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_enterpriseInfo_enterprise_specification','enterpriseInfo.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="enterpriseInfo">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='locallySuppliedFlag')">
          <xsl:apply-templates select="@*[local-name()!='locallySuppliedFlag']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_enterpriseInfo_enterprise_specification','enterpriseInfo.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='locallySuppliedFlag')">
          <xsl:apply-templates select="@locallySuppliedFlag"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@locallySuppliedFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> - </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_enterpriseInfo_locally_purchased','enterpriseInfo.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="enterpriseSpec">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_manufacturer','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="enterpriseIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_enterpriseInfo_enterprise_identification','enterpriseInfo.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='manufacturerCodeValue')">
          <xsl:apply-templates select="@*[local-name()!='manufacturerCodeValue']"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='manufacturerCodeValue')">
          <xsl:apply-templates select="@manufacturerCodeValue"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="enterpriseIdentAlt">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_enterpriseInfo_alternate_enterprise_identification','enterpriseInfo.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='altCode')">
          <xsl:apply-templates select="@*[local-name()='altCode']"></xsl:apply-templates>
        </Span>
        <Span>
          <Run>
            <xsl:text> / </xsl:text>
          </Run>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='altCodeType')">
          <xsl:apply-templates select="@altCodeType"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@altCode|@altCodeType">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="enterpriseSpec/enterpriseName">
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
  <xsl:template match="enterpriseSpec/shortName">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_short_name','comtemp.xslt')"></xsl:value-of>
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
  <xsl:template match="businessUnit">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_business_unit','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="businessUnitName">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_business_unit_name','comtemp.xslt')"></xsl:value-of>
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
  <xsl:template match="businessUnitAddress">
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
  <xsl:template match="contactPerson">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_contact_person','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="contactPersonAddress">
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
  <xsl:template match="enterpriseSpec/enterpriseRef">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='manufacturerCodeValue')">
          <xsl:apply-templates select="@*[local-name()!='manufacturerCodeValue']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_enterprise_ref','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='manufacturerCodeValue')">
          <xsl:apply-templates select="@manufacturerCodeValue"></xsl:apply-templates>
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
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="enterpriseSpec/refs">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_references','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
</xsl:stylesheet>