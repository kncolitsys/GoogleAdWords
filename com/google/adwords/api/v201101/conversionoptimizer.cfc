<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConversionOptimizer" hint="Conversion optimizer bidding strategy." extends="BiddingStrategy">

<cfproperty name="pricingModel" required="no" type="string" hint="Pricing model for the conversion optimizer bidding strategy, Click for pay-per-click or Conversions for pay-per-conversions. If the pricing model is not specified it defaults to Clicks. This field can be selected using the value 'PricingModel'.This field can be filtered on." seq="2">
<cfproperty name="conversionOptimizerBidType" required="no" type="string" hint="Bid type for the conversion optimizer campaign This field can be selected using the value 'ConversionOptimizerBidType'.This field can be filtered on." seq="3">
<cfproperty name="deduplicationMode" required="no" type="string" hint="Deduplication mode for the conversion optimizer campaign This field can be selected using the value 'DeduplicationMode'.This field can be filtered on." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setBiddingStrategyType("ConversionOptimizer")>

<cffunction name="getPricingModel" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['pricingModel']" default="">
	<cfreturn variables["instance"]["pricingModel"]>
	
</cffunction>

<cffunction name="setPricingModel" access="public" returntype="void" output="No">
<cfargument name="pricingModel" required="Yes" type="any">
	
	<cfset variables["instance"]["pricingModel"]=arguments["pricingModel"]>
		
</cffunction>

<cffunction name="getConversionOptimizerBidType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversionOptimizerBidType']" default="">
	<cfreturn variables["instance"]["conversionOptimizerBidType"]>
	
</cffunction>

<cffunction name="setConversionOptimizerBidType" access="public" returntype="void" output="No">
<cfargument name="conversionOptimizerBidType" required="Yes" type="any">
	
	<cfset variables["instance"]["conversionOptimizerBidType"]=arguments["conversionOptimizerBidType"]>
		
</cffunction>

<cffunction name="getDeduplicationMode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['deduplicationMode']" default="">
	<cfreturn variables["instance"]["deduplicationMode"]>
	
</cffunction>

<cffunction name="setDeduplicationMode" access="public" returntype="void" output="No">
<cfargument name="deduplicationMode" required="Yes" type="any">
	
	<cfset variables["instance"]["deduplicationMode"]=arguments["deduplicationMode"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
