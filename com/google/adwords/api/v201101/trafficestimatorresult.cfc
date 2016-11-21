<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TrafficEstimatorResult" hint="Contains results of traffic estimation request." extends="utils">

<cfproperty name="campaignEstimates" required="no" type="CampaignEstimate[]" hint="The estimates for the campaigns specified in the request. They are listed in the same order as the campaigns that were sent in the request." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCampaignEstimates" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignEstimates']" default="">
	<cfreturn variables["instance"]["campaignEstimates"]>
	
</cffunction>

<cffunction name="setCampaignEstimates" access="public" returntype="void" output="No">
<cfargument name="campaignEstimates" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignEstimates"]=arguments["campaignEstimates"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
