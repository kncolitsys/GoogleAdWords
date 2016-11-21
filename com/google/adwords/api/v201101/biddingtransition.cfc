<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BiddingTransition" hint="Used to switch a campaign's bidding strategy." extends="utils">

<cfproperty name="targetBiddingStrategy" required="no" type="BiddingStrategy" hint="This field is required and should not be null." seq="1">
<cfproperty name="explicitAdGroupBids" required="no" type="AdGroupBids" hint="User provide a single set of explicit adgroup level bid values to be copied for all adgroups for the campaign while transitioning a campaign's bidding strategy. E.g., while transitioning from manual CPC to manual CPM bidding, user provides a maxCPM bid and all adgroups will be set to use that bid. Explicit Bid is required for ManualCpc ManualCPM, optional for ManualCPC ConversionOptimizer and should not be specified for ManualCPC BudgetOptimizer" seq="2">
<cfproperty name="BiddingTransition_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of BiddingTransition of this instance. It is ignored on input, and instead xsi:type should be specified." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getTargetBiddingStrategy" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targetBiddingStrategy']" default="">
	<cfreturn variables["instance"]["targetBiddingStrategy"]>
	
</cffunction>

<cffunction name="setTargetBiddingStrategy" access="public" returntype="void" output="No">
<cfargument name="targetBiddingStrategy" required="Yes" type="any">
	
	<cfset variables["instance"]["targetBiddingStrategy"]=arguments["targetBiddingStrategy"]>
		
</cffunction>

<cffunction name="getExplicitAdGroupBids" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['explicitAdGroupBids']" default="">
	<cfreturn variables["instance"]["explicitAdGroupBids"]>
	
</cffunction>

<cffunction name="setExplicitAdGroupBids" access="public" returntype="void" output="No">
<cfargument name="explicitAdGroupBids" required="Yes" type="any">
	
	<cfset variables["instance"]["explicitAdGroupBids"]=arguments["explicitAdGroupBids"]>
		
</cffunction>

<cffunction name="getBiddingTransitionType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['BiddingTransition_Type']" default="">
	<cfreturn variables["instance"]["BiddingTransition_Type"]>
	
</cffunction>

<cffunction name="setBiddingTransitionType" access="public" returntype="void" output="No">
<cfargument name="BiddingTransition_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["BiddingTransition_Type"]=arguments["BiddingTransition_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
