<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TrafficEstimatorSelector" hint="Contains a list of campaigns to perform a traffic estimate on." extends="utils">

<cfproperty name="campaignEstimateRequests" required="no" type="CampaignEstimateRequest[]" hint="A list of all campaigns to estimate. To create a Keyword estimates request, use null campaign id. The maximum size of this collection is 5. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCampaignEstimateRequests" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignEstimateRequests']" default="">
	<cfreturn variables["instance"]["campaignEstimateRequests"]>
	
</cffunction>

<cffunction name="setCampaignEstimateRequests" access="public" returntype="void" output="No">
<cfargument name="campaignEstimateRequests" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignEstimateRequests"]=arguments["campaignEstimateRequests"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
