<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BudgetOptimizer" hint="In budget optimizer, Google automatically places bids for the user based on their daily/monthly budget." extends="BiddingStrategy">

<cfproperty name="enhancedCpcEnabled" required="no" type="boolean" hint="The enhanced CPC bidding option for the campaign, which enables bids to be enhanced based on conversion optimizer data This field can be selected using the value 'EnhancedCpcEnabled'.This field can be filtered on." seq="2">
<cfproperty name="bidCeiling" required="no" type="Money" hint="Ceiling on bids placed by the budget optimizer. This field can be selected using the value 'BidCeiling'." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setBiddingStrategyType("BudgetOptimizer")>

<cffunction name="getEnhancedCpcEnabled" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enhancedCpcEnabled']" default="">
	<cfreturn variables["instance"]["enhancedCpcEnabled"]>
	
</cffunction>

<cffunction name="setEnhancedCpcEnabled" access="public" returntype="void" output="No">
<cfargument name="enhancedCpcEnabled" required="Yes" type="any">
	
	<cfset variables["instance"]["enhancedCpcEnabled"]=arguments["enhancedCpcEnabled"]>
		
</cffunction>

<cffunction name="getBidCeiling" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bidCeiling']" default="">
	<cfreturn variables["instance"]["bidCeiling"]>
	
</cffunction>

<cffunction name="setBidCeiling" access="public" returntype="void" output="No">
<cfargument name="bidCeiling" required="Yes" type="any">
	
	<cfset variables["instance"]["bidCeiling"]=arguments["bidCeiling"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
