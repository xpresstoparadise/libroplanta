<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="process">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_process','process.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="10,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="variableDeclarations">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_variable_declarations','process.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="variable">
    <Span VerticalAlignment="Bottom" Foreground="{$autoTextColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_variable','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='variableName')">
        <xsl:apply-templates select="@variableName"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='variableName')">
        <xsl:apply-templates select="@*[local-name()!='variableName']"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer" Foreground="{$textColor}">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template match="@variableName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="variable/@variableDescr">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_description','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="variable/@productConfigurationFlag">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_configuration_of_product','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="variable/@valueType">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_type','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='boolean'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_boolean','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='string'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_string','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='real'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_real','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='integer'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_integer','comtemp.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='set-string'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_set','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='set-real'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_real_set','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='set-integer'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_integer_set','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="variable/@valuePrecision">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_precision','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="variable/@valueScope">
    <Paragraph Margin="17,0,0,0" TextAlignment="Left">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_scope','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='local'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_local','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Paragraph>
  </xsl:template>
  <xsl:template match="variablePreSet">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_variable_preset','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="variablePostSet">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_variable_postset','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="process/dmSeq">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_data_module_sequence','process.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="dmSeq">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_data_module_sequence','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dmNodeAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_data_module_node_alts','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dmNode">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_data_module_node','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="externalApplication">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='application')">
          <xsl:apply-templates select="@*[local-name()!='application']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:text>☀ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_external_application','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='application')">
          <xsl:apply-templates select="@application"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@application">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="paraBasic">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_para_basic','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="send">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_external_application_send','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="receiveValue">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_external_application_receive_value','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="receiveByName">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_external_application_receive_by_name','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="returnedValueName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_external_application_returned_value_name','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="receiveByPosition">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_external_application_receive_by_position','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="returnedValuePosition">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_external_application_returned_value_position','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
      </Run>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="messageAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='altsName')">
          <xsl:apply-templates select="@*[local-name()!='altsName']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_message_alts','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='altsName')">
          <xsl:apply-templates select="@*[local-name()='altsName']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@altsName">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="message">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='submitCaption' and local-name()!='cancelCaption')">
          <xsl:apply-templates select="@*[local-name()!='submitCaption' and local-name()!='cancelCaption']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_message','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='submitCaption' or local-name()='cancelCaption')">
          <xsl:apply-templates select="@*[local-name()='submitCaption' or local-name()='cancelCaption']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@submitCaption">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_submit_caption','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'submitCaption',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@cancelCaption">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_cancel_caption','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'cancelCaption',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@resetCaption">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_reset_caption','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'resetCaption',.)"></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="prompt">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_message_dialog_prompt','process.xslt')"></xsl:value-of>
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
  <xsl:template match="@textDisplayPosition">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_text_display_position','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='top'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_text_display_position_top','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='bottom'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_text_display_position_bottom','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='right'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_text_display_position_right','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='left'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_text_display_position_left','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="title">
    <Paragraph>
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
    </Paragraph>
  </xsl:template>
  <xsl:template match="dialogAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='altsName')">
          <xsl:apply-templates select="@*[local-name()!='altsName']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_dialog_alts','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='altsName')">
          <xsl:apply-templates select="@*[local-name()='altsName']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dialog">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='submitCaption' and local-name()!='cancelCaption' and local-name()!='resetCaption')">
          <xsl:apply-templates select="@*[local-name()!='submitCaption' and local-name()!='cancelCaption' and local-name()!='resetCaption']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:text>▦ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_dialog','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='submitCaption' or local-name()='cancelCaption' or local-name()='resetCaption')">
          <xsl:apply-templates select="@*[local-name()='submitCaption' or local-name()='cancelCaption' or local-name()='resetCaption']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dialogGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='dialogSeparator')">
          <xsl:apply-templates select="@*[local-name()!='dialogSeparator']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_dialog_group','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='dialogSeparator')">
          <xsl:apply-templates select="@*[local-name()='dialogSeparator']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@dialogSeparator">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_dialog_separator','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="userEntry">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='mandatory' and local-name()!='dataEntryFieldLength')">
          <xsl:apply-templates select="@*[local-name()!='mandatory' and local-name()!='dataEntryFieldLength']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:text>▶ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_user_entry','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='mandatory' or local-name()='dataEntryFieldLength')">
          <xsl:apply-templates select="@*[local-name()='mandatory' or local-name()='dataEntryFieldLength']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@mandatory">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_mandatory','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@dataEntryFieldLength">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_data_entry_field_length','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="default">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_process_default','process.xslt')"></xsl:value-of>
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
  <xsl:template match="validate">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='errorMessage')">
        <xsl:apply-templates select="@*[local-name()!='errorMessage']"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_process_validate','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='errorMessage')">
        <xsl:apply-templates select="@*[local-name()='errorMessage']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@errorMessage">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">[<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_error_message','process.xslt')"></xsl:value-of><xsl:text>: </xsl:text></Run>
      <Run Foreground="{$noteColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run Foreground="{$autoTextColor}">
        <xsl:text>] </xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="pushButton">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:text>▣ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_push_button','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="enabledState">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_enabled_state','process.xslt')"></xsl:value-of>
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
  <xsl:template match="menu">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='mandatory' and local-name()!='choiceSelection' and local-name()!='choiceType' and local-name()!='menuChoiceFlow')">
          <xsl:apply-templates select="@*[local-name()!='mandatory' and local-name()!='choiceSelection' and local-name()!='choiceType' and local-name()!='menuChoiceFlow']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:text>◉ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_menu','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='mandatory' or local-name()='choiceSelection' or local-name()='choiceType' or local-name()='menuChoiceFlow')">
          <xsl:apply-templates select="@*[local-name()='mandatory' or local-name()='choiceSelection' or local-name()='choiceType' or local-name()='menuChoiceFlow']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="menuChoice">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()!='menuChoiceDefaultFlag')">
          <xsl:apply-templates select="@*[local-name()!='menuChoiceDefaultFlag']"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:text>◎ </xsl:text>
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_menu_choice','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <Span Id="ChildrenAttributesContainer" Test="boolean(local-name()='menuChoiceDefaultFlag')">
          <xsl:apply-templates select="@*[local-name()='menuChoiceDefaultFlag']"></xsl:apply-templates>
        </Span>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="@menuChoiceDefaultFlag">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_menu_choice_default','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@choiceSelection">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_selection','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='single'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_selection_single','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='multiple'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_selection_multiple','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@choiceType">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_type','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='select'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_type_select','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='pulldown'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_type_pulldown','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@menuChoiceFlow">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_type','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='list'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_type_select','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inline'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_choice_type_pulldown','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="dmIf">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_if','comtemp.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='expression')">
          <xsl:apply-templates select="*[boolean(local-name()='expression')]"></xsl:apply-templates>
        </Span>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0" Test="boolean(local-name()!='expression')">
        <xsl:apply-templates select="*[boolean(local-name()!='expression')]"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dmLoop">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_loop','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
        <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='expression')">
          <xsl:apply-templates select="*[boolean(local-name()='expression')]"></xsl:apply-templates>
        </Span>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0" Test="boolean(local-name()!='expression')">
        <xsl:apply-templates select="*[boolean(local-name()!='expression')]"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dmThenSeq">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_then','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dmElseSeq">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_else','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="dmSeqAlts">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:call-template name="before"></xsl:call-template>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*"></xsl:apply-templates>
        </Span>
        <Run FontSize="14" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_data_module_seq_alts','process.xslt')"></xsl:value-of>
          <xsl:text>: </xsl:text>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="assertion">
    <Section>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_assertion','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" Test="boolean(local-name()='variableRef' or local-name()='globalPropertyRef')">
        <xsl:apply-templates select="*[local-name()='variableRef' or local-name()='globalPropertyRef']"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> = </xsl:text>
      </Run>
      <Span Id="ChildrenNodesContainer" Test="boolean(local-name()!='variableRef' and local-name()!='globalPropertyRef')">
        <xsl:apply-templates select="*[local-name()!='variableRef' and local-name()!='globalPropertyRef']"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="variableRef">
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
  <xsl:template match="globalPropertyRef">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@applicPropertyIdent"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="globalPropertyRef/@applicPropertyIdent">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="expression">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">(</Run>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">)</Run>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="@humanReadableForm">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run>[</Run>
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
      </Run>
      <Run>]</Run>
    </Span>
  </xsl:template>
  <xsl:template match="setValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">{</Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">}</Run>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="realValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <Update>
          <Text XPath="if (preceding-sibling::realValue) then ', ' else ''" Context="Self"></Text>
        </Update>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="stringValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <Update>
          <Text XPath="if (preceding-sibling::stringValue) then ', ' else ''" Context="Self"></Text>
        </Update>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="integerValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <Update>
          <Text XPath="if (preceding-sibling::integerValue) then ', ' else ''" Context="Self"></Text>
        </Update>
      </Run>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="booleanValue">
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
  <xsl:template match="noValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_null','process.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="trueValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_true','process.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="falseValue">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Run FontSize="14" Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_false','process.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="booleanFunction">
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
  <xsl:template match="@booleanAction">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='not'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_boolean_function_not','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='defined'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_boolean_function_defined','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="booleanOperator">
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
  <xsl:template match="@booleanOperation">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='and'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_bool_operation_and','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='equal'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_bool_operation_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='exclusiveOr'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_bool_operation_exclusive_or','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='notEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_bool_operation_not_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='or'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_bool_operation_or','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="numberFunction">
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
  <xsl:template match="@numberAction">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='commonLogarithm'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_commonLogarithm','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='cosecant'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_cosecant','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='cosine'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_cosine','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='cotangent'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_cotangent','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='exponential'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_exponential','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='factorial'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_factorial','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='float'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_float','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='hyperbolicCosecant'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_hyperbolicCosecant','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='hyperbolicCosine'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_hyperbolicCosine','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='hyperbolicCotangent'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_hyperbolicCotangent','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='hyperbolicSecant'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_hyperbolicSecant','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='hyperbolicSine'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_hyperbolicSine','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='hyperbolicTangent'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_hyperbolicTangent','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inverseCosecant'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_inverseCosecant','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inverseCosine'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_inverseCosine','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inverseCotangent'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_inverseCotangent','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inverseSecant'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_inverseSecant','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inverseSine'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_inverseSine','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='inverseTangent'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_inverseTangent','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='naturalLogarithm'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_naturalLogarithm','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='negative'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_negative','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='secant'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_secant','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='sine'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_sine','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='tangent'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_tangent','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='truncate'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_action_truncate','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="numberOperator">
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
  <xsl:template match="@numberOperation">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='divide'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_divide','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='equal'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='exponent'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_exponent','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='greaterThan'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_greater_than','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='greaterThanOrEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_greater_than_or_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='integerDivide'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_integer_divide','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='lessThan'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_less_than','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='lessThanOrEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_less_than_or_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='minus'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_minus','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='modulus'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_modulus','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='notEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_not_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='plus'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_plus','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='times'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_number_operation_times','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="stringFunction">
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
  <xsl:template match="@stringAction">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='empty'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_action_empty','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='sizeOf'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_action_sizeOf','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="stringOperator">
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
  <xsl:template match="@stringOperation">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='concatenate'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_concatenate','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='contains'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_contains','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='equal'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='greaterThan'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_greater_than','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='greaterThanOrEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_greater_than_or_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='lessThan'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_less_than','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='lessThanOrEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_less_than_or_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='notEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_operation_set_not_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="subStringFunction">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_substring','process.xslt')"></xsl:value-of>[</Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">]</Run>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="subStringPosition">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_substring_position','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}"></Run>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="subStringLength">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:text> / </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_string_substring_length','process.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}"></Run>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="setFunction">
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
  <xsl:template match="@setAction">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='empty'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_action_empty','process.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='sizeOf'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_action_size_of','process.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="setOperator">
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
  <xsl:template match="@setOperation">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}" FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='add'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_add','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='disjoint'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_disjoint','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='equal'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='intersection'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_intersection','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='member'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_member','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='notEqual'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_not_equal','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='remove'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_remove','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='setDifference'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_set_difference','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='subset'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_subset','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
          <xsl:when test=".='union'">
            <xsl:text>&#160;</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_process_set_operation_union','process.xslt')"></xsl:value-of>
            <xsl:text>&#160;</xsl:text>
          </xsl:when>
        </xsl:choose>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="process//assert">
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
</xsl:stylesheet>