<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignCriterion" hint="Represents a campaign level criterion (either keyword or placement)." extends="utils">

<cfproperty name="campaignId" required="no" type="long" hint="The campaign that the criterion is in. This field can be selected using the value 'CampaignId'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="criterion" required="no" type="Criterion" hint="The criterion part of the campaign criterion. This field is required and should not be null." seq="2">
<cfproperty name="CampaignCriterion_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of CampaignCriterion of this instance. It is ignored on input, and instead xsi:type should be specified." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCampaignId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignId']" default="">
	<cfreturn variables["instance"]["campaignId"]>
	
</cffunction>

<cffunction name="setCampaignId" access="public" returntype="void" output="No">
<cfargument name="campaignId" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignId"]=arguments["campaignId"]>
		
</cffunction>

<cffunction name="getCriterion" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criterion']" default="">
	<cfreturn variables["instance"]["criterion"]>
	
</cffunction>

<cffunction name="setCriterion" access="public" returntype="void" output="No">
<cfargument name="criterion" required="Yes" type="any">
	
	<cfset variables["instance"]["criterion"]=arguments["criterion"]>
		
</cffunction>

<cffunction name="getCampaignCriterionType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['CampaignCriterion_Type']" default="">
	<cfreturn variables["instance"]["CampaignCriterion_Type"]>
	
</cffunction>

<cffunction name="setCampaignCriterionType" access="public" returntype="void" output="No">
<cfargument name="CampaignCriterion_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["CampaignCriterion_Type"]=arguments["CampaignCriterion_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
