<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPCAdGroupBids" hint="Adgroup level bids used in manual CPC bidding strategy." extends="AdGroupBids">

<cfproperty name="keywordMaxCpc" required="no" type="Bid" hint="Max CPC (cost per click) bid for keyword targeting on search network. This field can be selected using the value 'KeywordMaxCpc'.This field can be filtered on." seq="2">
<cfproperty name="keywordContentMaxCpc" required="no" type="Bid" hint="Max CPC bid for keyword targeting on content network. This field can be selected using the value 'KeywordContentMaxCpc'.This field can be filtered on." seq="3">
<cfproperty name="siteMaxCpc" required="no" type="Bid" hint="Max CPC bid for site targeting. This field has been sunsetted and will return an error if set. This field can be selected using the value 'SiteMaxCpc'.This field can be filtered on." seq="4">
<cfproperty name="enhancedCpcEnabled" required="no" type="boolean" hint="The flag to indicate the enhanced CPC bidding is turned on for the campaign This field can be selected using the value 'EnhancedCpcEnabled'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupBidsType("ManualCPCAdGroupBids")>

<cffunction name="getKeywordMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['keywordMaxCpc']" default="">
	<cfreturn variables["instance"]["keywordMaxCpc"]>
	
</cffunction>

<cffunction name="setKeywordMaxCpc" access="public" returntype="void" output="No">
<cfargument name="keywordMaxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["keywordMaxCpc"]=arguments["keywordMaxCpc"]>
		
</cffunction>

<cffunction name="getKeywordContentMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['keywordContentMaxCpc']" default="">
	<cfreturn variables["instance"]["keywordContentMaxCpc"]>
	
</cffunction>

<cffunction name="setKeywordContentMaxCpc" access="public" returntype="void" output="No">
<cfargument name="keywordContentMaxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["keywordContentMaxCpc"]=arguments["keywordContentMaxCpc"]>
		
</cffunction>

<cffunction name="getSiteMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['siteMaxCpc']" default="">
	<cfreturn variables["instance"]["siteMaxCpc"]>
	
</cffunction>

<cffunction name="setSiteMaxCpc" access="public" returntype="void" output="No">
<cfargument name="siteMaxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["siteMaxCpc"]=arguments["siteMaxCpc"]>
		
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
