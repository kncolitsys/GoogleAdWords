<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConversionOptimizerBiddingTransition" hint="Used to switch a campaign's bidding strategy to conversion optimizer." extends="BiddingTransition">

<cfproperty name="useSavedBids" required="no" type="boolean" hint="Indicate to use the existing bids, if there are previously saved CPA bids for the AdGroup during transition of campaign from ManualCPC to ConversionOptimizer." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setBiddingTransitionType("ConversionOptimizerBiddingTransition")>

<cffunction name="getUseSavedBids" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['useSavedBids']" default="">
	<cfreturn variables["instance"]["useSavedBids"]>
	
</cffunction>

<cffunction name="setUseSavedBids" access="public" returntype="void" output="No">
<cfargument name="useSavedBids" required="Yes" type="any">
	
	<cfset variables["instance"]["useSavedBids"]=arguments["useSavedBids"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
