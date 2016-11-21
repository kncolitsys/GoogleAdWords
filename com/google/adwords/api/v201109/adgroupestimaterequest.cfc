<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupEstimateRequest" hint="Represents an ad group that will be estimated. Ad groups may be all new or all existing, or a mixture of new and existing. Only existing campaigns can contain estimates for existing ad groups. To make a keyword estimates request in which estimates do not consider existing account information (e.g. historical ad group performance), set both adGroupId and the enclosing CampaignEstimateRequest's campaignId to null. For more details on usage, refer to document at CampaignEstimateRequest." extends="EstimateRequest">

<cfproperty name="adGroupId" required="no" type="long" hint="The adGroupId for an ad group that belongs to the containing campaign from CampaignEstimateRequest or null. For usage, refer to document from CampaignEstimateRequest." seq="2">
<cfproperty name="keywordEstimateRequests" required="no" type="KeywordEstimateRequest[]" hint="The keywords to estimate. This field must contain distinct elements. This field must not contain null elements. This field is required and should not be null." seq="3">
<cfproperty name="maxCpc" required="no" type="Money" hint="The max CPC bid to use for estimates for this ad group. This value overrides the max CPC of AdGroup specified by  adGroupId." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setEstimateRequestType("AdGroupEstimateRequest")>

<cffunction name="getAdGroupId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupId']" default="">
	<cfreturn variables["instance"]["adGroupId"]>
	
</cffunction>

<cffunction name="setAdGroupId" access="public" returntype="void" output="No">
<cfargument name="adGroupId" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupId"]=arguments["adGroupId"]>
		
</cffunction>

<cffunction name="getKeywordEstimateRequests" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['keywordEstimateRequests']" default="">
	<cfreturn variables["instance"]["keywordEstimateRequests"]>
	
</cffunction>

<cffunction name="setKeywordEstimateRequests" access="public" returntype="void" output="No">
<cfargument name="keywordEstimateRequests" required="Yes" type="any">
	
	<cfset variables["instance"]["keywordEstimateRequests"]=arguments["keywordEstimateRequests"]>
		
</cffunction>

<cffunction name="getMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxCpc']" default="">
	<cfreturn variables["instance"]["maxCpc"]>
	
</cffunction>

<cffunction name="setMaxCpc" access="public" returntype="void" output="No">
<cfargument name="maxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["maxCpc"]=arguments["maxCpc"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
