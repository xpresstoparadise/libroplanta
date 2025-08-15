<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="condCrossRefTable">
      <Paragraph TextAlignment="Center" Padding="0,15,0,0">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}" FontSize="18">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_condition_cross_reference_table','cct.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
		<Paragraph Id="ChildrenNodesContainer" TextAlignment="Left">
		  <xsl:apply-templates></xsl:apply-templates>
		</Paragraph>
		<xsl:call-template name="afterSetBlock"></xsl:call-template>        
      </Paragraph>
  </xsl:template>
  <xsl:template match="condTypeList">
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_common_types_of_conditions','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>         
      </Paragraph>
  </xsl:template>
  <xsl:template match="condList">
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_conditions','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>        
      </Paragraph>
   </xsl:template>
  <xsl:template match="incorporation">
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_incorporation','comtemp.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>        
      </Paragraph>
  </xsl:template>
  <xsl:template match="condType">
      <Paragraph Margin="0,2,0,2">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_condition_type','cct.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>  
      </Paragraph>
  </xsl:template>
  <xsl:template match="condType/name|cond/name">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_name','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="condType/descr|cond/descr">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_description','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="condType/enumeration">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_enumeration','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="cond">
      <xsl:variable name="condTypeRefId" select="@condTypeRefId"></xsl:variable>
      <Paragraph Margin="0,2,0,2">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_condition','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> (</xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_condition_type','cct.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Hyperlink Foreground="{$refColor}">
          <xsl:attribute name="IdRef">
            <xsl:call-template name="id">
              <xsl:with-param name="context" select="//*[@id=$condTypeRefId]"></xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <Span>
            <Update>
              <Structure Template="condTypeRef" Context="IDRefs"></Structure>
            </Update>
          </Span>
        </Hyperlink>
        <Run Foreground="{$autoTextColor}">)</Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  
 <xsl:template match="externalCond">
      <xsl:variable name="condTypeRefId" select="@condTypeRefId"></xsl:variable>
      <Paragraph Margin="0,2,0,2">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_external_condition','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> (</xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_condition_type','cct.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Hyperlink Foreground="{$refColor}">
          <xsl:attribute name="IdRef">
            <xsl:call-template name="id">
              <xsl:with-param name="context" select="//*[@id=$condTypeRefId]"></xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <Span>
            <Update>
              <Structure Template="condTypeRef" Context="IDRefs"></Structure>
            </Update>
          </Span>
        </Hyperlink>
        <Run Foreground="{$autoTextColor}">)</Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>  
  
  <xsl:template match="externalCond/displayName">
      <Paragraph Margin="0,2,0,2">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="last"></xsl:call-template>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
  </xsl:template>   
  
  
  <xsl:template match="enumeration/@applicPropertyValues">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_values','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="enumeration/@enumerationLabel">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_label','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="enumeration/@aliasFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_alias_flag','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='1'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_yes','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_no','comtemp.xslt')"></xsl:value-of>
          </xsl:otherwise>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="cond/refs">
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
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="cond/condRefGroup">
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_condition_ref_group','cct.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Foreground="{$textColor}" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="cond/prompt">
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_prompt','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Foreground="{$textColor}" Margin="17,0,0,0">
          <xsl:apply-templates></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="condRefGroup/condRef">
    <xsl:variable name="condRefId" select="@condRefId"></xsl:variable>
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_reference','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Hyperlink Foreground="{$refColor}">
          <xsl:attribute name="IdRef">
            <xsl:call-template name="id">
              <xsl:with-param name="context" select="//*[@id=$condRefId]"></xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <Span>
            <Update>
              <Structure Template="condRef" Context="IDRefs"></Structure>
            </Update>
          </Span>
        </Hyperlink>
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="last"></xsl:call-template>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="dependency">
      <Paragraph>
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_dependency','cct.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='forCondValues')">
          <xsl:apply-templates select="@forCondValues"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='dependencyTest')">
          <xsl:apply-templates select="@dependencyTest"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="last"></xsl:call-template>
        <xsl:call-template name="after"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="@dependencyTest">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Update>
        <Structure Template="dependencyTest" Context="Document"></Structure>
      </Update>
    </Span>
  </xsl:template>
  <xsl:template match="dependency/@forCondValues">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_values','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="condIncorporation">
    <xsl:variable name="condRefId" select="@condRefId"></xsl:variable>
      <Paragraph Margin="0,2,0,2">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>◉ </xsl:text>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_incorporation','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Run Foreground="{$autoTextColor}">
          <xsl:text> (</xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_reference','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Hyperlink Foreground="{$refColor}">
          <xsl:attribute name="IdRef">
            <xsl:call-template name="id">
              <xsl:with-param name="context" select="//*[@id=$condRefId]"></xsl:with-param>
            </xsl:call-template>
          </xsl:attribute>
          <Span>
            <Update>
              <Structure Template="condRef" Context="IDRefs"></Structure>
            </Update>
          </Span>
        </Hyperlink>
        <Run Foreground="{$autoTextColor}">
          <xsl:text>) </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="@condIssueNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_issue_number','cct.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="documentIncorporation/refs">
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
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="documentIncorporation">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_document','cct.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Foreground="{$textColor}" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="incorporationStatus">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='incorporationStatus' and local-name()!='day' and local-name()!='month' and local-name()!='year')">
        <xsl:apply-templates select="@*[local-name()!='incorporationStatus' and local-name()!='day' and local-name()!='month' and local-name()!='year']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_incorporation_status','cct.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='incorporationStatus')">
        <xsl:apply-templates select="@incorporationStatus"></xsl:apply-templates>
      </Span>
      <Run>
        <xsl:text> / </xsl:text>
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
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@incorporationStatus">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='noeffect'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_noeffect','cct.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inprogress'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_inprogress','cct.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='incorporated'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_cct_incorporated','cct.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
</xsl:stylesheet>