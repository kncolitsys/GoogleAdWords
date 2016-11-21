<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConversionOptimizerAdGroupBids" hint="Adgroup level bids used in conversion optimizer bidding strategy." extends="AdGroupBids">

<cfproperty name="targetCpa" required="no" type="Bid" hint="Target cost per acquisition/conversion. This field can be selected using the value 'TargetCpa'.This field can be filtered on." seq="2">
<cfproperty name="conversionOptimizerBidType" required="no" type="string" hint="Bid type for the conversion optimizer campaign, the values are maxCpa or targetCpa This field can be selected using the value 'ConversionOptimizerBidType'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="deduplicationMode" required="no" type="string" hint="Deduplication mode for the conversion optimizer campaign This field can be selected using the value 'DeduplicationMode'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupBidsType("ConversionOptimizerAdGroupBids")>

<cffunction name="getTargetCpa" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targetCpa']" default="">
	<cfreturn variables["instance"]["targetCpa"]>
	
</cffunction>

<cffunction name="setTargetCpa" access="public" returntype="void" output="No">
<cfargument name="targetCpa" required="Yes" type="any">
	
	<cfset variables["instance"]["targetCpa"]=arguments["targetCpa"]>
		
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
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
