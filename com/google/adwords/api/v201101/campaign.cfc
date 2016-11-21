<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Campaign" hint="Data representing an AdWords campaign." extends="utils">

<cfproperty name="id" required="no" type="long" hint="ID of this campaign. This field can be selected using the value 'Id'.This field can be filtered on. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored. This field is required and should not be null when it is contained within Operators : SET." seq="1">
<cfproperty name="name" required="no" type="string" hint="Name of this campaign. On add, defaults to Campaign  N. This field can be selected using the value 'Name'.This field can be filtered on. This string must not be empty." seq="2">
<cfproperty name="status" required="no" type="string" hint="Status of this campaign. On add, defaults to ACTIVE. This field can be selected using the value 'Status'.This field can be filtered on." seq="3">
<cfproperty name="servingStatus" required="no" type="string" hint="Serving status. This field can be selected using the value 'ServingStatus'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="startDate" required="no" type="string" hint="Date the campaign begins. On add, defaults to the current day in the parent account's local timezone. This field can be selected using the value 'StartDate'.This field can be filtered on." seq="5">
<cfproperty name="endDate" required="no" type="string" hint="Date the campaign ends. On add, defaults to 20371231, which means the campaign will run indefinitely. To set an existing campaign to run indefinitely, set this field to 20371230. This field can be selected using the value 'EndDate'.This field can be filtered on." seq="6">
<cfproperty name="budget" required="no" type="Budget" hint="Current base budget of campaign; default if no custom budgets are active." seq="7">
<cfproperty name="biddingStrategy" required="no" type="BiddingStrategy" hint="Bidding strategy for this campaign. This field is required when adding a new campaign. To modify an existing campaign's bidding strategy, use CampaignOperation biddingTransition. Note that campaigns must meet specific eligibility requirements before they can use the ConversionOptimizier bidding strategy. This field is required and should not be null when it is contained within Operators : ADD." seq="8">
<cfproperty name="conversionOptimizerEligibility" required="no" type="ConversionOptimizerEligibility" hint="This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="9">
<cfproperty name="campaignStats" required="no" type="CampaignStats" hint="Statistics for this campaign, returned by get() only if CampaignSelector statsSelector is specified. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="10">
<cfproperty name="adServingOptimizationStatus" required="no" type="string" hint="Ad serving optimization status. This field can be selected using the value 'AdServingOptimizationStatus'." seq="11">
<cfproperty name="frequencyCap" required="no" type="FrequencyCap" hint="Frequency cap for this campaign." seq="12">
<cfproperty name="settings" required="no" type="Setting[]" hint="List of settings for the Campaign. This field can be selected using the value 'Settings'." seq="13">
<cfproperty name="networkSetting" required="no" type="NetworkSetting" hint="The network settings for the campaign, to indicate where the campaign will serve." seq="14">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getServingStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['servingStatus']" default="">
	<cfreturn variables["instance"]["servingStatus"]>
	
</cffunction>

<cffunction name="setServingStatus" access="public" returntype="void" output="No">
<cfargument name="servingStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["servingStatus"]=arguments["servingStatus"]>
		
</cffunction>

<cffunction name="getStartDate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['startDate']" default="">
	<cfreturn variables["instance"]["startDate"]>
	
</cffunction>

<cffunction name="setStartDate" access="public" returntype="void" output="No">
<cfargument name="startDate" required="Yes" type="any">
	
	<cfset variables["instance"]["startDate"]=arguments["startDate"]>
		
</cffunction>

<cffunction name="getEndDate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['endDate']" default="">
	<cfreturn variables["instance"]["endDate"]>
	
</cffunction>

<cffunction name="setEndDate" access="public" returntype="void" output="No">
<cfargument name="endDate" required="Yes" type="any">
	
	<cfset variables["instance"]["endDate"]=arguments["endDate"]>
		
</cffunction>

<cffunction name="getBudget" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['budget']" default="">
	<cfreturn variables["instance"]["budget"]>
	
</cffunction>

<cffunction name="setBudget" access="public" returntype="void" output="No">
<cfargument name="budget" required="Yes" type="any">
	
	<cfset variables["instance"]["budget"]=arguments["budget"]>
		
</cffunction>

<cffunction name="getBiddingStrategy" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['biddingStrategy']" default="">
	<cfreturn variables["instance"]["biddingStrategy"]>
	
</cffunction>

<cffunction name="setBiddingStrategy" access="public" returntype="void" output="No">
<cfargument name="biddingStrategy" required="Yes" type="any">
	
	<cfset variables["instance"]["biddingStrategy"]=arguments["biddingStrategy"]>
		
</cffunction>

<cffunction name="getConversionOptimizerEligibility" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversionOptimizerEligibility']" default="">
	<cfreturn variables["instance"]["conversionOptimizerEligibility"]>
	
</cffunction>

<cffunction name="setConversionOptimizerEligibility" access="public" returntype="void" output="No">
<cfargument name="conversionOptimizerEligibility" required="Yes" type="any">
	
	<cfset variables["instance"]["conversionOptimizerEligibility"]=arguments["conversionOptimizerEligibility"]>
		
</cffunction>

<cffunction name="getCampaignStats" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignStats']" default="">
	<cfreturn variables["instance"]["campaignStats"]>
	
</cffunction>

<cffunction name="setCampaignStats" access="public" returntype="void" output="No">
<cfargument name="campaignStats" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignStats"]=arguments["campaignStats"]>
		
</cffunction>

<cffunction name="getAdServingOptimizationStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adServingOptimizationStatus']" default="">
	<cfreturn variables["instance"]["adServingOptimizationStatus"]>
	
</cffunction>

<cffunction name="setAdServingOptimizationStatus" access="public" returntype="void" output="No">
<cfargument name="adServingOptimizationStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["adServingOptimizationStatus"]=arguments["adServingOptimizationStatus"]>
		
</cffunction>

<cffunction name="getFrequencyCap" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['frequencyCap']" default="">
	<cfreturn variables["instance"]["frequencyCap"]>
	
</cffunction>

<cffunction name="setFrequencyCap" access="public" returntype="void" output="No">
<cfargument name="frequencyCap" required="Yes" type="any">
	
	<cfset variables["instance"]["frequencyCap"]=arguments["frequencyCap"]>
		
</cffunction>

<cffunction name="getSettings" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['settings']" default="">
	<cfreturn variables["instance"]["settings"]>
	
</cffunction>

<cffunction name="setSettings" access="public" returntype="void" output="No">
<cfargument name="settings" required="Yes" type="any">
	
	<cfset variables["instance"]["settings"]=arguments["settings"]>
		
</cffunction>

<cffunction name="getNetworkSetting" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['networkSetting']" default="">
	<cfreturn variables["instance"]["networkSetting"]>
	
</cffunction>

<cffunction name="setNetworkSetting" access="public" returntype="void" output="No">
<cfargument name="networkSetting" required="Yes" type="any">
	
	<cfset variables["instance"]["networkSetting"]=arguments["networkSetting"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
