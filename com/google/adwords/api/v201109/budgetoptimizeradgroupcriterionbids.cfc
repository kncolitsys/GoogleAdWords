<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BudgetOptimizerAdGroupCriterionBids" hint="AdGroupCriterion level bids used in budget optimizer bidding strategy." extends="AdGroupCriterionBids">

<cfproperty name="proxyBid" required="no" type="Bid" hint="The effective bid set by the budget optimizer for this criterion." seq="2">
<cfproperty name="enhancedCpcEnabled" required="no" type="boolean" hint="The flag to indicate the enhanced CPC bidding is turned on and the criteria bids may be enhanced based on conversion optimizer data. This field can be selected using the value 'EnhancedCpcEnabled'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupCriterionBidsType("BudgetOptimizerAdGroupCriterionBids")>

<cffunction name="getProxyBid" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['proxyBid']" default="">
	<cfreturn variables["instance"]["proxyBid"]>
	
</cffunction>

<cffunction name="setProxyBid" access="public" returntype="void" output="No">
<cfargument name="proxyBid" required="Yes" type="any">
	
	<cfset variables["instance"]["proxyBid"]=arguments["proxyBid"]>
		
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
