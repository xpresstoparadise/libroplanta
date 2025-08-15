<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:xef="http://www.libroplanta.com/xmlEditorFunctions" xmlns:dc="http://www.purl.org/dc/elements/1.1/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:xlink="http://www.w3.org/1999/xlink">
  <xsl:import href="idstatus.xslt"></xsl:import>
  <xsl:import href="comtemp.xslt"></xsl:import>
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="no" />
  <xsl:param name="namedTemplate"></xsl:param>
  <xsl:template match="learning">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning','learning.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
	<xsl:template match="shortDescr">
		<Paragraph>
			<xsl:call-template name="idtemplate" />
			<Span Id="ChildrenAttributesContainer">
				<xsl:apply-templates select="@*"></xsl:apply-templates>
			</Span>
			<xsl:call-template name="beforeSetBlock"></xsl:call-template>
			<Span Id="ChildrenNodesContainer" FontWeight="Bold">
				<xsl:apply-templates select="node()"></xsl:apply-templates>
			</Span>
			<xsl:call-template name="afterSetBlock"></xsl:call-template>
		</Paragraph>
	</xsl:template>
	<xsl:template match="learningPlan">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_plan','learning.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="learning//title">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="beforeSetInline"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetInline"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="lcCorrectResponse">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template match="hotspot/lcCorrectResponse">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <xsl:call-template name="first"></xsl:call-template>
      <Span FontSize="14" Foreground="Green" FontWeight="Bold">
        <Run>☑</Run>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="last"></xsl:call-template>
      <xsl:call-template name="after"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="lcAnswerOptionContent|lcSequence">
    <Span>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Span>
  </xsl:template>
  <xsl:template name="learning_formatter">
    <xsl:param name="mark"></xsl:param>
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$autoTextColor}" FontWeight="Bold">
        <Update>
          <Attribute Name="FontSize" XPath="if (count(ancestor-or-self::*[ancestor::*[self::learningPlan or self::learningOverview or self::learningSummary or self::learningAssessment]])=0) then '16' else '14'" Context="Self"></Attribute>
        </Update>
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" Template="learningNumber" Context="Self"></Attribute>
          </Update>
          <xsl:call-template name="before"></xsl:call-template>
          <Span Foreground="{$autoTextColor}" FontWeight="Bold">
            <Update>
              <Attribute Name="FontSize" XPath="if (count(ancestor-or-self::*[ancestor::*[self::learningPlan or self::learningOverview or self::learningSummary or self::learningAssessment]])=0) then '16' else '14'" Context="Self"></Attribute>
            </Update>
            <Run>
              <xsl:value-of select="$mark"></xsl:value-of>
            </Run>
          </Span>
          <xsl:call-template name="first"></xsl:call-template>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" FontSize="14" Foreground="{$textColor}" FontWeight="Normal" Margin="80,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Section>
    </Section>
  </xsl:template>
  <xsl:template match="description[parent::lcInstruction or parent::learningContent or parent::learningSummary or parent::lcContentIdentifierName or parent::lcObjectiveItem or parent::lcObjectiveItemGroup or parent::lcAnswerOptionContent or parent::lcItem or parent::lcMatchingItem or parent::lcFeedbackItem]">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="description[not(parent::content) and not(parent::lcInstruction) and not(parent::learningContent) and not(parent::learningSummary) and not(parent::lcContentIdentifierName) and not(parent::lcObjectiveItem) and not(parent::lcObjectiveItemGroup) and not(parent::lcAnswerOptionContent) and not(parent::lcItem) and not(parent::lcMatchingItem) and not(parent::lcFeedbackItem)]">
    <Span>
      <xsl:call-template name="idtemplate" />
      <xsl:call-template name="beforeSetBlock"></xsl:call-template>
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <Span Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Span>
  </xsl:template>
  <xsl:template match="lcProject">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_project','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcClient">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_client','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcLearningPlan">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_plan','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcCourseIdentNumber">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_course_identification_number','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcModificationDate">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_modification_date','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcDeliveryDate">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_delivery_date','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPlanSubject">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_plan_subject','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPerformanceAnalysis">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_performance_analysis','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcOrganizationalAnalysis">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_organizational_analysis','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcVisionStatement">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_vision_statement','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcMissionStatement">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_mission_statement','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcValues">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_values','comtemp.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcGoalStatement">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_goal_statement','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcObjectiveStatement">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_objective_statement','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcGapAnalysis">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_gap_analysis','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcGapItem">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_gap_item','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcDesiredPerformanceStatement">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_desired_performance_statement','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcActualPerformanceStatement">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_actual_performance_statement','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPlanObjective">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_plan_objective','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcJtaItem">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_job_task_analysis_item','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcGapStatement">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_gap_statement','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcOrganizationalEnvironmentAnalysis">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_organizational_environment_analysis','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcWorkEnvironmentAnalysis">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_work_environment_analysis','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcManagerialSupport">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_managerial_support','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPhysicalAspectsOfSite">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_physical_aspects_of_site','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcSocialAspectsOfSite">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_social_aspects_of_site','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcSpecialFactors">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_special_factors','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPerformerAnalysis">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_performer_analysis','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcJobTitle">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_job_title','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcJobCode">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_job_code','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcEducationLevel">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_education_level','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcAge">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_age','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcProfessionalBackground">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_professional_background','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcKnowledge">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_knowledge','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcSkills">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_skills','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcAbilities">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_abilities','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcAttitude">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_attitude','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcCauseAnalysis">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_cause_analysis','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcEnvironmentalFactor">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_environmental_factor','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcData">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_data','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcResources">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_resources','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcIncentives">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_incentives','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcInternalFactor">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_internal_factor','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcCapacity">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_capacity','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcMotives">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_motives','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcInterventionDefinition">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_intervention_definition','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcNonTrainingInterventions">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_non_training_interventions','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPerformanceSupport">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_performance_support','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcJobDesign">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_job_design','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPersonalDevelopment">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_personal_development','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcHumanResourceDevelopment">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_human_resource_development','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcOrganizationalCommunication">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_organizational_communication','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcOrganizationalDesign">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_organizational_design','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcTrainingInterventions">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_training_interventions','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcTargetAudience">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_target_audience','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcCurrentEntryBehaviors">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_current_entry_behaviors','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcAttitudeTowardContent">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_attitude_toward_content','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcLearningPreferences">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_preferences','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPrerequisites">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_prerequisites','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcRequiredEntryBehaviors">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_required_entry_behaviors','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcTrainingComponent">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_training_component','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcTrainingType">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_training_type','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcLearningStrategy">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_strategy','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcDuration">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_duration','comtemp.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcTime">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_time','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcRequiredFinances">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_required_finances','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcRequiredPersonnel">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_required_personnel','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcRequiredFacilities">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_required_facilities','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcRequiredEquipment">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_required_equipment','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcLocalCultureConsiderations">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_local_culture_considerations','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcAssessmentStrategy">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_assessment_strategy','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcAssessmentComponent">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_assessment_component','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcMasteryScoreCriteria">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_mastery_score_criteria','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPerformanceRubric">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_performance_rubric','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcScoringMethod">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_scoring_method','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcMinimumPassThreshold">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_minimum_pass_threshold','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcTechnicalRqmts">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_technical_requirements','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcBrowsers">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_browsers','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcLms">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_lms','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcNonLmsItEnvironment">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_non_lms_environment','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPaperBasedMaterials">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_paper_based_materials','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcClassroom">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_classroom','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcOjt">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_on_the_job_training','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcAccessibility">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_accessibility','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPlayers">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_players','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcGraphicStandards">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_graphic_standards','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcViewers">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_viewers','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcResolution">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_resolution','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcFileSizeLimitations">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_file_size_limitations','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcDownloadTime">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_download_time','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcSecurity">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_security','comtemp.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcLearningObjectives">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_objectives','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcInterventionImplementation">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_intervention_implementation','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcPerformanceEvaluation">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_performance_evaluation','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcFormativeEvaluation">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_formative_evaluation','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcSummativeEvaluation">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_summative_evaluation','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcImmediatePerformanceCompetence">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_immediate_performance_competence','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcJobTransfer">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_job_transfer','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcOrganizationalImpact">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_organizational_impact','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <!-- 
		<Span>
			<xsl:call-template name="idtemplate"/>
			<Span Id="ChildrenAttributesContainer">
				<xsl:apply-templates select="@*"></xsl:apply-templates>
			</Span>
			<xsl:call-template name="beforeSetInline"></xsl:call-template>
			<Span Id="ChildrenNodesContainer" FontWeight="Bold">
				<xsl:apply-templates select="node()"></xsl:apply-templates>
			</Span>
			<xsl:call-template name="afterSetInline"></xsl:call-template>
		</Span>
	
	
	parent::lcLearningObjectives -->
  <xsl:template match="lcObjectiveItem|lcObjectiveItemGroup">
    <xsl:variable name="mark">
      <xsl:choose>
        <xsl:when test="self::lcObjectiveItem">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_objective_item','learning.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcObjectiveItemGroup">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_objective_items_group','learning.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$autoTextColor}">
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" Template="objectiveNumbering" Context="Self"></Attribute>
          </Update>
          <Span Foreground="{$autoTextColor}">
            <Run>
              <xsl:value-of select="$mark"></xsl:value-of>
            </Run>
          </Span>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" FontSize="14" Foreground="{$textColor}" FontWeight="Normal" Margin="80,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Section>
    </Section>
  </xsl:template>
  <xsl:template match="learningOverview">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_overview','learning.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="lcAudience">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_audience','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcEntryBehavior">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_entry_behavior','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcSection">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_section','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="learningContent">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_content','learning.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="lcInstruction">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_instruction','learning.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="learningSummary">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_summary','learning.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="lcSummary">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_summary','comtemp.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcReview">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_review','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcNextSteps">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_next_steps','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="learningAssessment">
    <Section>
      <xsl:call-template name="idtemplate" />
      <Paragraph TextAlignment="Center" FontSize="18" Padding="0,15,0,0">
        <xsl:call-template name="before"></xsl:call-template>
        <Run FontStyle="Italic" FontWeight="Bold" Foreground="{$autoTextColor}">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_learning_assessment','learning.xslt')"></xsl:value-of>
        </Run>
        <xsl:call-template name="first"></xsl:call-template>
      </Paragraph>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates></xsl:apply-templates>
      </Paragraph>
      <xsl:call-template name="afterSetBlock"></xsl:call-template>
    </Section>
  </xsl:template>
  <xsl:template match="lcIntro">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_introduction','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcInteraction">
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_interaction','learning.xslt')"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="@shuffle">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text>◉ </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_shuffle','learning.xslt')"></xsl:value-of>
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
  <xsl:template match="@weightingFactor">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text>◉ </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_weighting_factor','learning.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>&#160;</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@attempts">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text>◉ </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_attempts','learning.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>&#160;</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="lcTrueFalse|lcSingleSelect|lcMultipleSelect|lcSequencing|lcMatching|lcHotspot|lcCompletion|lcDragAndDrop">
    <xsl:variable name="qtype">
      <xsl:choose>
        <xsl:when test="self::lcTrueFalse">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_true_false','learning.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcSingleSelect">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_single_select','learning.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcMultipleSelect">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_multiple_select','learning.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcSequencing">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_sequencing','learning.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcMatching">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_matching','learning.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcHotspot">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_comtemp_hotspot','comtemp.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcCompletion">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_completion','learning.xslt')"></xsl:value-of>
        </xsl:when>
        <xsl:when test="self::lcDragAndDrop">
          <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_drag_and_drop','learning.xslt')"></xsl:value-of>
        </xsl:when>
      </xsl:choose>
    </xsl:variable>
    <xsl:call-template name="learning_formatter">
      <xsl:with-param name="mark" select="$qtype"></xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template match="lcQuestion">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_question','learning.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="lcAsset">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_asset','learning.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Span Id="ChildrenNodesContainer" FontWeight="Bold">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Span>
    </Paragraph>
  </xsl:template>
  <xsl:template match="lcAnswerOptionGroup">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_answers','learning.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
  <xsl:template match="lcSequenceOptionGroup">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_sequence_items','learning.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
  <xsl:template match="lcAnswerOption">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" FontWeight="Bold">
        <Update>
          <Attribute Name="Foreground" XPath="if (lcCorrectResponse) then 'Green' else 'Red'" Context="Self"></Attribute>
        </Update>
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" XPath="if (lcCorrectResponse) then '☑' else '☒'" Context="Self"></Attribute>
          </Update>
          <xsl:call-template name="before"></xsl:call-template>
          <Span FontSize="14" Foreground="{$autoTextColor}" FontWeight="Normal">
            <Run>
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_answer_variant','learning.xslt')"></xsl:value-of>
            </Run>
          </Span>
          <xsl:call-template name="first"></xsl:call-template>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" FontSize="14" Foreground="{$textColor}" FontWeight="Normal" Margin="80,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Section>
    </Section>
  </xsl:template>
  <xsl:template match="lcFeedbackItemGroup">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_feedbacks','learning.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
  <xsl:template match="lcFeedbackItem">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_feedback_item','learning.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer" Margin="17,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
  <xsl:template match="@attempMatch">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text>◉ </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_attempt_match','learning.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="."></xsl:value-of>
        <xsl:text>&#160;</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="@feedBackStatus">
    <Span FontWeight="Normal">
      <xsl:call-template name="idtemplate" />
      <Run Foreground="{$autoTextColor}">
        <xsl:text>◉ </xsl:text>
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_feedback_status','learning.xslt')"></xsl:value-of>
        <xsl:text>: </xsl:text>
      </Run>
      <Run Event="AttributeEditor" MouseCursor="Hand" Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:choose>
          <xsl:when test=".='fbCorrect'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_correct','learning.xslt')"></xsl:value-of>
          </xsl:when>
          <xsl:when test=".='fbIncorrect'">
            <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_incorrect','learning.xslt')"></xsl:value-of>
          </xsl:when>
        </xsl:choose>
        <xsl:text>&#160;</xsl:text>
      </Run>
    </Span>
  </xsl:template>
  <xsl:template match="lcSequenceOption">
    <Section Margin="0,5,0,0">
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*" />
      </Span>
      <List BindingAndListType="ListItemUnordered" Margin="80,0,0,0" MarkerWidth="80" Foreground="{$autoTextColor}" FontWeight="Bold">
        <ListItem MarkerWidth="80">
          <Update>
            <Attribute Name="MarkerValue" XPath="concat(lcSequence/@lcValue,'')" Context="Self"></Attribute>
          </Update>
          <Span Foreground="{$autoTextColor}">
            <Run>
              <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_sequence_item','learning.xslt')"></xsl:value-of>
            </Run>
          </Span>
        </ListItem>
      </List>
      <Section Id="ChildrenNodesContainer" FontSize="14" Foreground="{$textColor}" FontWeight="Normal" Margin="80,0,0,0">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Section>
    </Section>
  </xsl:template>
  <xsl:template match="lcMatchTable">
    <Table Width="100" BorderCollapse="True">
      <xsl:call-template name="idtemplate" />
      <Column></Column>
      <Column></Column>
      <TableGroup>
        <xsl:apply-templates></xsl:apply-templates>
      </TableGroup>
    </Table>
  </xsl:template>
  <xsl:template match="lcMatchingPair|lcMatchingHeader">
    <Row>
      <xsl:call-template name="idtemplate" />
      <xsl:apply-templates></xsl:apply-templates>
    </Row>
  </xsl:template>
  <xsl:template match="lcItem|lcMatchingItem">
    <Entry Padding="0" BorderThickness="0">
      <xsl:call-template name="idtemplate" />
      <Paragraph>
        <xsl:if test="parent::lcMatchingHeader">
          <xsl:attribute name="FontWeight">Bold</xsl:attribute>
        </xsl:if>
        <Span Id="ChildrenAttributesContainer">
          <xsl:apply-templates select="@*" />
        </Span>
        <Run cursor="First" IsEditable="True">
          <xsl:attribute name="TextAllowed">
            <xsl:call-template name="cta"></xsl:call-template>
          </xsl:attribute>
          <Update>
            <Attribute Name="Collapsed" XPath="not(boolean(./*))" Context="Self"></Attribute>
          </Update>
        </Run>
        <Span Id="ChildrenNodesContainer">
          <xsl:apply-templates></xsl:apply-templates>
        </Span>
      </Paragraph>
    </Entry>
  </xsl:template>
  <xsl:template match="lcHotspotMap">
    <Paragraph>
      <xsl:call-template name="idtemplate" />
      <Span Id="ChildrenAttributesContainer">
        <xsl:apply-templates select="@*"></xsl:apply-templates>
      </Span>
      <xsl:call-template name="before"></xsl:call-template>
      <Run Foreground="{$autoTextColor}" FontWeight="Bold">
        <xsl:value-of select="xef:GetTextGroup($doc_language,$doc_country,'tlp_learning_hotspot_map','learning.xslt')"></xsl:value-of>
      </Run>
      <xsl:call-template name="first"></xsl:call-template>
      <Paragraph Id="ChildrenNodesContainer">
        <xsl:apply-templates select="node()"></xsl:apply-templates>
      </Paragraph>
    </Paragraph>
  </xsl:template>
</xsl:stylesheet>