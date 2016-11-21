<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupEstimate" hint="Represents the estimate results for a single ad group." extends="Estimate">

<cfproperty name="adGroupId" required="no" type="long" hint="The adGroupId of the ad group specified in the request. This will be null for new ad groups." seq="2">
<cfproperty name="keywordEstimates" required="no" type="KeywordEstimate[]" hint="The estimates for the keywords specified in the request. The list of estimates are returned in the same order as the keywords that were sent in the request." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setEstimateType("AdGroupEstimate")>

<cffunction name="getAdGroupId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupId']" default="">
	<cfreturn variables["instance"]["adGroupId"]>
	
</cffunction>

<cffunction name="setAdGroupId" access="public" returntype="void" output="No">
<cfargument name="adGroupId" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupId"]=arguments["adGroupId"]>
		
</cffunction>

<cffunction name="getKeywordEstimates" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['keywordEstimates']" default="">
	<cfreturn variables["instance"]["keywordEstimates"]>
	
</cffunction>

<cffunction name="setKeywordEstimates" access="public" returntype="void" output="No">
<cfargument name="keywordEstimates" required="Yes" type="any">
	
	<cfset variables["instance"]["keywordEstimates"]=arguments["keywordEstimates"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
