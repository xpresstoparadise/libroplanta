<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:variable name="autoTextColor" select="'#2a579a'"></xsl:variable>
  <xsl:variable name="autoTextColorDark" select="'#1a355e'"></xsl:variable>
  <xsl:variable name="textColor" select="'Black'"></xsl:variable>
  <xsl:variable name="noteColor" select="'OrangeRed'"></xsl:variable>
  <xsl:variable name="refColor" select="'Blue'"></xsl:variable>
  <xsl:variable name="warningColor" select="'Red'"></xsl:variable>
  <xsl:variable name="elements">
    <root>
      <element name="listItemTerm" type="block" pretext="T" margin="20,0,0,0"></element>
      <element name="listItemDefinition" type="block" pretext="D" margin="20,0,0,0"></element>
    </root>
  </xsl:variable>
  <xsl:variable name="doc_language">
    <xsl:choose>
      <xsl:when test="/dmodule">
        <xsl:value-of select="/dmodule/identAndStatusSection/dmAddress/dmIdent/language/@languageIsoCode" />
      </xsl:when>
      <xsl:when test="/pm">
        <xsl:value-of select="/pm/identAndStatusSection/pmAddress/pmIdent/language/@languageIsoCode" />
      </xsl:when>
      <xsl:when test="/scormContentPackage">
        <xsl:value-of select="/scormContentPackage/identAndStatusSection/scormContentPackageAddress/scormContentPackageIdent/language/@languageIsoCode" />
      </xsl:when>
      <xsl:when test="/ddn">
        <xsl:value-of select="xef:GetAppLanguage()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/dml">
        <xsl:value-of select="xef:GetAppLanguage()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/comment">
        <xsl:value-of select="xef:GetAppLanguage()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/icnMetadataFile">
        <xsl:value-of select="xef:GetAppLanguage()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/dataUpdateFile">
        <xsl:value-of select="/dataUpdateFile/updateIdentAndStatusSection/updateAddress/updateIdent/language/@languageIsoCode"></xsl:value-of>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:variable name="doc_country">
    <xsl:choose>
      <xsl:when test="/dmodule">
        <xsl:value-of select="/dmodule/identAndStatusSection/dmAddress/dmIdent/language/@countryIsoCode" />
      </xsl:when>
      <xsl:when test="/pm">
        <xsl:value-of select="/pm/identAndStatusSection/pmAddress/pmIdent/language/@countryIsoCode" />
      </xsl:when>
      <xsl:when test="/scormContentPackage">
        <xsl:value-of select="/scormContentPackage/identAndStatusSection/scormContentPackageAddress/scormContentPackageIdent/language/@countryIsoCode" />
      </xsl:when>
      <xsl:when test="/ddn">
        <xsl:value-of select="xef:GetAppCountry()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/dml">
        <xsl:value-of select="xef:GetAppCountry()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/comment">
        <xsl:value-of select="xef:GetAppCountry()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/icnMetadataFile">
        <xsl:value-of select="xef:GetAppCountry()"></xsl:value-of>
      </xsl:when>
      <xsl:when test="/dataUpdateFile">
        <xsl:value-of select="/dataUpdateFile/updateIdentAndStatusSection/updateAddress/updateIdent/language/@countryIsoCode"></xsl:value-of>
      </xsl:when>
    </xsl:choose>
  </xsl:variable>
  <xsl:template match="rdf:*|dc:*">
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
  <xsl:template match="@xlink:*"></xsl:template>
  <xsl:template match="@*">
    <Root></Root>
  </xsl:template>
  <xsl:template match="/">
    <Root>
      <Section LineHeight="1.3" VerticalAlignment="Bottom" FontSize="14">
        <xsl:call-template name="idtemplate" />
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
      </Section>
    </Root>
  </xsl:template>
  <xsl:template match="/dmodule">
    <Section LineHeight="1.3" FontSize="14">
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Right" Foreground="{$autoTextColorDark}" FontWeight="Bold">
        <xsl:call-template name="beforeSetInline"></xsl:call-template>
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
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="*">
    <xsl:choose>
      <xsl:when test="    self::dmAddress|    self::dmAddressItems|    self::identAndStatusSection|    self::dataRestrictions|    self::restrictionInstructions|    self::copyrightPara|    self::copyright|    self::definitionList|    self::displayText">
        <xsl:call-template name="block"></xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="inline"></xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="block">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template name="inline">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="dmIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_data_module_code','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="identExtension">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$autoTextColorDark}" FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='extensionProducer')">
          <xsl:apply-templates select="@extensionProducer"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='extensionCode')">
          <xsl:apply-templates select="@extensionCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="dmCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
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
  <xsl:template match="  @extensionProducer|   @extensionCode|   @modelIdentCode|  @systemDiffCode|  @systemCode|  @subSystemCode|  @subSubSystemCode|  @assyCode|  @disassyCode|  @disassyCodeVariant|  @infoCode|  @infoCodeVariant|  @itemLocationCode|  @learnCode|  @learnEventCode|  @pmIssuer|  @pmNumber|  @pmVolume">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="pmCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Foreground="{$refColor}" FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='modelIdentCode')">
          <xsl:apply-templates select="@modelIdentCode"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='pmIssuer')">
          <xsl:apply-templates select="@pmIssuer"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='pmNumber')">
          <xsl:apply-templates select="@pmNumber"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='pmVolume')">
          <xsl:apply-templates select="@pmVolume"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@itemLocationCode|@learnCode|@learnEventCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="dmIdent/language">
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
  <xsl:template match="language">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:text> / </xsl:text>
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
    </Span>
  </xsl:template>
  <xsl:template match="@displayCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text> / </xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="@languageIsoCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@countryIsoCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="dmIdent/issueInfo">
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
  <xsl:template match="issueInfo">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run>
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issue_information','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='issueNumber')">
          <xsl:apply-templates select="@issueNumber"></xsl:apply-templates>
        </Span>
        <Span>
          <Run>
            <Update>
              <Text XPath="if (@inWork) then '-' else ''" Context="Self"></Text>
            </Update>
          </Run>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='inWork')">
          <xsl:apply-templates select="@inWork"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@issueNumber">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@inWork">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="dmAddressItems/dmTitle">
    <Paragraph TextAlignment="Center" FontWeight="Bold" FontSize="18">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="dmRefAddressItems/dmTitle">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">]</Run>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="pmRefAddressItems/pmTitle">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">]</Run>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="pmRefAddressItems/shortPmTitle">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">]</Run>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="behavior">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_link_show','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='linkShow')">
        <xsl:apply-templates select="@linkShow"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>&#160;</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_link_actuate','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='linkActuate')">
        <xsl:apply-templates select="@linkActuate"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">]</Run>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@linkShow|@linkActuate">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="pubMedia">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
		<xsl:text> (</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_publication_media','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
	  <Run Foreground="{$autoTextColor}">
	    <xsl:text>) </xsl:text>
      </Run>		
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@pubMediaType|@pubMediaCode|@volumeNumber|@mediaLocation">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text>-</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@pubCodingScheme">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text>&#160;</xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="externalPubTitle|shortExternalPubTitle">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">]</Run>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="techName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <Update>
          <Text XPath="if (following-sibling::infoName) then ' — ' else ''" Context="Self"></Text>
        </Update>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="infoName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <Update>
          <Text XPath="if (following-sibling::infoNameVariant) then ' — ' else ''" Context="Self"></Text>
        </Update>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="dmStatus">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issue_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@issueType">
    <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,concat('tlp_comtemp_issue_',.),'comtemp.xslt')"></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="dmStatus/sourceDmIdent">
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
  <xsl:template match="dmStatus/repositorySourceDmIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_repository_source_data_module_identification','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="logo">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="dmStatus/security">
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
      <Run>
        <Update>
          <Text XPath="if (@derivativeClassificationRefId) then ' / ' else ''" Context="Self"></Text>
        </Update>
      </Run>	
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='derivativeClassificationRefId')" FontWeight="Bold">
        <xsl:apply-templates select="@derivativeClassificationRefId"></xsl:apply-templates>
      </Span>		
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="derivativeClassification">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_derivative_classification','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="classificationActionGroup">
    <Section Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_classification_action_group','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="classificationAction">
    <Section Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_classification_action','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold" Foreground="{$autoTextColor}">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='actionIdentType')">
          <xsl:apply-templates select="@actionIdentType"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">
          <xsl:text> / </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='day')">
          <xsl:apply-templates select="@day"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='month')">
          <xsl:apply-templates select="@month"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='year')">
          <xsl:apply-templates select="@year"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="classificationActionGroup">
    <Section Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_classification_action_group','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="derivativeSource">
    <Section Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_derivative_source','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="valueAfterAction">
    <Section Margin="17,0,0,0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_value_after_action','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span FontWeight="Bold" Foreground="{$autoTextColor}">
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='actionIdentType')">
          <xsl:apply-templates select="@actionIdentType"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">
          <xsl:text> / </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='day')">
          <xsl:apply-templates select="@day"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='month')">
          <xsl:apply-templates select="@month"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='year')">
          <xsl:apply-templates select="@year"></xsl:apply-templates>
        </Span>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="classificationAction//businessUnit">
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
  <xsl:template match="classificationAction//businessUnitName">
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
  <xsl:template match="classificationAction//businessUnitAddress">
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
  <xsl:template match="classificationAction//department">
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
  <xsl:template match="classificationAction//street">
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
  <xsl:template match="classificationAction//postOfficeBox">
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
  <xsl:template match="classificationAction//postalZipCode">
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
  <xsl:template match="classificationAction//city">
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
  <xsl:template match="classificationAction//country">
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
  <xsl:template match="classificationAction//state">
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
  <xsl:template match="classificationAction//province">
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
  <xsl:template match="classificationAction//building">
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
  <xsl:template match="classificationAction//room">
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
  <xsl:template match="classificationAction//SITA">
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
  <xsl:template match="classificationAction//phoneNumber">
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
  <xsl:template match="classificationAction//@contactRole">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text>) </xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="classificationAction//faxNumber">
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
  <xsl:template match="classificationAction//email">
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
  <xsl:template match="classificationAction//internet">
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
  <xsl:template match="classificationAction//contactPerson">
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

  <xsl:template match="classificationAction//contactPersonAddress">
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
		
		
  <xsl:template match="classificationAction//@contactPrefix">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:text> (</xsl:text>
      <xsl:value-of select="."></xsl:value-of>
      <xsl:text>) </xsl:text>
    </Run>
  </xsl:template>
  <xsl:template match="classificationAction//lastName">
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
  <xsl:template match="classificationAction//middleName">
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
  <xsl:template match="classificationAction//firstName">
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
  <xsl:template match="classificationAction//jobTitle">
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
  <xsl:template match="@actionIdentType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'actionIdentType',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="security/@securityClassification">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:call-template name="idtemplate" />
        <xsl:text> [</xsl:text>  
	    <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'securityClassification',.)"></xsl:value-of>
        <xsl:text>] </xsl:text>		
    </Run>
  </xsl:template>
  <xsl:template match="security/@commercialClassification">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:call-template name="idtemplate" />
        <xsl:text> [</xsl:text>  
	    <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'commercialClassification',.)"></xsl:value-of>
        <xsl:text>] </xsl:text>		
    </Run>
  </xsl:template>
  <xsl:template match="security/@caveat">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
	  <xsl:text> [</xsl:text>
      <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'caveat',.)"></xsl:value-of>
      <xsl:text>] </xsl:text>	
    </Run>
  </xsl:template>
  <xsl:template match="security/@derivativeClassificationRefId">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:call-template name="idtemplate" />
        <Update>
          <Structure Template="derivativeClassificationRef" Context="IDRefs"></Structure>
        </Update>
    </Run>
  </xsl:template>	
  <xsl:template match="dmStatus/responsiblePartnerCompany">
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
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
    <xsl:template match="responsiblePartnerCompany[not(parent::dmStatus)]">
        <Span>
          <xsl:call-template name="idtemplate" />
          <xsl:call-template name="before"></xsl:call-template>
          <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" FontWeight="Bold">
            <xsl:apply-templates select="@*"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenNodesContainer">
            <xsl:apply-templates></xsl:apply-templates>
          </Span>
          <xsl:call-template name="afterSetInline"></xsl:call-template>
        </Span>
      </xsl:template>	
    <xsl:template match="responsiblePartnerCompany[not(parent::dmStatus)]/enterpriseName">
        <Span>
          <xsl:call-template name="idtemplate" />
          <xsl:call-template name="before"></xsl:call-template>
          <Span Id="ChildrenAttributesContainer" Foreground="{$autoTextColor}" FontWeight="Bold">
            <xsl:apply-templates select="@*"></xsl:apply-templates>
          </Span>
          <Run Foreground="{$autoTextColor}">
            <xsl:text> / </xsl:text>
          </Run>			
          <Span Id="ChildrenNodesContainer">
            <xsl:apply-templates></xsl:apply-templates>
          </Span>
          <xsl:call-template name="afterSetInline"></xsl:call-template>
        </Span>
      </xsl:template>		
  <xsl:template match="dmStatus/originator">
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
  <xsl:template match="@enterpriseCode">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="dmStatus/applicCrossRefTableRef">
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
  <xsl:template match="dmStatus/brexDmRef">
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
  <xsl:template match="applic">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_applicability','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold" Event="ApplicEditor" MouseCursor="Hand">[✎]</Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="qualityAssurance">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_quality_assurance','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="unverified">
    <Section TextIndent="27">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_unverified','idstatus.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="firstVerification">
    <Section TextIndent="27">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_first_verification','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="secondVerification">
    <Section TextIndent="27">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_second_verification','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="@verificationType">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='tabtop'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_table_top','idstatus.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='onobject'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_on_object','idstatus.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='ttandoo'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_table_top','idstatus.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_and','idstatus.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_on_object','idstatus.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
      <!-- <xsl:value-of select="."></xsl:value-of> -->
    </Run>
  </xsl:template>
  <xsl:template match="reasonForUpdate">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_reason_for_update','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Section Id="ChildrenNodesContainer" TextIndent="20">
        <xsl:apply-templates></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="identAndStatusSection//remarks">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
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
  <xsl:template match="dmAddress/dmAddressItems/issueDate|dmRefAddressItems/issueDate|pmRefAddressItems/issueDate|externalPubRefAddressItems/issueDate">
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
  <xsl:template match="externalPubIssueDate">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:if test="parent::dmRefAddressItems or parent::pmRefAddressItems or parent::externalPubRefAddressItems">
          <xsl:text> / </xsl:text>
        </xsl:if>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_issuedate','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Foreground="{$autoTextColor}">
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='day')">
          <xsl:apply-templates select="@day"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='month')">
          <xsl:apply-templates select="@month"></xsl:apply-templates>
        </Span>
        <Run Event="AttributeEditor" MouseCursor="Hand">-</Run>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()='year')">
          <xsl:apply-templates select="@year"></xsl:apply-templates>
        </Span>
      </Span>
      <Span>
        <Run>
          <xsl:text> </xsl:text>
        </Run>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <Span>
        <Run>
          <xsl:text> </xsl:text>
        </Run>
      </Span>		
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@day">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@month">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="@year">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand">
      <xsl:call-template name="idtemplate" />
      <xsl:value-of select="."></xsl:value-of>
    </Run>
  </xsl:template>
  <xsl:template match="refs/*">
    <Section LineHeight="1.3" VerticalAlignment="Bottom" FontSize="14">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>		
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="  simplePara|   simpleRefPara|  notePara|  warningAndCautionPara|  attentionListItemPara|  restrictionInstructions|  restrictionInfo|  dataDistribution|  dataHandling|  dataDestruction|  dataDisclosure|  dataConds|  policyStatement|  captionText|  captionLine|  supersedure|  exportRegistrationCode">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <xsl:choose>
          <xsl:when test="self::restrictionInstructions">
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_restriction_instructions','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::restrictionInfo">
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_restriction_information','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::dataDistribution">
            <Run Foreground="{$noteColor}">
              <xsl:text>▣ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_distribution','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::dataHandling">
            <Run Foreground="{$noteColor}">
              <xsl:text>▣ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_handling','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::dataDestruction">
            <Run Foreground="{$noteColor}">
              <xsl:text>▣ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_destruction','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::dataDisclosure">
            <Run Foreground="{$noteColor}">
              <xsl:text>▣ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_disclosure','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::dataConds">
            <Run Foreground="{$noteColor}">
              <xsl:text>▣ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_data_conditions','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::policyStatement">
            <Run Foreground="{$noteColor}">
              <xsl:text>▣ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_policy_reference','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::supersedure">
            <Run Foreground="{$noteColor}">
              <xsl:text>▣ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_supersedure','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
          <xsl:when test="self::exportRegistrationCode">
            <Run Foreground="{$autoTextColor}">
              <xsl:text>‒ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_export_registration_code','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
        </xsl:choose>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="applicRef">
    <Paragraph Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='applicIdentValue')">
        <xsl:apply-templates select="@*[local-name()!='applicIdentValue']"></xsl:apply-templates>
      </Span>
      <Span>
        <Run Foreground="{$noteColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_applic_ref','idstatus.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}" FontWeight="Bold" Event="ApplicEditor" MouseCursor="Hand">[✎]</Run>
      </Span>
      <Run>
        <xsl:text>  </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Run>
        <xsl:text>  </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='applicIdentValue')">
        <xsl:apply-templates select="@*[local-name()='applicIdentValue']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="applicRef/@applicIdentValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run>
        <xsl:text>  </xsl:text>
      </Run>
      <Paragraph Foreground="Gray" Margin="17,0,0,0">
        <Run>
          <xsl:value-of select="xef:GetApplicTextFromRep(.)"></xsl:value-of>
        </Run>
      </Paragraph>
    </Span>
  </xsl:template>
  <xsl:template match="para|reducedPara|paraBasic|reducedListItemPara">
    <Paragraph Margin="0,0,0,4">
      <xsl:if test="(parent::levelledPara or parent::proceduralStep) and preceding-sibling::*">
        <xsl:attribute name="Margin">80,0,0,4</xsl:attribute>
      </xsl:if>
      <xsl:call-template name="idtemplate" />
      <!--<Paragraph Margin="0,0,0,4">-->
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <!--<xsl:call-template name="beforeSetBlock"></xsl:call-template>-->
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
      <!--<xsl:call-template name="afterSetInline"></xsl:call-template>-->
      <!--</Paragraph>-->
    </Paragraph>
  </xsl:template>
  <!--with ident-->
  <xsl:template match="exportControl|exportRegistrationStmt">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:choose>
        <xsl:when test="self::exportControl">
          <Run Foreground="{$noteColor}">
            <xsl:text>▣ </xsl:text>
          </Run>
          <Run Foreground="{$autoTextColor}">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_export_control','idstatus.xslt')"></xsl:value-of>
          </Run>
        </xsl:when>
        <xsl:when test="self::exportRegistrationStmt">
          <Run Foreground="{$autoTextColor}">
            <xsl:text>‒ </xsl:text>
          </Run>
          <Run Foreground="{$autoTextColor}">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_export_registration_statement','idstatus.xslt')"></xsl:value-of>
            <xsl:text>: </xsl:text>
          </Run>
        </xsl:when>
      </xsl:choose>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="functionalItemCode">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <xsl:choose>
          <xsl:when test="self::functionalItemCode">
            <Run Foreground="{$noteColor}">
              <xsl:text>◉ </xsl:text>
            </Run>
            <Run Foreground="{$autoTextColor}">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_functional_item_code','idstatus.xslt')"></xsl:value-of>
              <xsl:text>: </xsl:text>
            </Run>
          </xsl:when>
        </xsl:choose>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="last"></xsl:call-template>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="systemBreakdownCode">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_system_breakdown_code','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="productSafety">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_product_safety','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="techStandard">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$noteColor}">
        <xsl:text>◉ </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_technical_standard','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="34,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="authorityInfoAndTp">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_authority_block_and_technical_publications_information','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="authorityInfo">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_authority_information','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="techPubBase">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_publication_baseline_number','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="authorityExceptions">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_authority_exceptions','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="productConfiguration">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_product_configuration','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="excludedModification">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_excluded','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="additionalModification">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_additional','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="retrofit">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_retrofit','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="modification">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_modification','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="authorityNotes">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_authority_notes','idstatus.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="@authorizationIdent">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_authority_ident','idstatus.xslt')"></xsl:value-of>
        <xsl:text> - </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@modificationType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_modification_type','idstatus.xslt')"></xsl:value-of>
        <xsl:text> - </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="evaluate">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="assert">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@andOr">
    <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".='or'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_or_for_applic','idstatus.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test=".='and'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_idstatus_and_for_applic','idstatus.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="@applicPropertyIdent">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_id','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@applicPropertyType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='prodattr'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_product_attribute','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='condition'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_condition','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@applicPropertyValues">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_values','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template name="cta">
    <xsl:variable name="cct" select="xef:GetXmlSchemaContentType2(.)"></xsl:variable>
    <xsl:variable name="cta">
      <xsl:choose>
        <xsl:when test="$cct=0 or $cct=3">
          <xsl:value-of select="1"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$cct=1 and ./node()">
          <xsl:value-of select="1"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="0"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
  </xsl:template>
  <xsl:template name="pta">
    <xsl:variable name="pct">
      <xsl:choose>
        <xsl:when test="parent::*">
          <xsl:value-of select="xef:GetXmlSchemaContentType2(parent::*)"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>1</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="pta">
      <xsl:choose>
        <xsl:when test="$pct=0 or $pct=3">
          <xsl:value-of select="1"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$pct=1 and ./node()">
          <xsl:value-of select="1"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="0"></xsl:value-of>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
  </xsl:template>
  <xsl:template name="id">
    <xsl:param name="context" />
    <xsl:for-each select="$context[1]">
      <xsl:value-of select="xef:GetId(.)"></xsl:value-of>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="idtemplate">
    <xsl:attribute name="p">
      <xsl:value-of select="xef:GetId(.)"></xsl:value-of>
    </xsl:attribute>
    <xsl:if test="xef:IsAllowedAttributeGroup(.,'changeAttGroup')">
      <Update>
        <Attribute Name="Background" XPath="if (@changeMark='1') then if (@changeType='add') then '#E0EEE0' else if (@changeType='modify') then '#D4EBF2' else 'Pink' else ''" Context="Self"></Attribute>
      </Update>
    </xsl:if>
  </xsl:template>
  <xsl:template name="idtemplateSimple">
    <xsl:attribute name="p">
      <xsl:value-of select="xef:GetId(.)"></xsl:value-of>
    </xsl:attribute>
  </xsl:template>
  <xsl:template name="changeMarksSimple">
    <xsl:if test="xef:IsAllowedAttributeGroup(.,'changeAttGroup')">
      <Update>
        <Attribute Name="Background" XPath="if (@changeMark='1') then if (@changeType='add') then '#E0EEE0' else if (@changeType='modify') then '#D4EBF2' else 'Pink' else ''" Context="Self"></Attribute>
      </Update>
    </xsl:if>
  </xsl:template>
  <xsl:template name="beforeSetInline">
    <Span>
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template name="beforeSetBlock">
    <Span Name="blockSet" FontSize="0">
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template name="afterSetInline">
    <Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template name="afterSetBlock">
    <Span Name="blockSet" FontSize="0">
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template name="before">
    <Span IsEditable="False">
      <Run cursor="Before" IsEditable="True">
        <xsl:attribute name="TextAllowed">
          <xsl:call-template name="pta"></xsl:call-template>
        </xsl:attribute>
      </Run>
      <Run Name="tagWithName" FontFamily="LPTAG" Foreground="#507DBE" FontSize="18" FontWeight="Normal" Visibility="Collapsed">(<xsl:value-of select="xef:GetName(.)"></xsl:value-of>]</Run>
      <Run Name="tagWithoutName" FontFamily="LPTAG" Foreground="#507DBE" FontSize="18" FontWeight="Normal" Visibility="Collapsed">(]</Run>
    </Span>
  </xsl:template>
  <xsl:template name="first">
    <xsl:choose>
      <xsl:when test="xef:GetXmlSchemaContentType2(self::*)=1"></xsl:when>
      <xsl:otherwise>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="cta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="last">
    <Run cursor="Last" IsEditable="True">
      <xsl:attribute name="TextAllowed">
        <xsl:call-template name="cta"></xsl:call-template>
      </xsl:attribute>
    </Run>
  </xsl:template>
  <xsl:template name="after">
    <Span IsEditable="False">
      <Run Name="endTag" FontFamily="LPTAG" Foreground="#507DBE" FontSize="18" FontWeight="Normal" Visibility="Collapsed" IsEditable="False">=</Run>
      <Run cursor="After" IsEditable="True">
        <xsl:attribute name="TextAllowed">
          <xsl:call-template name="pta"></xsl:call-template>
        </xsl:attribute>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="processing-instruction('lpStart')">
    <Span FontSize="16">
      <xsl:call-template name="idtemplate" />
      <Run cursor="Before" IsEditable="True">
        <xsl:attribute name="TextAllowed">
          <xsl:call-template name="pta"></xsl:call-template>
        </xsl:attribute>
      </Run>
      <Run Name="Comment" FontFamily="LPTAG" Event="CommentStart" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Normal">&gt;</Run>
      <Run cursor="After" IsEditable="True">
        <xsl:attribute name="TextAllowed">
          <xsl:call-template name="pta"></xsl:call-template>
        </xsl:attribute>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="processing-instruction('lpEnd')">
    <Span FontSize="16">
      <xsl:call-template name="idtemplate" />
      <Run cursor="Before" IsEditable="True">
        <xsl:attribute name="TextAllowed">
          <xsl:call-template name="pta"></xsl:call-template>
        </xsl:attribute>
      </Run>
      <Run Name="Comment" FontFamily="LPTAG" Event="CommentStart" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Normal">&lt;</Run>
      <Run cursor="After" IsEditable="True">
        <xsl:attribute name="TextAllowed">
          <xsl:call-template name="pta"></xsl:call-template>
        </xsl:attribute>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="processing-instruction()|comment()">
    <Span FontSize="0">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@*">
    <Span FontSize="0">
      <xsl:call-template name="idtemplate" />
    </Span>
  </xsl:template>
</xsl:stylesheet>