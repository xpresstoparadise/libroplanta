<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="checkList">
      <Paragraph Margin="0,15,0,0">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='checkListType' and local-name()!='checkListCategory' and local-name()!='worthinessLimit' and local-name()!='reduceMaint' and local-name()!='skillLevelCode' and local-name()!='skillType')">
          <xsl:apply-templates select="@*[local-name()!='checkListType' and local-name()!='checkListCategory' and local-name()!='worthinessLimit' and local-name()!='reduceMaint' and local-name()!='skillLevelCode' and local-name()!='skillType']"></xsl:apply-templates>
        </Span>
        <Paragraph TextAlignment="Center">
			<Span>
				<Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}" FontSize="18">
				  <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_check_list','checklist.xslt')"></xsl:value-of>
				</Run>
			</Span>
        </Paragraph>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='checkListType' or local-name()='checkListCategory' or local-name()='worthinessLimit' or local-name()='reduceMaint' or local-name()='skillLevelCode' or local-name()='skillType')">
          <xsl:apply-templates select="@*[local-name()='checkListType' or local-name()='checkListCategory' or local-name()='worthinessLimit' or local-name()='reduceMaint' or local-name()='skillLevelCode' or local-name()='skillType']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
		<Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
		  <xsl:apply-templates select="node()"></xsl:apply-templates>
		</Paragraph>   
		<xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="checkList//@checkListType">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_check_list_type','checklist.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="checkList//@checkListCategory">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_check_list_category','checklist.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'checkListCategory',.)"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="checkList//@worthinessLimit">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_worthiness_limitation','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='recommended'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_recommended','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='mandatory'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_mandatory','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='none'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_none','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="checkList//@reducedMaint">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_reduced_maintenance','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
 <xsl:template match="@safeFlight">
    <Span TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text> [</xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_safe_flight','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
			<xsl:when test="1">
				<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_yes','comtemp.xslt')"></xsl:value-of>
			</xsl:when>
			<xsl:when test="0">
				<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_no','comtemp.xslt')"></xsl:value-of>
			</xsl:when>			
        </xsl:choose>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>      
    </Span>
  </xsl:template>
  <xsl:template match="checkList//@skillType">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_skill_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'skillType',.)"></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="checkListInfo">
      <Paragraph Margin="0,15,0,0">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}" FontSize="18">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_check_list_information','checklist.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
		  <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
			<xsl:apply-templates select="node()"></xsl:apply-templates>
		  </Paragraph>        
		  <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="checkListInfo/title|checkListProcedure/title">
    <Span Foreground="{$textColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Foreground="{$textColor}" Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="after"></xsl:call-template>
      <xsl:call-template name="last"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="checkListIntervals">
	  <Paragraph>
		<xsl:call-template name="idtemplate" />
		<Table Width="100" BorderCollapse="False">
		  <Column Width="1"></Column>
		  <Column Width="20"></Column>
		  <Column Width="12"></Column>
		  <TableGroup>
			<Row>
			  <Entry BorderThickness="0" ColSpan="1">
				<Paragraph>
				  <xsl:call-template name="before"></xsl:call-template>
				  <Run FontWeight="Bold" Foreground="{$autoTextColor}">
					<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_check_list_intervals','checklist.xslt')"></xsl:value-of>
					<xsl:text>: </xsl:text>
				  </Run>
				  <xsl:call-template name="first"></xsl:call-template>
				</Paragraph>
			  </Entry>
			  <Entry BorderThickness="0">
				<Table Width="100" BorderCollapse="False">
				  <Column Width="1"></Column>
				  <Column Width="1"></Column>
				  <Column Width="1"></Column>
				  <Column Width="1"></Column>
				  <Column Width="1"></Column>
				  <Column Width="1"></Column>
				  <Column Width="1"></Column>
				  <TableGroup>
					<Row Id="ChildrenNodesContainer">
					  <xsl:apply-templates select="node()"></xsl:apply-templates>
					</Row>
				  </TableGroup>
				</Table>
			  </Entry>
			</Row>
		  </TableGroup>
		</Table>
		<xsl:call-template name="afterSetBlock" />
    </Paragraph>    
  </xsl:template>
  <xsl:template match="checkListInterval">
    <Entry Padding="0" BorderThickness="1" TextAlignment="Center">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Entry>
  </xsl:template>

  <xsl:template match="checkListItems">
      <Paragraph Margin="0,3,0,0">
        <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_check_list_items','checklist.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
		<Paragraph Id="ChildrenNodesContainer">
			<xsl:apply-templates select="node()"></xsl:apply-templates>
		</Paragraph> 
		<xsl:call-template name="afterSetBlock"></xsl:call-template>       
      </Paragraph>
  </xsl:template>
  <xsl:template match="workArea">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_work_area','checklist.xslt')"></xsl:value-of>
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
  <xsl:template match="checkListItem">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Table Width="100" BorderCollapse="False">
        <Column Width="1"></Column>
        <Column Width="20"></Column>
        <Column Width="12"></Column>
        <TableGroup>
          <Row>
            <Entry BorderThickness="0">
              <Paragraph>
                <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='itemNumber')">
                  <xsl:apply-templates select="itemNumber"></xsl:apply-templates>
                </Span>
              </Paragraph>
            </Entry>
            <Entry BorderThickness="0">
              <Paragraph>
                <Span Id="ChildrenNodesContainer" Test="boolean(local-name()!='itemNumber' and local-name()!='threshold')">
                  <xsl:apply-templates select="*[local-name()!='itemNumber' and local-name()!='threshold']"></xsl:apply-templates>
                </Span>
              </Paragraph>
            </Entry>
            <Entry BorderThickness="0">
              <Table Width="100" BorderCollapse="False">
                <Column Width="1"></Column>
                <Column Width="1"></Column>
                <Column Width="1"></Column>
                <Column Width="1"></Column>
                <Column Width="1"></Column>
                <Column Width="1"></Column>
                <Column Width="1"></Column>
                <TableGroup>
                  <Row Id="ChildrenNodesContainer" Test="boolean(local-name()='threshold')">
                    <xsl:apply-templates select="threshold"></xsl:apply-templates>
                  </Row>
                </TableGroup>
              </Table>
            </Entry>
          </Row>
        </TableGroup>
      </Table>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  
  <xsl:template match="threshold">
    <Entry Padding="0" BorderThickness="1" TextAlignment="Center">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="beforeSetBlock"></xsl:call-template>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>         
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Entry>
  </xsl:template>
  
  <xsl:template match="checkList//@thresholdType"></xsl:template>   
  
  <xsl:template match="checkList//@thresholdUnitOfMeasure">
    <Span Foreground="{$autoTextColor}" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
      <xsl:call-template name="idtemplate" />
      <Run><xsl:text> </xsl:text></Run>
      <Run>
		<Update>
			<Structure Template="checkListInterval" Context="IDRefs"></Structure>
		</Update>
      </Run>
    </Span>
  </xsl:template>  
  
  <xsl:template match="itemNumber">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="checkListProcedure">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_check_list_procedure','checklist.xslt')"></xsl:value-of>
      </Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>      
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="equipmentNotAvailable">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run FontWeight="Bold" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_checklist_equipment_not_ready_available_if','checklist.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  
<xsl:template match="checkListPara">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
	  <Span Id="ChildrenAttributesContainer">
		<xsl:apply-templates select="@*" />
	  </Span>   
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}" FontWeight="Normal">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>  
  
  <xsl:template match="checkListStep">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$autoTextColor}">
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" Template="checkListStepNumber" Context="Self"></Attribute>
          </Update>
          <Span Id="ChildrenNodesContainer" Test="boolean(not(preceding-sibling::*))" FontWeight="Normal" Foreground="{$textColor}">
            <xsl:apply-templates select="*[not(preceding-sibling::*)]"></xsl:apply-templates>
          </Span>
          <Span Id="ChildrenAttributesContainer">
            <xsl:apply-templates select="@*" />
          </Span>
        </ListItem>
      </List>
      <Paragraph Id="ChildrenNodesContainer" Test="boolean(preceding-sibling::*)" Foreground="{$textColor}" FontWeight="Normal" Margin="80,0,0,0">
        <xsl:apply-templates select="*[preceding-sibling::*]"></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="checkListItems//refs">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="17,0,0,0">
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
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="checkListItem/name">
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
        <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="afterSetInline"></xsl:call-template>
      </Paragraph>
  </xsl:template>
  <xsl:template match="equip">
      <Paragraph>
         <xsl:call-template name="idtemplate" />
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_equipment','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
          <xsl:apply-templates select="node()"></xsl:apply-templates>
        </Paragraph>
        <xsl:call-template name="afterSetBlock"></xsl:call-template>
      </Paragraph>
  </xsl:template>
</xsl:stylesheet>