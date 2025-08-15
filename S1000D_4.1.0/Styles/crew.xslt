<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="crew">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_crew','crew.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="crewRefCard">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_crew_ref_card','crew.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="descrCrew">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_description_crew','crew.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="crewDrill">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,2,0,2">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='drillType')">
          <xsl:apply-templates select="@drillType"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_crew_drill','crew.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='drillType')">
          <xsl:apply-templates select="@*[local-name()!='drillType']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="subCrewDrill">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14" Margin="0,2,0,2">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='drillType')">
          <xsl:apply-templates select="@drillType"></xsl:apply-templates>
        </Span>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_sub_crew_drill','crew.xslt')"></xsl:value-of>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='drillType')">
          <xsl:apply-templates select="@*[local-name()!='drillType']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="crewDrillStep">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" FontSize="14" FontWeight="Bold" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$autoTextColor}">
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" Template="crewNumber" Context="Self"></Attribute>
          </Update>
          <Run>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_sub_drill_step','crew.xslt')"></xsl:value-of>
          </Run>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" FontSize="14" Foreground="{$textColor}" FontWeight="Normal" Margin="80,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Section>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="crew//title">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test="parent::crewDrill or parent::crewRefCard">
            <xsl:attribute name="FontSize">16</xsl:attribute>
          </xsl:when>
          <xsl:when test="parent::crewDrill">
            <xsl:attribute name="FontSize">14</xsl:attribute>
          </xsl:when>
        </xsl:choose>
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="challengeAndResponse">
    <Table Width="100" BorderCollapse="False">
      <xsl:call-template name="idtemplate" />
      <Column Width="1"></Column>
      <Column Width="1"></Column>
      <TableGroup>
        <Row>
          <Entry Padding="0" BorderThickness="0,0,0,1" BorderBrush="None" VerticalAlignment="Top">
			  <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()='challenge')">
                <xsl:apply-templates select="challenge"></xsl:apply-templates>
		      </Paragraph>
          </Entry>
          <Entry Padding="0" RowSpan="1" VerticalAlignment="Top">
			  <Paragraph Id="ChildrenNodesContainer" Test="boolean(local-name()!='challenge')">
				  <xsl:apply-templates select="*[local-name()!='challenge']"></xsl:apply-templates>
			  </Paragraph>
          </Entry>
        </Row>
        <Row>
          <Entry Padding="0"></Entry>
		  <Entry Padding="0"></Entry>
        </Row>
      </TableGroup>
    </Table>
  </xsl:template>
  <xsl:template match="challenge|response">
    <Span>
      <xsl:call-template name="idtemplate" />
	  <xsl:call-template name="before"></xsl:call-template>
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
  <xsl:template match="crewMemberGroup">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='actionResponsibility')">
        <xsl:apply-templates select="@*[local-name()!='actionResponsibility']"></xsl:apply-templates>
      </Span>
      <Span FontSize="14" Foreground="{$autoTextColor}">
        <Run>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_crew_member_group','crew.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
      </Span>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='actionResponsibility')">
        <xsl:apply-templates select="@actionResponsibility"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>	  
	  <xsl:call-template name="after"></xsl:call-template>	
    </Span>
  </xsl:template>
  <xsl:template match="crewMember">
    <Span>
      <xsl:call-template name="idtemplate" />
	  <xsl:call-template name="before"></xsl:call-template>
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
  <xsl:template match="crewProcedureName">
    <Span>
      <xsl:call-template name="idtemplate" />
	  <xsl:call-template name="before"></xsl:call-template>
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
  <xsl:template match="if">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_if','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>	  
	  <xsl:call-template name="after"></xsl:call-template>		
    </Span>
  </xsl:template>
  <xsl:template match="elseIf">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_elseif','crew.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>	  
	  <xsl:call-template name="after"></xsl:call-template>		
    </Span>
  </xsl:template>
  <xsl:template match="case">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_case','crew.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>	  
	  <xsl:call-template name="after"></xsl:call-template>		
    </Span>
  </xsl:template>
  <xsl:template match="@drillType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:attribute name="Foreground">#<xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'drillType',.)"></xsl:value-of></xsl:attribute>
        <xsl:text>◉ </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@orderedStepsFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontWeight="Normal">
        <xsl:text>  ◉ </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_ordered_steps_flag','crew.xslt')"></xsl:value-of>
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
        <xsl:text>&#160;</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@actionResponsibility">
    <Span Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <Run FontWeight="Normal">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_action_responsibility','crew.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='all'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_crew_all','crew.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='any'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_any','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
      <Run FontWeight="Normal">]</Run>
    </Span>
  </xsl:template>
</xsl:stylesheet>