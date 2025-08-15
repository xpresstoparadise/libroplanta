<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:import href="partInfo.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="illustratedPartsCatalog">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_illustrated_parts_catalog','ipd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="catalogSeqNumber/internalRef">
    <Span>
      <xsl:call-template name="idtemplateSimple" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_internal_refs','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Hyperlink>
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
    </Span>
  </xsl:template>
  <xsl:template match="initialProvisioningProject">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,2,0,2">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}" FontSize="16">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_initial_provisioning_project_information','ipd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenAttributesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="34,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@initialProvisioningProjectNumber[not(parent::catalogSeqNumberRef)]">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_ipp_number','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@initialProvisioningProjectNumberSubject">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_ipp_subject','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@fileIdent">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_ipp_file_identifier','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='s'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_complete','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='t'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_component','ipd.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="initialProvisioningProject/@languageCode">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_ipp_language','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="subjectVariantSegment">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_s2000m_vas_segment','ipd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="subjectIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_subject_identification','ipd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="zoneGroup">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_zone_group','ipd.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="catalogSeqNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <Update>
          <Attribute Name="Margin" XPath="concat((if (@indenture='') then 1 else @indenture) * 5,',0,0,0')" Context="Self"></Attribute>
        </Update>
        <Paragraph FontSize="14" Margin="0,1,0,1">
          <xsl:call-template name="before"></xsl:call-template>
			<Span>
				<Run FontWeight="Bold" Foreground="{$noteColor}">
                    <Update>
						 <Text XPath="string-join(for $d in (1 to @indenture) return '◉', '')" Context="Self"></Text>
                    </Update>			
			    </Run>
				<Run><xsl:text>&#160;</xsl:text></Run>
			</Span>	
          <Span Foreground="{$refColor}" FontWeight="Bold">
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
            <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='item')">
              <xsl:apply-templates select="@item"></xsl:apply-templates>
            </Span>
            <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='itemVariant')">
              <xsl:apply-templates select="@itemVariant"></xsl:apply-templates>
            </Span>
          </Span>
          <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="      boolean(local-name()!='systemCode' and       local-name()!='subSystemCode' and       local-name()!='subSubSystemCode' and       local-name()!='assyCode' and       local-name()!='figureNumber' and       local-name()!='figureNumberVariant' and       local-name()!='item' and       local-name()!='itemVariant')">
            <xsl:apply-templates select="@*[local-name()!='systemCode' and       local-name()!='subSystemCode' and       local-name()!='subSubSystemCode' and       local-name()!='assyCode' and       local-name()!='figureNumber' and       local-name()!='figureNumberVariant' and       local-name()!='item' and       local-name()!='itemVariant' and       local-name()!='indenture']"></xsl:apply-templates>
          </Span>
          <Run Foreground="{$autoTextColorDark}" FontWeight="Bold">
            <xsl:text> - </xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_catalog_seq_number','ipd.xslt')"></xsl:value-of>
          </Run>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='indenture')">
            <xsl:apply-templates select="@indenture"></xsl:apply-templates>
          </Span>
          <xsl:call-template name="first"></xsl:call-template>
        </Paragraph>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@indenture">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_indenture','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="itemSeqNumber">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <Paragraph FontSize="14" Margin="0,1,0,1">
          <xsl:call-template name="before"></xsl:call-template>
          <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='itemSeqNumberValue']">
            <xsl:apply-templates select="@*[local-name()!='itemSeqNumberValue']"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='itemSeqNumberValue')">
            <xsl:apply-templates select="@itemSeqNumberValue"></xsl:apply-templates>
          </Span>
          <Run Foreground="{$autoTextColor}">
            <xsl:text> - </xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_item_seq_number','ipd.xslt')"></xsl:value-of>
          </Run>
          <xsl:call-template name="first"></xsl:call-template>
        </Paragraph>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@itemSeqNumberValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="reasonForSelection">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='reasonForSelectionValue']">
          <xsl:apply-templates select="@*[local-name()!='reasonForSelectionValue']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_reason_for_selection','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='reasonForSelectionValue')">
          <xsl:apply-templates select="@reasonForSelectionValue"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@reasonForSelectionValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='0'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_0','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='1'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_1','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='2'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_2','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='3'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_3','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='4'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_4','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='5'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_5','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='6'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_6','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='7'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_7','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='8'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_8','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='9'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_rfs_9','ipd.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="quantityPerNextHigherAssy">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_quantity_per_next_higher_assy','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="totalQuantity">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_total_quantity','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="removalOrInstallationQuantity">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="boolean(local-name()!='reasonForSelectionValue']">
        <xsl:apply-templates select="@*[local-name()!='reasonForSelectionValue']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_removal_or_installation_quantity','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='reasonForSelectionValue')">
        <xsl:apply-templates select="@reasonForSelectionValue"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="partSegment">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_part_segment','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="partLocationSegment">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_part_location_segment','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="attachStoreShipPart">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='attachStoreShipPartCode')">
          <xsl:apply-templates select="@*[local-name()!='attachStoreShipPartCode']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_attach_store_ship_part','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='attachStoreShipPartCode')">
          <xsl:apply-templates select="@attachStoreShipPartCode"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@attachStoreShipPartCode">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='1'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_aspc1','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='2'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_aspc2','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='3'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_aspc3','ipd.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="notIllustrated">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_not_illusrtated','ipd.xslt')"></xsl:value-of>
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
  <xsl:template match="referTo">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='refType')">
          <xsl:apply-templates select="@*[local-name()!='refType']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_refer_to_long','ipd.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='refType')">
          <xsl:apply-templates select="@refType"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Foreground="{$textColor}" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@refType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'refType',.)"></xsl:value-of>
        <xsl:text>]</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="initialProvisioningProjectRef">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="selectOrManufactureFromIdent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='selectOrManufactureValue')">
          <xsl:apply-templates select="@*[local-name()!='selectOrManufactureValue']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_select_or_manufacture_from_ident','ipd.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='selectOrManufactureValue')">
          <xsl:apply-templates select="@selectOrManufactureValue"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@selectOrManufactureValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:choose>
          <xsl:when test=".='f'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_somv_f','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='t'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_somv_t','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='m'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_somv_m','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='r'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_somv_r','ipd.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='p'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_somv_p','ipd.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
        <xsl:text>]</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="selectOrManufacture">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"/>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"/>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"/>
      <xsl:call-template name="after"/>
    </Span>
  </xsl:template>
  <xsl:template match="descrForLocation">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_replacement_cond','comtemp.xslt')"></xsl:value-of>
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
  <xsl:template match="@installationLocationType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'installationLocationType',.)"></xsl:value-of>
        <xsl:text>]</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="applicabilitySegment">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_applicability_segment','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="usableOnCodeEquip">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_usable_on_code_equip','ipd.xslt')"></xsl:value-of>
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
  <xsl:template match="usableOnCodeAssy">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_usable_on_code_assy','ipd.xslt')"></xsl:value-of>
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
  <xsl:template match="restrictedOperationNote">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='operationType')">
        <xsl:apply-templates select="@*[local-name()!='operationType']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_restricted_operation_note','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='operationType')">
        <xsl:apply-templates select="@*[local-name()='operationType']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@operationType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'operationType',.)"></xsl:value-of>
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="interchangeability">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_interchangeability','comtemp.xslt')"></xsl:value-of>
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
  <xsl:template match="categoryOneContainerLocation">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold" Test="      boolean(local-name()!='systemCode' and       local-name()!='subSystemCode' and       local-name()!='subSubSystemCode' and       local-name()!='assyCode' and       local-name()!='figureNumber' and       local-name()!='figureNumberVariant' and       local-name()!='item' and       local-name()!='itemVariant')">
          <xsl:apply-templates select="@*[local-name()!='systemCode' and       local-name()!='subSystemCode' and       local-name()!='subSubSystemCode' and       local-name()!='assyCode' and       local-name()!='figureNumber' and       local-name()!='figureNumberVariant' and       local-name()!='item' and       local-name()!='itemVariant' and       local-name()!='indenture']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_category_one_container_location','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Foreground="{$refColor}" FontWeight="Bold">
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
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='item')">
            <xsl:apply-templates select="@item"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='itemVariant')">
            <xsl:apply-templates select="@itemVariant"></xsl:apply-templates>
          </Span>
        </Span>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="locationRcmdSegment">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_location_recommendation_segment','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="locationRcmd">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_location_recommendation','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="service">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_service','ipd.xslt')"></xsl:value-of>
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
  <xsl:template match="sourceMaintRecoverability">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_source_maint_recoverability','ipd.xslt')"></xsl:value-of>
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
  <xsl:template match="modelVersion">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='modelVersionValue')">
          <xsl:apply-templates select="@*[local-name()!='modelVersionValue']"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_model_version','ipd.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='modelVersionValue')">
          <xsl:apply-templates select="@modelVersionValue"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@modelVersionValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>]</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="effectivity">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_effectivity','ipd.xslt')"></xsl:value-of>
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
  <xsl:template match="functionalItemRef">
    <Paragraph VerticalAlignment="Bottom" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_item_ref','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:apply-templates select="@functionalItemNumber"></xsl:apply-templates>
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
  </xsl:template>
  <xsl:template match="ilsNumber">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_ils_number','ipd.xslt')"></xsl:value-of>
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
  <xsl:template match="changeAuthorityData">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_change_authority_data','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="changeAuthority">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_change_authority','comtemp.xslt')"></xsl:value-of>
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
  <xsl:template match="genericPartDataGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_generic_part_data_group','ipd.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="genericPartData">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_generic_part_data','ipd.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
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
  <xsl:template match="genericPartDataValue">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_ipd_generic_part_data_value','ipd.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer">
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
  <xsl:template match="@genericPartDataName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>]:</xsl:text>
      </Run>
    </Span>
  </xsl:template>
</xsl:stylesheet>