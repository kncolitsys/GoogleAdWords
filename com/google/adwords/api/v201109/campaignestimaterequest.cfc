<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignEstimateRequest" hint="Represents a campaign that will be estimated. Returns traffic estimates for the requested set of campaigns. The campaigns can be all new or all existing, or a mixture of new and existing. Only existing campaigns may contain estimates for existing ad groups. For existing campaigns, the campaign and optionally the ad group will be used as context to produce more accurate estimates. Traffic estimates may only be requested on keywords, so regardless of whether campaign and ad group IDs are provided or left blank, at least one keyword is required to estimate traffic. To make a keyword estimates request in which estimates do not consider existing account information (e.g. historical ad group performance), set campaignId to null." extends="EstimateRequest">

<cfproperty name="campaignId" required="no" type="long" hint="The campaignId of an existing campaign or null. Refer to the CampaignEstimateRequest documentation for detailed usage." seq="2">
<cfproperty name="adGroupEstimateRequests" required="no" type="AdGroupEstimateRequest[]" hint="The list of ad groups to estimate. At least one ad group is required. New campaigns may only contain new ad groups. If an AdGroupEstimateRequest has an adGroupId but the campaign is new, the API will return an error. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="3">
<cfproperty name="criteria" required="no" type="Criterion[]" hint="A list of Criterions to be used for this Campaign. Criteria provide information about geographical and language targeting. Values in this field override the current targets in the Campaign specified by  campaignId by the following mechanism: This field accepts two types of Criterions: Location, which should contain all geographic targeting and Language, which should contain all language targeting. If Locations are passed in, all geographic targeting in the campaign will be overridden. If any Languages are passed in, all language targeting in the campaign will be overridden. If multiple Locations are specified, the traffic estimate will be the sum of the estimates for each targeted area. This means that if criteria are chosen which overlap each other (for example, targeting both a country and a city within that country), the traffic estimate will be be larger than if no overlap were present - i. e., the overlap region will be double-counted in the estimate. If no criteria are specified and this is for a new campaign then it will default to all languages in all countries and territories, and Google search. If no criteria are specified and this is for an existing campaign then the current targeting on that campaign will be used. While there's no solid limit on number of criteria, TrafficEstimatorService may return error with TOO_MANY_TARGETS if the request contains too many criteria across all CampaignEstimateRequests in a TrafficEstimatorSelector. Supported Criteria : Language and Location This field must contain distinct elements. This field must not contain null elements." seq="4">
<cfproperty name="networkSetting" required="no" type="NetworkSetting" hint="A NetworkSetting to be used for this Campaign. The value of this field overrides the current targets in the Campaign specified by  campaignId. Only NetworkSetting targetGoogleSearch and NetworkSetting targetSearchNetwork are supported, they may be combined to sum the estimates. If both request network setting and Campaign's network setting are empty, the default is NetworkSetting targetGoogleSearch." seq="5">
<cfproperty name="dailyBudget" required="no" type="Money" hint="Daily campaign budget to use in traffic estimation. If not specified, the daily budget is unlimited." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setEstimateRequestType("CampaignEstimateRequest")>

<cffunction name="getCampaignId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignId']" default="">
	<cfreturn variables["instance"]["campaignId"]>
	
</cffunction>

<cffunction name="setCampaignId" access="public" returntype="void" output="No">
<cfargument name="campaignId" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignId"]=arguments["campaignId"]>
		
</cffunction>

<cffunction name="getAdGroupEstimateRequests" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupEstimateRequests']" default="">
	<cfreturn variables["instance"]["adGroupEstimateRequests"]>
	
</cffunction>

<cffunction name="setAdGroupEstimateRequests" access="public" returntype="void" output="No">
<cfargument name="adGroupEstimateRequests" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupEstimateRequests"]=arguments["adGroupEstimateRequests"]>
		
</cffunction>

<cffunction name="getCriteria" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criteria']" default="">
	<cfreturn variables["instance"]["criteria"]>
	
</cffunction>

<cffunction name="setCriteria" access="public" returntype="void" output="No">
<cfargument name="criteria" required="Yes" type="any">
	
	<cfset variables["instance"]["criteria"]=arguments["criteria"]>
		
</cffunction>

<cffunction name="getNetworkSetting" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['networkSetting']" default="">
	<cfreturn variables["instance"]["networkSetting"]>
	
</cffunction>

<cffunction name="setNetworkSetting" access="public" returntype="void" output="No">
<cfargument name="networkSetting" required="Yes" type="any">
	
	<cfset variables["instance"]["networkSetting"]=arguments["networkSetting"]>
		
</cffunction>

<cffunction name="getDailyBudget" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dailyBudget']" default="">
	<cfreturn variables["instance"]["dailyBudget"]>
	
</cffunction>

<cffunction name="setDailyBudget" access="public" returntype="void" output="No">
<cfargument name="dailyBudget" required="Yes" type="any">
	
	<cfset variables["instance"]["dailyBudget"]=arguments["dailyBudget"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
