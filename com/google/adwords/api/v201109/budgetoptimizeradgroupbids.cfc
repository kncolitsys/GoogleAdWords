<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BudgetOptimizerAdGroupBids" hint="Adgroup level bids used in budget optimizer bidding strategy." extends="AdGroupBids">

<cfproperty name="proxyKeywordMaxCpc" required="no" type="Bid" hint="Proxy bid set by budget optimizer: This field can be selected using the value 'ProxyKeywordMaxCpc'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="proxySiteMaxCpc" required="no" type="Bid" hint="Proxy bid set by budget optimizer: This field can be selected using the value 'ProxySiteMaxCpc'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="enhancedCpcEnabled" required="no" type="boolean" hint="The flag to indicate the enhanced CPC bidding is turned on for the campaign This field can be selected using the value 'EnhancedCpcEnabled'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupBidsType("BudgetOptimizerAdGroupBids")>

<cffunction name="getProxyKeywordMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['proxyKeywordMaxCpc']" default="">
	<cfreturn variables["instance"]["proxyKeywordMaxCpc"]>
	
</cffunction>

<cffunction name="setProxyKeywordMaxCpc" access="public" returntype="void" output="No">
<cfargument name="proxyKeywordMaxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["proxyKeywordMaxCpc"]=arguments["proxyKeywordMaxCpc"]>
		
</cffunction>

<cffunction name="getProxySiteMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['proxySiteMaxCpc']" default="">
	<cfreturn variables["instance"]["proxySiteMaxCpc"]>
	
</cffunction>

<cffunction name="setProxySiteMaxCpc" access="public" returntype="void" output="No">
<cfargument name="proxySiteMaxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["proxySiteMaxCpc"]=arguments["proxySiteMaxCpc"]>
		
</cffunction>

<cffunction name="getEnhancedCpcEnabled" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enhancedCpcEnabled']" default="">
	<cfreturn variables["instance"]["enhancedCpcEnabled"]>
	
</cffunction>

<cffunction name="setEnhancedCpcEnabled" access="public" returntype="void" output="No">
<cfargument name="enhancedCpcEnabled" required="Yes" type="any">
	
	<cfset variables["instance"]["enhancedCpcEnabled"]=arguments["enhancedCpcEnabled"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
