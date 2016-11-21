<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignEstimate" hint="Represents the estimate results for a single campaign." extends="Estimate">

<cfproperty name="campaignId" required="no" type="long" hint="The campaignId of the campaign specified in the request. This will be null for new campaigns." seq="2">
<cfproperty name="adGroupEstimates" required="no" type="AdGroupEstimate[]" hint="The estimates for the ad groups belonging to this campaign in the request. They will be returned in the same order that they were sent in the request." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setEstimateType("CampaignEstimate")>

<cffunction name="getCampaignId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignId']" default="">
	<cfreturn variables["instance"]["campaignId"]>
	
</cffunction>

<cffunction name="setCampaignId" access="public" returntype="void" output="No">
<cfargument name="campaignId" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignId"]=arguments["campaignId"]>
		
</cffunction>

<cffunction name="getAdGroupEstimates" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupEstimates']" default="">
	<cfreturn variables["instance"]["adGroupEstimates"]>
	
</cffunction>

<cffunction name="setAdGroupEstimates" access="public" returntype="void" output="No">
<cfargument name="adGroupEstimates" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupEstimates"]=arguments["adGroupEstimates"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
