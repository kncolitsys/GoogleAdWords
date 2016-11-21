<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignEstimateRequest" hint="Represents a campaign that will be estimated. Returns traffic estimates for the requested set of campaigns. The campaigns can be all new or all existing, or a mixture of new and existing. Only existing campaigns may contain estimates for existing ad groups. For existing campaigns, the campaign and optionally the ad group will be used as context to produce more accurate estimates. Traffic estimates may only be requested on keywords, so regardless of whether campaign and ad group IDs are provided or left blank, at least one keyword is required to estimate traffic. To make a keyword estimates request in which estimates do not consider existing account information (e.g. historical ad group performance), set campaignId to null." extends="EstimateRequest">

<cfproperty name="campaignId" required="no" type="long" hint="The campaignId of an existing campaign or null. Refer to the CampaignEstimateRequest documentation for detailed usage." seq="2">
<cfproperty name="adGroupEstimateRequests" required="no" type="AdGroupEstimateRequest[]" hint="The list of ad groups to estimate. At least one ad group is required. New campaigns may only contain new ad groups. If an AdGroupEstimateRequest has an adGroupId but the campaign is new, the API will return an error. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="3">
<cfproperty name="targets" required="no" type="Target[]" hint="A list of Targets to be used for this Campaign. Targets provide information about geographical, language and advertising network targeting. Values in this field override the current targets in the Campaign specified by  campaignId by the following mechanism: This field accepts three types of Targets: GeoTarget, which encompasses 4 subtypes of geographic targeting, {@NetworkTarget, which includes a limited set of targeting for ad networks, and LanguageTarget, which should contain all language targeting. If any GeoTargets are passed in, all geographic targeting in the campaign will be overridden. If any LanguageTargets are passed in, all language targeting in the campaign will be overridden. If any {@NetworkTargets are passed in, all network targeting in the campaign will be overridden. If multiple geographic targets are specified, the traffic estimate will be the sum of the estimates for each targeted area. This means that if targets are chosen which overlap each other (for example, targeting both a country and a city within that country), the traffic estimate will be be larger than if no overlap were present - i. e., the overlap region will be double-counted in the estimate. Only the {@NetworkCoverageTypes GOOGLE_SEARCH and SEARCH_NETWORK are supported. If SEARCH_NETWORK is requested, GOOGLE_SEARCH must also be requested; estimates for SEARCH_NETWORK alone are not available at this time. If no targeting is specified and this is for an existing campaign then the current targeting on that campaign will be used, except that {@NetworkTargets not supported by Traffic Estimator Service will be ignored. If no targeting is specified and this is for a new campaign then it will default to all languages in all countries and territories, and Google search. While there's no solid limit on number of targets, TrafficEstimatorService may return error with TOO_MANY_TARGETS if the request contains too many targets across all CampaignEstimateRequests in a TrafficEstimatorSelector. Supported Targets : CountryTarget, CityTarget, MetroTarget, ProvinceTarget, NetworkTarget, and LanguageTarget. This field must contain distinct elements. This field must not contain null elements." seq="4">

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

<cffunction name="getTargets" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targets']" default="">
	<cfreturn variables["instance"]["targets"]>
	
</cffunction>

<cffunction name="setTargets" access="public" returntype="void" output="No">
<cfargument name="targets" required="Yes" type="any">
	
	<cfset variables["instance"]["targets"]=arguments["targets"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
