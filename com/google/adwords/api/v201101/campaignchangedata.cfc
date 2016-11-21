<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignChangeData" hint="Holds information about a changed campaign and any adgroups under that have changed." extends="utils">

<cfproperty name="campaignId" required="no" type="long" hint="The campaign Id." seq="1">
<cfproperty name="campaignChangeStatus" required="no" type="string" hint="Whether or not the fields of this campaign have changed. Changes to campaign level criteria and ad extensions are enumerated in their respective lists and will not be reflected in this status." seq="2">
<cfproperty name="changedAdGroups" required="no" type="AdGroupChangeData[]" hint="A list of change information for all changed adgroups belonging to the campaign." seq="3">
<cfproperty name="addedCampaignCriteria" required="no" type="long[]" hint="A list of criteria ids that have been added as campaign criteria. This list includes any criteria that can be downloaded using CampaignCriterionService." seq="4">
<cfproperty name="deletedCampaignCriteria" required="no" type="long[]" hint="A list of criteria ids that have been deleted as campaign criteria. This list includes any criteria that can be downloaded using CampaignCriterionService." seq="5">
<cfproperty name="addedAdExtensions" required="no" type="long[]" hint="A list of ad extension ids that have been added to the campaign." seq="6">
<cfproperty name="deletedAdExtensions" required="no" type="long[]" hint="A list of ad extension ids that have been removed from the campaign." seq="7">
<cfproperty name="campaignTargetingChanged" required="no" type="boolean" hint="Whether there have been campaign targeting changes." seq="8">

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

<cffunction name="getCampaignChangeStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignChangeStatus']" default="">
	<cfreturn variables["instance"]["campaignChangeStatus"]>
	
</cffunction>

<cffunction name="setCampaignChangeStatus" access="public" returntype="void" output="No">
<cfargument name="campaignChangeStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignChangeStatus"]=arguments["campaignChangeStatus"]>
		
</cffunction>

<cffunction name="getChangedAdGroups" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['changedAdGroups']" default="">
	<cfreturn variables["instance"]["changedAdGroups"]>
	
</cffunction>

<cffunction name="setChangedAdGroups" access="public" returntype="void" output="No">
<cfargument name="changedAdGroups" required="Yes" type="any">
	
	<cfset variables["instance"]["changedAdGroups"]=arguments["changedAdGroups"]>
		
</cffunction>

<cffunction name="getAddedCampaignCriteria" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['addedCampaignCriteria']" default="">
	<cfreturn variables["instance"]["addedCampaignCriteria"]>
	
</cffunction>

<cffunction name="setAddedCampaignCriteria" access="public" returntype="void" output="No">
<cfargument name="addedCampaignCriteria" required="Yes" type="any">
	
	<cfset variables["instance"]["addedCampaignCriteria"]=arguments["addedCampaignCriteria"]>
		
</cffunction>

<cffunction name="getDeletedCampaignCriteria" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['deletedCampaignCriteria']" default="">
	<cfreturn variables["instance"]["deletedCampaignCriteria"]>
	
</cffunction>

<cffunction name="setDeletedCampaignCriteria" access="public" returntype="void" output="No">
<cfargument name="deletedCampaignCriteria" required="Yes" type="any">
	
	<cfset variables["instance"]["deletedCampaignCriteria"]=arguments["deletedCampaignCriteria"]>
		
</cffunction>

<cffunction name="getAddedAdExtensions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['addedAdExtensions']" default="">
	<cfreturn variables["instance"]["addedAdExtensions"]>
	
</cffunction>

<cffunction name="setAddedAdExtensions" access="public" returntype="void" output="No">
<cfargument name="addedAdExtensions" required="Yes" type="any">
	
	<cfset variables["instance"]["addedAdExtensions"]=arguments["addedAdExtensions"]>
		
</cffunction>

<cffunction name="getDeletedAdExtensions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['deletedAdExtensions']" default="">
	<cfreturn variables["instance"]["deletedAdExtensions"]>
	
</cffunction>

<cffunction name="setDeletedAdExtensions" access="public" returntype="void" output="No">
<cfargument name="deletedAdExtensions" required="Yes" type="any">
	
	<cfset variables["instance"]["deletedAdExtensions"]=arguments["deletedAdExtensions"]>
		
</cffunction>

<cffunction name="getCampaignTargetingChanged" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignTargetingChanged']" default="">
	<cfreturn variables["instance"]["campaignTargetingChanged"]>
	
</cffunction>

<cffunction name="setCampaignTargetingChanged" access="public" returntype="void" output="No">
<cfargument name="campaignTargetingChanged" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignTargetingChanged"]=arguments["campaignTargetingChanged"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/ch/v201101">
	
</cffunction>	

</cfcomponent>
