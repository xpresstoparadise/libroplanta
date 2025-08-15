<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="wiringFields">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_wiring_fields','wrngfields.xslt')"></xsl:value-of>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="descrWire">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_data_fields_description','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="descrHarness">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_harness_data_fields_description','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="descrElectricalEquip">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_electrical_equipment_data_fields_description','comtemp.xslt')"></xsl:value-of>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="descrStandardPartGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_standard_parts_data_fields_description','wrngfields.xslt')"></xsl:value-of>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="descrStandardPartGroup">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_standard_parts_data_fields_description','wrngfields.xslt')"></xsl:value-of>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="descrConnector|descrDistributionPart|descrAccessory|descrSolderSleeve|descrShrinkSleeve|descrIdentSleeve|descrConduit|descrWireMaterial">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="16" Margin="0,5,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:choose>
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
          </xsl:choose>
        </Run>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="pta"></xsl:call-template>
          </xsl:attribute>
        </Run>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="descrWire/*|  descrStandardPartGroup/*[not(self::descrConnector) and not(self::descrDistributionPart) and not(self::descrAccessory) and not(self::descrSolderSleeve) and not(self::descrShrinkSleeve) and not(self::descrIdentSleeve) and not(self::descrConduit) and not(self::descrWireMaterial)]|  descrElectricalEquip/*|  descrHarness/*|  descrConnector/*|  descrDistributionPart/*|  descrAccessory/*|  descrSolderSleeve/*|  descrShrinkSleeve/*|  descrIdentSleeve/*|  descrConduit/*|  descrWireMaterial/*">
    <Section Margin="0,3,0,0">
      <xsl:call-template name="idtemplate" />
      <Paragraph FontSize="14">
        <xsl:call-template name="before"></xsl:call-template>
        <Run Foreground="{$autoTextColor}" FontWeight="Bold">
          <xsl:choose>
            <xsl:when test="self::descrCircuitIdent">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_circuit_ident','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireNumber">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_number','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSectionIdent">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_connection','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireType">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_type','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireGauge">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_wire_guages','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrPartNumber">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_part_number','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrHarnessIdent">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_harness_identification','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireSeqNumber">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_sequential_number','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireInfoCircuitIdent">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_wire_info_circuit_ident','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireInfoSectionIdent">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_wire_info_section_ident','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrEmcCode">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_electromagnetic_compatibility_code','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrLength">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_length','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireColor">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_color','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrTwist">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_twist','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrCoaxialCableFlag">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_coaxial','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrTriaxialCableFlag">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_tri_axial','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSignalInfo">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_signal_info','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrFunctionalItemRef">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_item_ref','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrContact">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_contact','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireConnectionCode">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_connection_code','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrNetworkAnalysisCode">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_network_analysis_code','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrGroupCode">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_group_code','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrScreen">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_screen','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrPreparationInfo">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_preparation_info','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrFinishingInfo">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_finishing_info','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrResponsiblePartnerCompany">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_responsible_partner_company','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrRouting">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_routing','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrFeedThru">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_feed_through','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWireRoute">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_route_lane_code','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrRestriction">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wire_restriction','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrNextHigherAssy">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_next_higher_assembly','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrFunctionalDescrRef">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_functional_description_references','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrIllustrationRef">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_illustration_references','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrAltPartNumber">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_alt_part_number','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrManufacturerCode">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_manufacturer_code','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrHarnessVariantIdent">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_harness_variant','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrHarnessVariantIssue">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_harness_issue','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrHarnessName">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_harness_name','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMinTemperature">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_minimum_temperature','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMaxTemperature">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_maximum_temperature','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrHarnessEnvironment">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_harness_environment','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSleeve">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sleeve','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrInstallationLocation">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_installation_location','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrAccessDoorOrPanel">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_access_door_or_panel','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrAssy">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_assy_info','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrPositionOnNextHigherAssy">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_position_on_next_higher_assembly','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMaxMountingPositions">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_max_mounting_position','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSystemBreakdownCode">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_system_breakdown_code','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSiblingPlugIdent">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_sibling_plug_ident','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrTransverseLink">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_transverse_link','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrConnectionListClass">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_connection_list_class','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrElectricalContact">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_electrical_contact','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrElectricalStateDescr">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_electrical_state','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrEquipName">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_electrical_equipment_name','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrReqQuantity">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_req_quantity','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrEquipDescrRef">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_electrical_equipment_description_reference','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMass">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_mass','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrOrientation">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_orientation','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrRack">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_rack','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrContactCount">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_contact_count','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrContactDiameter">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_contact_diameter','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrThermoCouplePlus">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_thermocouple_plus','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrThermoCoupleMinus">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_thermocouple_minus','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSpecialTerminal">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_special_terminal','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrTerminationModuleGroupingValue">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_termination_module_grouping','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrBlockGroupingValue">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_block_grouping','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrShuntGroupingValue">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_shunt_grouping','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrAccessoryPartNumber">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_accessory_part_number','wrngfields.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrContactSize">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_contact_size','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMaterial">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_material','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSurfaceProtection">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_surface_protection','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMinDiameter">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_min_diameter','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMaxDiameter">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_max_diameter','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrSize">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_size','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMinHarnessSize">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_min_harness_size','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrMaxHarnessSize">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_max_harness_size','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrWallThickness">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_wall_thickness','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrNumberOfCores">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_number_of_cores','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrOuterJacketColor">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_outer_jacket_color','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrOuterDiameter">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_outer_diameter','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrResistance">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_resistance','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrVoltage">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_voltage','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrAmperage">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_amperage','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrScreenCount">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_screen_count','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrImpedance">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_impedance','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrFrequency">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_frequency','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
            <xsl:when test="self::descrAttenuation">
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_attenuation','comtemp.xslt')"></xsl:value-of>
            </xsl:when>
          </xsl:choose>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
    </Section>
  </xsl:template>
  <xsl:template match="fieldName">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_wrngfields_field_name','wrngfields.xslt')"></xsl:value-of>
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
  <xsl:template match="wiringFields//descr">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="before"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer" FontWeight="Bold">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Run Foreground="{$autoTextColor}">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_description','comtemp.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
</xsl:stylesheet>