<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="fn xs xef msxsl">
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:variable name="autoTextColor" select="'#2a579a'"></xsl:variable>
  <xsl:variable name="autoTextColorDark" select="'#1a355e'"></xsl:variable>
  <xsl:variable name="textColor" select="'Black'"></xsl:variable>
  <xsl:variable name="errColor" select="'OrangeRed'"></xsl:variable>
  <xsl:variable name="serviceColor" select="'Gray'"></xsl:variable>
  <xsl:variable name="noteColor" select="'OrangeRed'"></xsl:variable>
  <xsl:variable name="refColor" select="'Blue'"></xsl:variable>
  <xsl:variable name="securityClassificationColor" select="'Red'"></xsl:variable>
  <xsl:variable name="commercialClassificationColor" select="'OrangeRed'"></xsl:variable>
  <xsl:variable name="caveatColor" select="'Orange'"></xsl:variable>
  <xsl:variable name="doc_language">
    <xsl:value-of select="/dmodule/identAndStatusSection/dmAddress/dmIdent/language/@languageIsoCode" />
  </xsl:variable>
  <xsl:variable name="doc_country">
    <xsl:value-of select="/dmodule/identAndStatusSection/dmAddress/dmIdent/language/@countryIsoCode" />
  </xsl:variable>
  <xsl:key name="hasIdElements" match="*[@id]" use="@id" />
  <xsl:key name="condTypes" match="condType[@id]" use="@id" />
  <xsl:key name="conds" match="cond[@id]" use="@id" />
  <xsl:key name="figures" match="figure[@id]|figureAlts[@id]" use="@id" />
  <xsl:key name="graphics" match="graphic[@id]" use="@id" />
  <xsl:key name="multimedias" match="multimedia[@id]|multimediaAlts[@id]" use="@id" />
  <xsl:key name="multimediaObjects" match="multimediaObject[@id]" use="@id" />
  <xsl:key name="tables" match="table[@id]" use="@id" />
  <xsl:key name="levelledParas" match="levelledPara[@id]|levelledParaAlts[@id]" use="@id" />
  <xsl:key name="footnotes" match="footnote" use="@id" />
  <xsl:key name="hotspots" match="hotspot[@id]" use="@id" />
  <xsl:key name="supplyDescrs" match="supplyDescr[@id]|embeddedSupplyDescr[@id]" use="@id" />
  <xsl:key name="supportEquipDescrs" match="supportEquipDescr[@id]|embeddedSupportEquipDescr[@id]" use="@id" />
  <xsl:key name="spareDescrs" match="spareDescr[@id]|embeddedSpareDescr[@id]" use="@id" />
  <xsl:key name="proceduralSteps" match="proceduralStep[@id]|proceduralStepAlts[@id]" use="@id" />
  <xsl:key name="parameters" match="parameter[@id]" use="@id" />
  <xsl:key name="zoneRefs" match="productionMaintData//zoneRef[@id]" use="@id" />
  <xsl:key name="workLocations" match="workLocation[@id]" use="@id" />
  <xsl:key name="sbMaterialSets" match="sbMaterialSet[@id]" use="@id" />
  <xsl:key name="accessPointRefs" match="productionMaintData//accessPointRef[@id]" use="@id" />
  <xsl:key name="lcAnswerOptions" match="lcAnswerOption[@id]" use="@id" />
  <xsl:key name="reasonForUpdates" match="reasonForUpdate[@id]" use="@id" />
  <xsl:key name="applics" match="applic[@id]|applicRef[@id]" use="@id" />
  <xsl:key name="warningRefs" match="warningsAndCautions/warning[@id]|warningsAndCautionsRef/warningRef[@id]" use="@id" />
  <xsl:key name="cautionRefs" match="warningsAndCautions/caution[@id]|warningsAndCautionsRef/cautionRef[@id]" use="@id" />
  <xsl:template name="start">
    <Root>
      <xsl:for-each select="//node()[xef:HasIdRefs(.)]|//@*[xef:HasIdRefs(.)]">
        <xsl:variable name="node" select="."></xsl:variable>
        <xsl:for-each select="xef:GetIdRefs(.)">
          <xsl:variable name="result">
            <xsl:call-template name="template">
              <xsl:with-param name="node" select="$node"></xsl:with-param>
              <xsl:with-param name="templateName" select="."></xsl:with-param>
            </xsl:call-template>
          </xsl:variable>
          <xsl:value-of select="xef:UpdateIdRefs($node, $result,.)" />
        </xsl:for-each>
      </xsl:for-each>
    </Root>
  </xsl:template>
  <xsl:template name="template">
    <xsl:param name="templateName"></xsl:param>
    <xsl:param name="node"></xsl:param>
    <Root>
      <xsl:for-each select="$node">
        <xsl:choose>
          <xsl:when test="$templateName='tableNumber'">
            <xsl:call-template name="table_number"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='tablePrefixAndNumber'">
            <xsl:call-template name="tablePrefixAndNumber"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='levelledParaNumber'">
            <xsl:call-template name="levelledParaNumber"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='proceduralStepNumber'">
            <xsl:call-template name="proceduralStepNumber"></xsl:call-template>
          </xsl:when>
	      <xsl:when test="$templateName='figureNumber'">
            <xsl:call-template name="figureNumber"></xsl:call-template>
          </xsl:when>
	      <xsl:when test="$templateName='multimediaNumber'">
            <xsl:call-template name="figureNumber"></xsl:call-template>
          </xsl:when>			
          <xsl:when test="$templateName='internalRef'">
            <xsl:call-template name="internalRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='internalRefColor'">
            <xsl:call-template name="internalRefColor"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='internalFootnoteRef'">
            <xsl:call-template name="internalFootnoteRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='reasonForUpdateRefIds'">
            <xsl:call-template name="reasonForUpdateRefIds"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='applicRefId'">
            <xsl:call-template name="applicRefId"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='warningsRef'">
            <xsl:call-template name="warningsRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='cautionsRef'">
            <xsl:call-template name="cautionsRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='dependencyTest'">
            <xsl:call-template name="dependencyTest"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='securityClassification'">
            <xsl:call-template name="securityClassification"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='commercialClassification'">
            <xsl:call-template name="commercialClassification"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='caveat'">
            <xsl:call-template name="caveat"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='TOC'">
            <xsl:call-template name="TOC"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='commonInfoDescrParaNumber'">
            <xsl:call-template name="commonInfoDescrParaNumber"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='condTypeRef'">
            <xsl:call-template name="condTypeRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='condRef'">
            <xsl:call-template name="condRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='learningNumber'">
            <xsl:call-template name="learningNumber"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='objectiveNumbering'">
            <xsl:call-template name="objectiveNumbering"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='crewNumber'">
            <xsl:call-template name="crewNumber"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='pmEntryNumber'">
            <xsl:call-template name="pmEntryNumber"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='isolationStepNumbering'">
            <xsl:call-template name="isolationStepNumbering"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='isolationVariantNumbering'">
            <xsl:call-template name="isolationVariantNumbering"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='nextActionRef'">
            <xsl:call-template name="nextActionRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='checkListStepNumber'">
            <xsl:call-template name="checkListStepNumber"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='applicMapRefId'">
            <xsl:call-template name="applicMapRefId"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='idRef'">
            <xsl:call-template name="idRef"></xsl:call-template>
          </xsl:when>
          <xsl:when test="$templateName='checkListInterval'">
            <xsl:call-template name="checkListInterval"></xsl:call-template>
          </xsl:when>			
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </Root>
  </xsl:template>
  <xsl:template match="*|@*">
    <Root>
      <xsl:choose>
        <xsl:when test="$namedTemplate='start'">
          <xsl:call-template name="start"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='tableNumber'">
          <xsl:call-template name="table_number"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='tablePrefixAndNumber'">
          <xsl:call-template name="tablePrefixAndNumber"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='levelledParaNumber'">
          <xsl:call-template name="levelledParaNumber"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='proceduralStepNumber'">
          <xsl:call-template name="proceduralStepNumber"></xsl:call-template>
        </xsl:when>
	    <xsl:when test="$namedTemplate='figureNumber'">
          <xsl:call-template name="figureNumber"></xsl:call-template>
        </xsl:when>		  
	    <xsl:when test="$namedTemplate='multimediaNumber'">
          <xsl:call-template name="multimediaNumber"></xsl:call-template>
        </xsl:when>			  
        <xsl:when test="$namedTemplate='internalRef'">
          <xsl:call-template name="internalRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='internalRefColor'">
          <xsl:call-template name="internalRefColor"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='internalFootnoteRef'">
          <xsl:call-template name="internalFootnoteRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='reasonForUpdateRefIds'">
          <xsl:call-template name="reasonForUpdateRefIds"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='applicRefId'">
          <xsl:call-template name="applicRefId"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='warningsRef'">
          <xsl:call-template name="warningsRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='cautionsRef'">
          <xsl:call-template name="cautionsRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='dependencyTest'">
          <xsl:call-template name="dependencyTest"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='securityClassification'">
          <xsl:call-template name="securityClassification"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='commercialClassification'">
          <xsl:call-template name="commercialClassification"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='caveat'">
          <xsl:call-template name="caveat"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='TOC'">
          <xsl:call-template name="TOC"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='commonInfoDescrParaNumber'">
          <xsl:call-template name="commonInfoDescrParaNumber"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='condTypeRef'">
          <xsl:call-template name="condTypeRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='condRef'">
          <xsl:call-template name="condRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='learningNumber'">
          <xsl:call-template name="learningNumber"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='objectiveNumbering'">
          <xsl:call-template name="objectiveNumbering"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='crewNumber'">
          <xsl:call-template name="crewNumber"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='pmEntryNumber'">
          <xsl:call-template name="pmEntryNumber"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='isolationStepNumbering'">
          <xsl:call-template name="isolationStepNumbering"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='isolationVariantNumbering'">
          <xsl:call-template name="isolationVariantNumbering"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='nextActionRef'">
          <xsl:call-template name="nextActionRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='checkListStepNumber'">
          <xsl:call-template name="checkListStepNumber"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='applicMapRefId'">
          <xsl:call-template name="applicMapRefId"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='idRef'">
          <xsl:call-template name="idRef"></xsl:call-template>
        </xsl:when>
        <xsl:when test="$namedTemplate='checkListInterval'">
          <xsl:call-template name="checkListInterval"></xsl:call-template>
        </xsl:when>				  
        <xsl:otherwise></xsl:otherwise>
      </xsl:choose>
    </Root>
  </xsl:template>
  <xsl:template name="checkListInterval">
	  <xsl:variable name="th" select="."></xsl:variable>
	  <xsl:value-of select="//checkListInterval[@id=$th]/text()"/>
  </xsl:template>		
  <xsl:template name="idRef">
    <xsl:variable name="internalRefId" select="@internalRefId"></xsl:variable>
    <xsl:call-template name="id">
      <xsl:with-param name="context" select="key('hasIdElements',$internalRefId)"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="internalFootnoteRef">
    <xsl:variable name="internalRefId" select="@internalRefId"></xsl:variable>
    <Run VerticalAlignment="Super" FontSize="10">
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test="key('footnotes',$internalRefId)">
          <xsl:value-of select="count(key('footnotes',$internalRefId)/preceding::footnote)+1"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="Foreground">
            <xsl:value-of select="$errColor"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="Event">AttributeEditor</xsl:attribute>
          <xsl:attribute name="Arg">internalRefId</xsl:attribute>
          <xsl:attribute name="MouseCursor">Hand</xsl:attribute>
          <xsl:attribute name="FontWeight">Bold</xsl:attribute>
          <xsl:text>[???]</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template name="condTypeRef">
    <xsl:variable name="condTypeRefId" select="@condTypeRefId"></xsl:variable>
    <Run>
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test="key('condTypes',$condTypeRefId)">
          <xsl:value-of select="key('condTypes',$condTypeRefId)/name"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="Foreground">
            <xsl:value-of select="$errColor"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="Event">AttributeEditor</xsl:attribute>
          <xsl:attribute name="Arg">condTypeRefId</xsl:attribute>
          <xsl:attribute name="MouseCursor">Hand</xsl:attribute>
          <xsl:attribute name="FontWeight">Bold</xsl:attribute>
          <xsl:text>[???]</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template name="condRef">
    <xsl:variable name="condRefId" select="@condRefId"></xsl:variable>
    <Run>
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test="key('conds',$condRefId)">
          <xsl:value-of select="key('conds',$condRefId)/name"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="Foreground">
            <xsl:value-of select="$errColor"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="Event">AttributeEditor</xsl:attribute>
          <xsl:attribute name="Arg">condRefId</xsl:attribute>
          <xsl:attribute name="MouseCursor">Hand</xsl:attribute>
          <xsl:attribute name="FontWeight">Bold</xsl:attribute>
          <xsl:text>[???]</xsl:text>
        </xsl:otherwise>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template name="nextActionRef">
    <xsl:variable name="nextActionRefId" select="@nextActionRefId"></xsl:variable>
    <Run>
      <xsl:for-each select="key('hasIdElements',$nextActionRefId)">
        <xsl:call-template name="isolationStepNumbering"></xsl:call-template>
      </xsl:for-each>
    </Run>
  </xsl:template>

	<xsl:template name="figureNumber">
		<xsl:param name="figure" select="self::figure"></xsl:param>
	    <xsl:value-of select="count($figure/preceding::*[self::figure[not(parent::figureAlts)] or self::figureAlts])+1"></xsl:value-of>
	</xsl:template>		

	<xsl:template name="graphicNumber">
		<xsl:param name="graphic"></xsl:param>
	    <xsl:value-of select="count($graphic/parent::figure/preceding::*[self::figure[not(parent::figureAlts)] or self::figureAlts])+1"></xsl:value-of>
        <xsl:text>,&#160;</xsl:text>
		<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_sheet','prettyUpdate.xslt')" />
		<xsl:text> </xsl:text>
	    <xsl:value-of select="count($graphic/preceding-sibling::graphic)+1"></xsl:value-of>	
	</xsl:template>		
	
	<xsl:template name="multimediaNumber">
		<xsl:param name="multimedia" select="self::multimedia"></xsl:param>
	    <xsl:value-of select="count($multimedia/preceding::*[self::multimedia[not(parent::multimediaAlts)] or self::multimediaAlts])+1"></xsl:value-of>
	</xsl:template>		
	
	<xsl:template name="multimediaObjectNumber">
		<xsl:param name="multimediaObject"></xsl:param>
	    <xsl:value-of select="count($multimediaObject/parent::multimedia/preceding::*[self::multimedia[not(parent::multimediaAlts)] or self::multimediaAlts])+1"></xsl:value-of>
	    <xsl:text>,&#160;</xsl:text>
	    <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_sheet','prettyUpdate.xslt')" />
	    <xsl:text> </xsl:text>
	    <xsl:value-of select="count($multimediaObject/preceding-sibling::multimediaObject)+1"></xsl:value-of>
	</xsl:template>		
		
  <xsl:template name="internalRef">
    <xsl:variable name="internalRefId" select="@internalRefId"></xsl:variable>
    <xsl:variable name="internalRefTargetType" select="@internalRefTargetType"></xsl:variable>
    <Run>
      <xsl:call-template name="idtemplate" />
      <xsl:choose>
        <xsl:when test=".//text()"></xsl:when>
        <xsl:when test="$internalRefTargetType='irtt01'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_fig','prettyUpdate.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:call-template name="figureNumber">
		    <xsl:with-param name="figure" select="key('figures',$internalRefId)"></xsl:with-param>	
		  </xsl:call-template>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt02'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_table','prettyUpdate.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:for-each select="key('tables',$internalRefId)">
            <xsl:call-template name="table_number"></xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt03'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_multimedia','comtemp.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:call-template name="multimediaNumber">
		    <xsl:with-param name="multimedia" select="key('multimedias',$internalRefId)"></xsl:with-param>	
		  </xsl:call-template>			
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt04'">
			<xsl:choose>
				<xsl:when test="key('supplyDescrs',$internalRefId)/shortName/text()">
			         <xsl:value-of select="key('supplyDescrs',$internalRefId)/shortName"></xsl:value-of>
			    </xsl:when>
				<xsl:otherwise>
			         <xsl:value-of select="key('supplyDescrs',$internalRefId)/name"></xsl:value-of>
			    </xsl:otherwise>
		    </xsl:choose>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt05'">
			<xsl:choose>
				<xsl:when test="key('supportEquipDescrs',$internalRefId)/shortName/text()">
			         <xsl:value-of select="key('supportEquipDescrs',$internalRefId)/shortName"></xsl:value-of>
			    </xsl:when>
				<xsl:otherwise>
			         <xsl:value-of select="key('supportEquipDescrs',$internalRefId)/name"></xsl:value-of>
			    </xsl:otherwise>
		    </xsl:choose>			
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt06'">
			<xsl:choose>
				<xsl:when test="key('spareDescrs',$internalRefId)/shortName/text()">
			         <xsl:value-of select="key('spareDescrs',$internalRefId)/shortName"></xsl:value-of>
			    </xsl:when>
				<xsl:otherwise>
			         <xsl:value-of select="key('spareDescrs',$internalRefId)/name"></xsl:value-of>
			    </xsl:otherwise>
		    </xsl:choose>				
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt07'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_para','prettyUpdate.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:for-each select="key('levelledParas',$internalRefId)">
            <xsl:call-template name="levelledParaNumber"></xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt08'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_step','prettyUpdate.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:for-each select="key('proceduralSteps',$internalRefId)">
            <xsl:call-template name="proceduralStepNumber"></xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt09'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_fig','prettyUpdate.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:call-template name="graphicNumber">
		    <xsl:with-param name="graphic" select="key('graphics',$internalRefId)"></xsl:with-param>	
		  </xsl:call-template>			
		</xsl:when>
        <xsl:when test="$internalRefTargetType='irtt10'">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_multimedia','comtemp.xslt')"></xsl:value-of>
          <xsl:text>&#160;</xsl:text>
          <xsl:call-template name="multimediaObjectNumber">
		    <xsl:with-param name="multimediaObject" select="key('multimediaObjects',$internalRefId)"></xsl:with-param>	
		  </xsl:call-template>				
		</xsl:when>
        <xsl:when test="$internalRefTargetType='irtt11'">
          <xsl:for-each select="key('hotspots',$internalRefId)">
            <xsl:choose>
              <xsl:when test="@applicationStructureName">
                <xsl:value-of select="@applicationStructureName"></xsl:value-of>
              </xsl:when>
              <xsl:when test="@hotspotTitle">
                <xsl:value-of select="@hotspotTitle"></xsl:value-of>
              </xsl:when>
            </xsl:choose>
          </xsl:for-each>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt12'">
          <xsl:value-of select="key('parameters',$internalRefId)/@parameterName"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt13'">
          <xsl:choose>
            <xsl:when test="key('zoneRefs',$internalRefId)/@zoneNumber">
              <xsl:value-of select="key('zoneRefs',$internalRefId)/@zoneNumber"></xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="key('zoneRefs',$internalRefId)/name"></xsl:value-of>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt14'">
          <xsl:choose>
            <xsl:when test="key('workLocations',$internalRefId)/workArea">
              <xsl:value-of select="key('workLocations',$internalRefId)/workArea"></xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="key('workLocations',$internalRefId)/text()"></xsl:value-of>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt15'">
          <xsl:value-of select="key('sbMaterialSets',$internalRefId)/name"></xsl:value-of>
        </xsl:when>
        <xsl:when test="$internalRefTargetType='irtt16'">
          <xsl:choose>
            <xsl:when test="key('accessPointRefs',$internalRefId)/@accessPointNumber">
              <xsl:value-of select="key('accessPointRefs',$internalRefId)/@accessPointNumber"></xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
              <xsl:value-of select="key('accessPointRefs',$internalRefId)/name"></xsl:value-of>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:when test="not(@internalRefTargetType) and parent::lcFeedbackItem">
          <xsl:value-of select="key('lcAnswerOptions',$internalRefId)//text()"></xsl:value-of>
        </xsl:when>
        <xsl:otherwise>
          <xsl:choose>
            <xsl:when test="key('hasIdElements',$internalRefId)">
              <xsl:for-each select="key('hasIdElements',$internalRefId)">
                <xsl:choose>
                  <xsl:when test="self::toolsListCode">
                    <xsl:value-of select="."></xsl:value-of>
                  </xsl:when>
                  <xsl:when test="self::remarkCode">
                    <xsl:value-of select="."></xsl:value-of>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:apply-templates select="@internalRefId"></xsl:apply-templates>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
              <xsl:attribute name="Foreground">
                <xsl:value-of select="$errColor"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="Event">AttributeEditor</xsl:attribute>
              <xsl:attribute name="Arg">internalRefId</xsl:attribute>
              <xsl:attribute name="MouseCursor">Hand</xsl:attribute>
              <xsl:attribute name="FontWeight">Bold</xsl:attribute>
              <xsl:text>[???]</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </Run>
  </xsl:template>
  <xsl:template match="@internalRefId">
    <Run FontSize="14" Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold" Foreground="{$refColor}">
      <xsl:call-template name="idtemplate" />
      <xsl:text>[?]</xsl:text>
    </Run>
  </xsl:template>
  <!-- <xsl:template name="internalRefColor">Red</xsl:template> -->
  <xsl:template name="internalRefColor">
    <xsl:variable name="internalRefId" select="@internalRefId"></xsl:variable>
    <xsl:choose>
      <xsl:when test="key('hasIdElements',$internalRefId)">
        <xsl:value-of select="$refColor"></xsl:value-of>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$errColor"></xsl:value-of>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
	<xsl:template name="TOC">
		<Section Margin="0,10,0,0">
			<xsl:choose>
				<xsl:when test="description or crew">
					<Paragraph FontSize="16">
						<Run FontWeight="Bold" Foreground="{$autoTextColor}">
							<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_toc','comtemp.xslt')"></xsl:value-of>
							<xsl:text>&#160;</xsl:text>
						</Run>
						<Run FontSize="24" Foreground="{$refColor}" Event="UpdateTOC" MouseCursor="Hand">↺</Run>
					</Paragraph>
					<xsl:for-each select="//levelledPara[title]">
						<Paragraph>
							<List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$refColor}">
								<ListItem MarkerWidth="80">
									<xsl:attribute name="MarkerValue">
										<xsl:call-template name="levelledParaNumber"></xsl:call-template>
									</xsl:attribute>
									<Hyperlink Foreground="{$refColor}">
										<xsl:attribute name="IdRef">
											<xsl:call-template name="id">
												<xsl:with-param name="context" select="self::*"></xsl:with-param>
											</xsl:call-template>
										</xsl:attribute>
										<Paragraph FontSize="14" Foreground="{$refColor}" FontWeight="Normal">
											<Run>
												<xsl:value-of select="title"></xsl:value-of>
											</Run>
										</Paragraph>
									</Hyperlink>
								</ListItem>
							</List>
						</Paragraph>
					</xsl:for-each>
					<xsl:call-template name="lot"></xsl:call-template>
					<xsl:call-template name="lof"></xsl:call-template>
				</xsl:when>
				<xsl:when test="procedure">
					<Paragraph FontSize="16">
						<Run FontWeight="Bold" Foreground="{$autoTextColor}">
							<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_toc','comtemp.xslt')"></xsl:value-of>
							<xsl:text>&#160;</xsl:text>
						</Run>
						<Run FontSize="24" Foreground="{$refColor}" Event="UpdateTOC" MouseCursor="Hand">↺</Run>
					</Paragraph>
					<xsl:for-each select="//proceduralStep[title]">
						<Paragraph>
							<List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$refColor}">
								<ListItem MarkerWidth="80">
									<xsl:attribute name="MarkerValue">
										<xsl:call-template name="proceduralStepNumber"></xsl:call-template>
									</xsl:attribute>
									<Hyperlink Foreground="{$refColor}">
										<xsl:attribute name="IdRef">
											<xsl:call-template name="id">
												<xsl:with-param name="context" select="self::*"></xsl:with-param>
											</xsl:call-template>
										</xsl:attribute>
										<Paragraph FontSize="14" Foreground="{$refColor}" FontWeight="Normal">
											<Run>
												<xsl:value-of select="title"></xsl:value-of>
											</Run>
										</Paragraph>
									</Hyperlink>
								</ListItem>
							</List>
						</Paragraph>
					</xsl:for-each>
					<xsl:call-template name="lot"></xsl:call-template>
					<xsl:call-template name="lof"></xsl:call-template>
				</xsl:when>
				<xsl:when test="brex">
					<Paragraph FontSize="16">
						<Run FontWeight="Bold" Foreground="{$autoTextColor}">
							<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_toc','comtemp.xslt')"></xsl:value-of>
							<xsl:text>&#160;</xsl:text>
						</Run>
						<Run FontSize="24" Foreground="{$refColor}" Event="UpdateTOC" MouseCursor="Hand">↺</Run>
					</Paragraph>
					<xsl:for-each select="brex/*[local-name()!='commonInfo']">
						<Paragraph>
							<List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$refColor}">
								<ListItem MarkerWidth="80">
									<xsl:attribute name="MarkerValue">
										<xsl:value-of select="position()" />
									</xsl:attribute>
									<Hyperlink Foreground="{$refColor}">
										<xsl:attribute name="IdRef">
											<xsl:call-template name="id">
												<xsl:with-param name="context" select="self::*"></xsl:with-param>
											</xsl:call-template>
										</xsl:attribute>
										<Paragraph FontSize="14" Foreground="{$refColor}" FontWeight="Normal">
											<Run>
												<xsl:choose>
													<xsl:when test="local-name()='snsRules'">
														<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sns_rules','comtemp.xslt')"></xsl:value-of>
													</xsl:when>
													<xsl:when test="local-name()='contextRules'">
														<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_context_rules','comtemp.xslt')"></xsl:value-of>
														<xsl:if test="@rulesContext">
															<xsl:text> — </xsl:text>
															<xsl:value-of select="@rulesContext"></xsl:value-of>
														</xsl:if>
													</xsl:when>
													<xsl:when test="local-name()='nonContextRules'">
														<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_non_context_rules','comtemp.xslt')"></xsl:value-of>
													</xsl:when>
												</xsl:choose>
											</Run>
										</Paragraph>
									</Hyperlink>
								</ListItem>
							</List>
						</Paragraph>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="faultReporting">
					<Paragraph FontSize="16">
						<Run FontWeight="Bold" Foreground="{$autoTextColor}">
							<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_toc','comtemp.xslt')"></xsl:value-of>
							<xsl:text>&#160;</xsl:text>
						</Run>
						<Run FontSize="24" Foreground="{$refColor}" Event="UpdateTOC" MouseCursor="Hand">↺</Run>
					</Paragraph>
					<xsl:for-each select="faultReporting//*[local-name()='isolatedFault' or local-name()='detectedFault' or local-name()='observedFault' or local-name()='correlatedFault']">
						<Paragraph>
							<List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$refColor}">
								<ListItem MarkerWidth="80">
									<xsl:attribute name="MarkerValue">
										<xsl:value-of select="position()" />
									</xsl:attribute>
									<Hyperlink Foreground="{$refColor}">
										<xsl:attribute name="IdRef">
											<xsl:call-template name="id">
												<xsl:with-param name="context" select="self::*"></xsl:with-param>
											</xsl:call-template>
										</xsl:attribute>
										<Paragraph FontSize="14" Foreground="{$refColor}" FontWeight="Normal">
											<Run>
												<xsl:value-of select="@faultCode" />
											</Run>
										</Paragraph>
									</Hyperlink>
								</ListItem>
							</List>
						</Paragraph>
					</xsl:for-each>
				</xsl:when>
			</xsl:choose>
		</Section>
	</xsl:template>
	<xsl:template name="lot">
		<xsl:if test="//table[title and (not(@tocentry) or @tocentry!=0)] | //content/refs | //reqCondGroup | //reqPersons | //reqSupportEquips | //reqSupplies | //reqSpares | //reqTechInfoGroup | //maintAllocation | //toolsList | //remarksList | //container | //descrWire | //descrHarness | //descrElectricalEquip |  //descrConnector | //descrDistributionPart | //descrAccessory | //descrSolderSleeve | //descrShrinkSleeve | //descrIdentSleeve | //descrConduit | //descrWireMaterial | //connectorGroup | //distributionPartGroup | //accessoryGroup | //solderSleeveGroup | //shrinkSleeveGroup | //identSleeveGroup | //conduitGroup | //wireMaterialGroup | //genericPropertyGroup | //sbProductModificationList[sbProductModification] | //sbImpactList[sbImpact] | //sbConcurrentSbList[sbConcurrentSbInfo] | //sbAccomplishmentLimit[sbLimit] | //sbTimeAssessment[sbTimeInfo] | //sbApprovedDm[refs] | //sbReplacementSb[refs]  | //condTypeList | //condList | //incorporation | //applicCrossRefTableRef[parent::applicCrossRefTableCatalog and  not(preceding-sibling::applicCrossRefTableRef)] | productDefinitionRelationship[parent::applicCrossRefTableCatalog and not(preceding-sibling::productDefinitionRelationship)] | productAttributeList | productCrossRefTable | snsRules | contextRules">
			<Paragraph FontSize="16" Margin="0,10,0,0">
				<Run FontWeight="Bold" Foreground="{$autoTextColor}">
					<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_lot','prettyUpdate.xslt')"></xsl:value-of>
				</Run>
			</Paragraph>
			<xsl:for-each select="//table[title and (not(@tocentry) or @tocentry!=0)] | //content/refs | //reqCondGroup | //reqPersons | //reqSupportEquips | //reqSupplies | //reqSpares | //reqTechInfoGroup | //maintAllocation | //toolsList | //remarksList | //container | //descrWire | //descrHarness | //descrElectricalEquip |  //descrConnector | //descrDistributionPart | //descrAccessory | //descrSolderSleeve | //descrShrinkSleeve | //descrIdentSleeve | //descrConduit | //descrWireMaterial | //connectorGroup | //distributionPartGroup | //accessoryGroup | //solderSleeveGroup | //shrinkSleeveGroup | //identSleeveGroup | //conduitGroup | //wireMaterialGroup | //genericPropertyGroup | //sbProductModificationList[sbProductModification] | //sbImpactList[sbImpact] | //sbConcurrentSbList[sbConcurrentSbInfo] | //sbAccomplishmentLimit[sbLimit] | //sbTimeAssessment[sbTimeInfo] | //sbApprovedDm[refs] | //sbReplacementSb[refs]  | //condTypeList | //condList | //incorporation | //applicCrossRefTableRef[parent::applicCrossRefTableCatalog and  not(preceding-sibling::applicCrossRefTableRef)] | productDefinitionRelationship[parent::applicCrossRefTableCatalog and not(preceding-sibling::productDefinitionRelationship)] | productAttributeList | productCrossRefTable | snsRules | contextRules">
				<Paragraph>
					<List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$refColor}">
						<ListItem MarkerWidth="80">
							<xsl:attribute name="MarkerValue">
								<xsl:call-template name="table_number"></xsl:call-template>
							</xsl:attribute>
							<Hyperlink Foreground="{$refColor}">
								<xsl:attribute name="IdRef">
									<xsl:call-template name="id">
										<xsl:with-param name="context" select="self::*"></xsl:with-param>
									</xsl:call-template>
								</xsl:attribute>
								<Paragraph FontSize="14" Foreground="{$refColor}" FontWeight="Normal">
									<Run>
										<xsl:call-template name="table_title"></xsl:call-template>
									</Run>
								</Paragraph>
							</Hyperlink>
						</ListItem>
					</List>
				</Paragraph>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>

	<xsl:template name="lof">
		<xsl:if test="//figure">
			<Paragraph FontSize="16" Margin="0,10,0,0">
				<Run FontWeight="Bold" Foreground="{$autoTextColor}">
					<xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_lof','prettyUpdate.xslt')"></xsl:value-of>
				</Run>
			</Paragraph>
			<xsl:for-each select="//figure">
				<Paragraph>
					<List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$refColor}">
						<ListItem MarkerWidth="80">
							<xsl:attribute name="MarkerValue">
								<xsl:call-template name="figureNumber">
									<xsl:with-param name="figure" select="."></xsl:with-param>
								</xsl:call-template>
							</xsl:attribute>
							<Hyperlink Foreground="{$refColor}">
								<xsl:attribute name="IdRef">
									<xsl:call-template name="id">
										<xsl:with-param name="context" select="self::*"></xsl:with-param>
									</xsl:call-template>
								</xsl:attribute>
								<Paragraph FontSize="14" Foreground="{$refColor}" FontWeight="Normal">
									<Run>
										<xsl:value-of select="./title"/>
									</Run>
								</Paragraph>
							</Hyperlink>
						</ListItem>
					</List>
				</Paragraph>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>			
			
  <xsl:template name="tablePrefixAndNumber">
    <xsl:if test="title">
      <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_table','prettyUpdate.xslt')"></xsl:value-of>
      <xsl:text>&#160;</xsl:text>
      <xsl:call-template name="table_number"></xsl:call-template>
    </xsl:if>
  </xsl:template>
  <xsl:template name="table_number">
    <xsl:for-each select="self::*">
      <xsl:number count="table[title] | content/refs | reqCondGroup | reqPersons | reqSupportEquips | reqSupplies | reqSpares | reqTechInfoGroup | maintAllocation | toolsList | remarksList | container | descrWire | descrHarness | descrElectricalEquip | descrConnector | descrDistributionPart | descrAccessory | descrSolderSleeve | descrShrinkSleeve | descrIdentSleeve | descrConduit | descrWireMaterial | connectorGroup | distributionPartGroup | accessoryGroup | solderSleeveGroup | shrinkSleeveGroup | identSleeveGroup | conduitGroup | wireMaterialGroup |    genericPropertyGroup | sbProductModificationList[sbProductModification] | sbImpactList[sbImpact] | sbConcurrentSbList[sbConcurrentSbInfo] | sbAccomplishmentLimit[sbLimit] | sbTimeAssessment[sbTimeInfo] | sbApprovedDm[refs] | sbReplacementSb[refs] | condTypeList | condList | incorporation | applicCrossRefTableRef[parent::applicCrossRefTableCatalog and not(preceding-sibling::applicCrossRefTableRef)] | productDefinitionRelationship[parent::applicCrossRefTableCatalog and not(preceding-sibling::productDefinitionRelationship)] | productAttributeList | productCrossRefTable | snsRules | contextRules" from="dmodule" level="any" />
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="table_title">
    <xsl:choose>
      <xsl:when test="self::refs">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_references','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::table">
        <xsl:value-of select="./title" />
      </xsl:when>
      <xsl:when test="self::maintAllocation">
        <xsl:value-of select="./title" />
      </xsl:when>
      <xsl:when test="self::reqCondGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_required_conditions','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::reqPersons">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_required_persons','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::reqSupportEquips">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_support_equipment','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::reqSupplies">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_consumables_materials_and_expendables','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::reqSpares">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_spares','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::reqTechInfoGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_required_technical_info','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::toolsList">
        <xsl:value-of select="./title" />
      </xsl:when>
      <xsl:when test="self::remarksList">
        <xsl:value-of select="./title" />
      </xsl:when>
      <xsl:when test="self::container">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_alternate_data_modules','prettyUpdate.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrWire">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_data_fields_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrHarness">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_harness_data_fields_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrElectricalEquip">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_electrical_equipment_data_fields_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrConnector">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_connector_data_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrDistributionPart">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_distribution_part_data_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrAccessory">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_accessory_data_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrSolderSleeve">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_solder_sleeve_data_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrShrinkSleeve">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_shrink_sleeve_data_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrIdentSleeve">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_identification_sleeve_data_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrConduit">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_conduit_data_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::descrWireMaterial">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_material_field_description','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::connectorGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_connectors','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::distributionPartGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_distribution_parts','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::accessoryGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_accessories','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::solderSleeveGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_solder_sleeves','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::shrinkSleeveGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_shrink_sleeves','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::identSleeveGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_identification_sleeves','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::conduitGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_conduits','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::wireMaterialGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_wire_materials','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::genericPropertyGroup">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_generic_property_group','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::sbProductModificationList">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_product_modifications','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::sbImpactList">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_impacts','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::sbConcurrentSbList">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_list_of_concurrent_service_bulletins','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::sbAccomplishmentLimit">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_accomplishment_limit','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::sbTimeAssessment">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_time_assessment','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::sbApprovedDm">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_service_bulletin_approved_data_modules','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::sbReplacementSb">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_service_bulletin_replacement','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::condTypeList">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_common_types_of_conditions','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::condList">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_conditions','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::incorporation">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_incorporation','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::applicCrossRefTableRef[not(preceding-sibling::applicCrossRefTableRef)]">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_applic_cross_ref_table_refs','prettyUpdate.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::productDefinitionRelationship[not(preceding-sibling::productDefinitionRelationship)]">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_product_definition_relationships','prettyUpdate.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::productAttributeList">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_product_attribute_list','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::productCrossRefTable">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_list_of_product_instances','prettyUpdate.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::snsRules">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sns_rules','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
      <xsl:when test="self::contextRules">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_context_rules','comtemp.xslt')"></xsl:value-of>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="reasonForUpdateRefIds">
    <xsl:variable name="reasonForUpdateRefIds" select="string(.)"></xsl:variable>
    <xsl:variable name="context" select="/*"></xsl:variable>
    <xsl:variable name="attr" select="."></xsl:variable>	  
    <Section>
      <xsl:variable name="tokenize">
        <root>
          <xsl:call-template name="tokenize">
            <xsl:with-param name="string" select="$reasonForUpdateRefIds" />
          </xsl:call-template>
        </root>
      </xsl:variable>
      <xsl:for-each select="msxsl:node-set($tokenize)//token/text()">
        <xsl:variable name="rid">
          <xsl:value-of select="."></xsl:value-of>
        </xsl:variable>
        <xsl:for-each select="$context">
			<xsl:choose>
				<xsl:when test="key('reasonForUpdates',$rid)">
                  <xsl:for-each select="key('reasonForUpdates',$rid)">
                    <Section FontSize="10" FontStyle="Italic" Foreground="{$serviceColor}">
                      <Run Foreground="{$autoTextColorDark}">
                        <xsl:text>■ </xsl:text>
                      </Run>
                      <Run Foreground="{$autoTextColorDark}">
                        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_rfu','prettyUpdate.xslt')"></xsl:value-of>
                        <xsl:text>: </xsl:text>
                      </Run>
                      <Run Event="AttributeEditor" MouseCursor="Hand">
                        <xsl:for-each select="simplePara">
                          <xsl:value-of select="."></xsl:value-of>
                          <xsl:if test="position()!=last()"> / </xsl:if>
                        </xsl:for-each>
                      </Run>
                    </Section>
                  </xsl:for-each>
			    </xsl:when>
			    <xsl:otherwise>
                    <Section FontSize="10" FontStyle="Italic" Foreground="{$errColor}">
                      <Run>
                        <xsl:text>■ </xsl:text>
                      </Run>
                      <Run>
                        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_error','prettyUpdate.xslt')"></xsl:value-of>
                        <xsl:text>: </xsl:text>
                      </Run>
                      <Run Event="AttributeEditor" MouseCursor="Hand">
                        <xsl:for-each select="$attr">
                          <xsl:value-of select="."></xsl:value-of>
                        </xsl:for-each>
                      </Run>
                    </Section>
			    </xsl:otherwise>
			</xsl:choose>
		  
        </xsl:for-each>
      </xsl:for-each>
    </Section>
  </xsl:template>
  <xsl:template name="tokenize">
    <xsl:param name="string" />
    <xsl:param name="separator" select="' '" />
    <xsl:choose>
      <xsl:when test="contains($string,$separator)">
        <token>
          <xsl:value-of select="substring-before($string,$separator)" />
        </token>
        <xsl:call-template name="tokenize">
          <xsl:with-param name="string" select="substring-after($string,$separator)" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <token>
          <xsl:value-of select="$string" />
        </token>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="applicRefId">
    <xsl:variable name="applicRefId" select="."></xsl:variable>
    <Section>
      <xsl:for-each select="key('applics',$applicRefId)">
        <Section FontStyle="Italic" FontSize="10" Foreground="{$serviceColor}">
          <Run Foreground="{$noteColor}">
            <xsl:text>■ </xsl:text>
          </Run>
          <Run Foreground="{$noteColor}">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_applicability','comtemp.xslt')"></xsl:value-of>
            <xsl:text>: </xsl:text>
          </Run>
          <Run Event="AttributeEditor" MouseCursor="Hand">
            <xsl:value-of select="."></xsl:value-of>
          </Run>
          <Run>
            <xsl:text>&#160;</xsl:text>
          </Run>
          <xsl:if test="self::applicRef">
            <Run Foreground="Gray">
              <xsl:value-of select="xef:GetApplicTextFromRep(@applicIdentValue)"></xsl:value-of>
            </Run>
          </xsl:if>
        </Section>
      </xsl:for-each>
    </Section>
  </xsl:template>
  <xsl:template name="applicMapRefId">
    <xsl:variable name="applicMapRefId" select="."></xsl:variable>
    <Span>
      <xsl:for-each select="key('applics',$applicMapRefId)">
        <Span Foreground="{$refColor}">
          <Run Event="AttributeEditor" MouseCursor="Hand">
            <xsl:value-of select="."></xsl:value-of>
          </Run>
        </Span>
      </xsl:for-each>
    </Span>
  </xsl:template>
  <xsl:template name="dependencyTest">
    <xsl:variable name="dependencyTest" select="."></xsl:variable>
    <Span>
      <xsl:for-each select="key('applics',$dependencyTest)">
        <Span Foreground="{$autoTextColor}">
          <Run>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_dependency_test','prettyUpdate.xslt')"></xsl:value-of>
            <xsl:text>: </xsl:text>
          </Run>
          <Run Event="AttributeEditor" MouseCursor="Hand" FontWeight="Bold">
            <xsl:value-of select="."></xsl:value-of>
          </Run>
          <Run>)</Run>
        </Span>
      </xsl:for-each>
    </Span>
  </xsl:template>
  <xsl:template name="warningsRef">
    <Section>
      <xsl:for-each select="key('warningRefs',.)">
        <Paragraph FontSize="14" Foreground="{$autoTextColor}" FontWeight="Normal">
          <Span>
            <Run FontWeight="Bold" Foreground="{$securityClassificationColor}">⚠</Run>
            <Run FontWeight="Bold">
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_warning_ref','comtemp.xslt')"></xsl:value-of>
            </Run>
            <Run>
              <xsl:text>&#160;</xsl:text>
            </Run>
            <Run Event="AttributeEditor" Foreground="{$refColor}" MouseCursor="Hand" FontWeight="Bold">
              <xsl:value-of select="@id" />
            </Run>
            <Run> (</Run>
            <Run>
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_ref_navigation','prettyUpdate.xslt')"></xsl:value-of>
            </Run>
            <Hyperlink Foreground="{$refColor}">
              <xsl:attribute name="IdRef">
                <xsl:call-template name="id">
                  <xsl:with-param name="context" select="self::*"></xsl:with-param>
                </xsl:call-template>
              </xsl:attribute>
              <Run MouseCursor="Hand" FontWeight="Bold" Foreground="{$refColor}">
                <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_ref_navigation_here','prettyUpdate.xslt')"></xsl:value-of>
              </Run>
            </Hyperlink>
            <Run>)</Run>
            <xsl:choose>
              <xsl:when test="self::warning">
                <Paragraph Foreground="Gray" Margin="17,0,0,0">
                  <Run>
                    <xsl:value-of select="."></xsl:value-of>
                  </Run>
                </Paragraph>
              </xsl:when>
              <xsl:when test="self::warningRef">
                <Paragraph Foreground="Gray" Margin="17,0,0,0">
                  <Run>
                    <xsl:value-of select="xef:GetWarningTextFromRep(@warningIdentNumber)"></xsl:value-of>
                  </Run>
                </Paragraph>
              </xsl:when>
            </xsl:choose>
          </Span>
        </Paragraph>
      </xsl:for-each>
    </Section>
  </xsl:template>
  <xsl:template name="cautionsRef">
    <Section>
      <xsl:for-each select="key('cautionRefs',.)">
        <Paragraph FontSize="14" Foreground="{$autoTextColor}" FontWeight="Normal">
          <Span>
            <Run FontWeight="Bold" Foreground="{$securityClassificationColor}">⚠</Run>
            <Run FontWeight="Bold">
              <xsl:text>&#160;</xsl:text>
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_caution_ref','comtemp.xslt')"></xsl:value-of>
            </Run>
            <Run>
              <xsl:text>&#160;</xsl:text>
            </Run>
            <Run Event="AttributeEditor" Foreground="{$refColor}" MouseCursor="Hand" FontWeight="Bold">
              <xsl:value-of select="@id" />
            </Run>
            <Run> (</Run>
            <Run>
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_ref_navigation','prettyUpdate.xslt')"></xsl:value-of>
            </Run>
            <Hyperlink Foreground="{$refColor}">
              <xsl:attribute name="IdRef">
                <xsl:call-template name="id">
                  <xsl:with-param name="context" select="self::*"></xsl:with-param>
                </xsl:call-template>
              </xsl:attribute>
              <Run MouseCursor="Hand" FontWeight="Bold" Foreground="{$refColor}">
                <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_ref_navigation_here','prettyUpdate.xslt')"></xsl:value-of>
              </Run>
            </Hyperlink>
            <Run>)</Run>
            <xsl:choose>
              <xsl:when test="self::caution">
                <Paragraph Foreground="Gray" Margin="17,0,0,0">
                  <Run>
                    <xsl:value-of select="."></xsl:value-of>
                  </Run>
                </Paragraph>
              </xsl:when>
              <xsl:when test="self::cautionRef">
                <Paragraph Foreground="Gray" Margin="17,0,0,0">
                  <Run>
                    <xsl:value-of select="xef:GetCautionTextFromRep(@cautionIdentNumber)"></xsl:value-of>
                  </Run>
                </Paragraph>
              </xsl:when>
            </xsl:choose>
          </Span>
        </Paragraph>
      </xsl:for-each>
    </Section>
  </xsl:template>
  <xsl:template name="securityClassification">
      <Section FontStyle="Italic" FontSize="10" Foreground="{$securityClassificationColor}">
        <Run>
          <xsl:text>■ </xsl:text>
        </Run>
        <Span Event="AttributeEditor" MouseCursor="Hand">
          <Run>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_security','comtemp.xslt')"></xsl:value-of>
            <xsl:text>: </xsl:text>
          </Run>
          <Run>
            <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'securityClassification',.)"></xsl:value-of>
          </Run>
        </Span>
      </Section>
  </xsl:template>
  <xsl:template name="commercialClassification">
      <Section FontStyle="Italic" FontSize="10" Foreground="{$commercialClassificationColor}">
        <Run>
          <xsl:text>■ </xsl:text>
        </Run>
        <Span Event="AttributeEditor" MouseCursor="Hand">
          <Run>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_commercial_classification','prettyUpdate.xslt')"></xsl:value-of>
            <xsl:text>: </xsl:text>
          </Run>
          <Run>
            <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'commercialClassification',.)"></xsl:value-of>
          </Run>
        </Span>
      </Section>
  </xsl:template>
  <xsl:template name="caveat">
      <Section FontStyle="Italic" FontSize="10" Foreground="{$caveatColor}">
        <Run>
          <xsl:text>■ </xsl:text>
        </Run>
        <Span Event="AttributeEditor" MouseCursor="Hand">
          <Run>
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_prettyUpdate_caveat','prettyUpdate.xslt')"></xsl:value-of>
            <xsl:text>: </xsl:text>
          </Run>
          <Run>
            <xsl:value-of select="xef:GetConfigurableAttribute($doc_language,$doc_country,'caveat',.)"></xsl:value-of>
          </Run>
        </Span>
      </Section>
  </xsl:template>
  <xsl:template name="learningNumber">
    <xsl:for-each select="ancestor-or-self::*[ancestor::*[self::learningPlan or self::learningOverview or self::learningSummary or self::learningAssessment]]">
      <xsl:sort select="count(ancestor::*)" data-type="number"></xsl:sort>
      <xsl:value-of select="count(preceding-sibling::*[not(self::title) and not(self::description) and  not(self::shortDescr)])+1"></xsl:value-of>
      <xsl:if test="position()!=last()">.</xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="isolationVariantNumbering">
    <xsl:for-each select="ancestor::isolationStep">
      <xsl:call-template name="isolationStepNumbering"></xsl:call-template>
    </xsl:for-each>
    <xsl:text>.</xsl:text>
    <xsl:choose>
      <xsl:when test="self::yesAnswer">
        <xsl:text>1</xsl:text>
      </xsl:when>
      <xsl:when test="self::noAnswer">
        <xsl:text>2</xsl:text>
      </xsl:when>
      <xsl:when test="self::choice">
        <xsl:value-of select="count(preceding-sibling::choice)+1"></xsl:value-of>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="isolationStepNumbering">
    <xsl:choose>
      <xsl:when test="parent::isolationStepAlts or parent::isolationProcedureEndAlts">
        <xsl:for-each select="parent::*">
          <xsl:value-of select="count(preceding-sibling::isolationStep)+count(preceding-sibling::isolationProcedureEnd)+count(preceding-sibling::isolationStepAlts)+count(preceding-sibling::isolationProcedureEndAlts)+1"></xsl:value-of>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count(preceding-sibling::isolationStep)+count(preceding-sibling::isolationProcedureEnd)+count(preceding-sibling::isolationStepAlts)+count(preceding-sibling::isolationProcedureEndAlts)+1"></xsl:value-of>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="objectiveNumbering">
    <xsl:for-each select="ancestor-or-self::*[ancestor::lcLearningObjectives]">
      <xsl:sort select="count(ancestor::*)" data-type="number"></xsl:sort>
      <xsl:value-of select="count(preceding-sibling::*[not(self::title) and not(self::description) and not(self::lcContentIdentifierName) and not(self::dmRef)])+1"></xsl:value-of>
      <xsl:if test="position()!=last()">.</xsl:if>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="pmEntryNumber">
    <xsl:number level="multiple" format="1.1" />
  </xsl:template>
  <xsl:template name="checkListStepNumber">
    <xsl:number level="multiple" format="1.1" />
  </xsl:template>

				
  <xsl:template name="levelledParaNumber">
    <xsl:param name="node" select="." />
    <xsl:param name="number">
      <xsl:choose>
        <xsl:when test="parent::levelledParaAlts">
          <xsl:value-of select="count($node/parent::levelledParaAlts/preceding-sibling::*[self::levelledPara[not(parent::levelledParaAlts)] or self::levelledParaAlts])+1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="count($node/preceding-sibling::*[self::levelledPara[not(parent::levelledParaAlts)] or self::levelledParaAlts])+1" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:variable name="c">
      <xsl:choose>
        <xsl:when test="$node/parent::levelledPara[parent::levelledParaAlts]">
          <xsl:value-of select="count($node/parent::levelledPara/parent::levelledParaAlts/preceding-sibling::*[self::levelledPara[not(parent::levelledParaAlts)] or self::levelledParaAlts])+1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="count($node/parent::*/preceding-sibling::*[self::levelledPara[not(parent::levelledParaAlts)] or self::levelledParaAlts])+1" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$node/parent::levelledParaAlts">
        <xsl:call-template name="levelledParaNumber">
          <xsl:with-param name="node" select="$node/parent::levelledParaAlts" />
          <xsl:with-param name="number" select="$number" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$node/parent::levelledPara">
        <xsl:call-template name="levelledParaNumber">
          <xsl:with-param name="node" select="$node/parent::levelledPara" />
          <xsl:with-param name="number" select="concat($c,'.',$number)" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$number" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="proceduralStepNumber">
    <xsl:param name="node" select="." />
    <xsl:param name="number">
      <xsl:choose>
        <xsl:when test="parent::proceduralStepAlts">
          <xsl:value-of select="count($node/parent::proceduralStepAlts/preceding-sibling::*[self::proceduralStep[not(parent::proceduralStepAlts)] or self::proceduralStepAlts])+1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="count($node/preceding-sibling::*[self::proceduralStep[not(parent::proceduralStepAlts)] or self::proceduralStepAlts])+1" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:variable name="c">
      <xsl:choose>
        <xsl:when test="$node/parent::proceduralStep[parent::proceduralStepAlts]">
          <xsl:value-of select="count($node/parent::proceduralStep/parent::proceduralStepAlts/preceding-sibling::*[self::proceduralStep[not(parent::proceduralStepAlts)] or self::proceduralStepAlts])+1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="count($node/parent::*/preceding-sibling::*[self::proceduralStep[not(parent::proceduralStepAlts)] or self::proceduralStepAlts])+1" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$node/parent::proceduralStepAlts">
        <xsl:call-template name="proceduralStepNumber">
          <xsl:with-param name="node" select="$node/parent::proceduralStepAlts" />
          <xsl:with-param name="number" select="$number" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$node/parent::proceduralStep">
        <xsl:call-template name="proceduralStepNumber">
          <xsl:with-param name="node" select="$node/parent::proceduralStep" />
          <xsl:with-param name="number" select="concat($c,'.',$number)" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$number" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="commonInfoDescrParaNumber">
    <xsl:param name="node" select="." />
    <xsl:param name="number">
      <xsl:choose>
        <xsl:when test="parent::commonInfoDescrParaAlts">
          <xsl:value-of select="count($node/parent::commonInfoDescrParaAlts/preceding-sibling::*[self::commonInfoDescrPara[not(parent::commonInfoDescrParaAlts)] or self::commonInfoDescrParaAlts])+1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="count($node/preceding-sibling::*[self::commonInfoDescrPara[not(parent::commonInfoDescrParaAlts)] or self::commonInfoDescrParaAlts])+1" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:param>
    <xsl:variable name="c">
      <xsl:choose>
        <xsl:when test="$node/parent::commonInfoDescrPara[parent::commonInfoDescrParaAlts]">
          <xsl:value-of select="count($node/parent::commonInfoDescrPara/parent::commonInfoDescrParaAlts/preceding-sibling::*[self::commonInfoDescrPara[not(parent::commonInfoDescrParaAlts)] or self::commonInfoDescrParaAlts])+1" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="count($node/parent::*/preceding-sibling::*[self::commonInfoDescrPara[not(parent::commonInfoDescrParaAlts)] or self::commonInfoDescrParaAlts])+1" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:choose>
      <xsl:when test="$node/parent::commonInfoDescrParaAlts">
        <xsl:call-template name="commonInfoDescrParaNumber">
          <xsl:with-param name="node" select="$node/parent::commonInfoDescrParaAlts" />
          <xsl:with-param name="number" select="$number" />
        </xsl:call-template>
      </xsl:when>
      <xsl:when test="$node/parent::commonInfoDescrPara">
        <xsl:call-template name="commonInfoDescrParaNumber">
          <xsl:with-param name="node" select="$node/parent::commonInfoDescrPara" />
          <xsl:with-param name="number" select="concat($c,'.',$number)" />
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$number" />
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:template name="id">
    <xsl:param name="context" />
    <xsl:for-each select="$context[1]">
      <xsl:value-of select="xef:GetId(.)"></xsl:value-of>
    </xsl:for-each>
  </xsl:template>
  <xsl:template name="crewNumber">
    <xsl:value-of select="xef:getCrewDrillStepNumber(.)" />
  </xsl:template>
  <xsl:template name="idtemplate">
    <xsl:attribute name="p">
      <xsl:value-of select="xef:GetId(.)"></xsl:value-of>
    </xsl:attribute>
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
      <Run Name="tagWithName" FontFamily="LPTAG" Foreground="#507DBE" FontSize="18" FontWeight="Normal" Visibility="Collapsed">(<xsl:value-of select="name()"></xsl:value-of>]</Run>
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
      <Run Name="endTag" FontFamily="LPTAG" Foreground="#507DBE" FontSize="18" FontWeight="Normal" Visibility="Collapsed">=</Run>
      <Run cursor="After" IsEditable="True">
        <xsl:attribute name="TextAllowed">
          <xsl:call-template name="pta"></xsl:call-template>
        </xsl:attribute>
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
</xsl:stylesheet>