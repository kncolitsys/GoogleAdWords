<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="KeywordEstimateRequest" hint="Represents a keyword to be estimated." extends="EstimateRequest">

<cfproperty name="keyword" required="no" type="Keyword" hint="The Keyword to estimate. The keyword text is required regardless of whether the keyword ID is included. The keyword ID is optional and has the following characteristics: When omitted, the ID indicates a new keyword to be estimated. When present with a campaign and ad group also specified, the ID should be for an existing keyword in the ad group. This can improve the estimates since historical performance is known. When present without a campaign and ad group specified, the ID is ignored. This field is required and should not be null." seq="2">
<cfproperty name="maxCpc" required="no" type="Money" hint="The max CPC bid for this keyword. In general, the maxCpc of a KeywordEstimateRequest is optional, since there is usually another maxCpc that can be used, such as the maxCpc on an existing keyword, an existing or overriding maxCpc of containing AdGroupEstimateRequest. However, if there is no backup value of maxCpc anywhere along the line, you must provide a value for maxCpc in KeywordEstimateRequest. This would happen, for example, if the KeywordEstimateRequest is for a new keyword." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setEstimateRequestType("KeywordEstimateRequest")>

<cffunction name="getKeyword" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['keyword']" default="">
	<cfreturn variables["instance"]["keyword"]>
	
</cffunction>

<cffunction name="setKeyword" access="public" returntype="void" output="No">
<cfargument name="keyword" required="Yes" type="any">
	
	<cfset variables["instance"]["keyword"]=arguments["keyword"]>
		
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
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
