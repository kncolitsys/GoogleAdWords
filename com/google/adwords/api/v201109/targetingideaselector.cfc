<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TargetingIdeaSelector" hint="A descriptor for finding TargetingIdeas that match the specified criteria." extends="utils">

<cfproperty name="searchParameters" required="no" type="SearchParameter[]" hint="Search for targeting ideas based on these search rules. An empty set indicates this selector is valid for selecting metadata with default parameters. This field must not contain null elements. Elements in this field must have distinct types. This field is required and should not be null." seq="1">
<cfproperty name="ideaType" required="no" type="string" hint="Limits the request to responses of this IdeaType, e.g. KEYWORDS or PLACEMENTS. This field is required and should not be null." seq="2">
<cfproperty name="requestType" required="no" type="string" hint="Specifies the RequestType, e.g. IDEAS or STATS. This field is required and should not be null." seq="3">
<cfproperty name="requestedAttributeTypes" required="no" type="string[]" hint="Request Attributes and associated data for this set of Types. An empty set indicates a request for com.google.ads.api.services.common.optimization.attributes.KeywordAttribute, com.google.ads.api.services.common.optimization.attributes.PlacementAttribute, and IdeaType. This field must contain distinct elements. This field must not contain null elements." seq="4">
<cfproperty name="paging" required="no" type="Paging" hint="A Paging object that specifies the desired starting index and number of results to return." seq="5">
<cfproperty name="localeCode" required="no" type="string" hint="The locale code (for example 'en_US') used for localizing strings, controlling numeric formatting, and the like. See RFC 3066 for information on the format used." seq="6">
<cfproperty name="currencyCode" required="no" type="string" hint="The currency code to be used for all monetary values returned in results in ISO format (see http://code.google.com/apis/adwords/docs/developer/adwords_api_currency.html for supported currencies). The default is 'USD' (US dollars)." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getSearchParameters" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['searchParameters']" default="">
	<cfreturn variables["instance"]["searchParameters"]>
	
</cffunction>

<cffunction name="setSearchParameters" access="public" returntype="void" output="No">
<cfargument name="searchParameters" required="Yes" type="any">
	
	<cfset variables["instance"]["searchParameters"]=arguments["searchParameters"]>
		
</cffunction>

<cffunction name="getIdeaType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ideaType']" default="">
	<cfreturn variables["instance"]["ideaType"]>
	
</cffunction>

<cffunction name="setIdeaType" access="public" returntype="void" output="No">
<cfargument name="ideaType" required="Yes" type="any">
	
	<cfset variables["instance"]["ideaType"]=arguments["ideaType"]>
		
</cffunction>

<cffunction name="getRequestType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['requestType']" default="">
	<cfreturn variables["instance"]["requestType"]>
	
</cffunction>

<cffunction name="setRequestType" access="public" returntype="void" output="No">
<cfargument name="requestType" required="Yes" type="any">
	
	<cfset variables["instance"]["requestType"]=arguments["requestType"]>
		
</cffunction>

<cffunction name="getRequestedAttributeTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['requestedAttributeTypes']" default="">
	<cfreturn variables["instance"]["requestedAttributeTypes"]>
	
</cffunction>

<cffunction name="setRequestedAttributeTypes" access="public" returntype="void" output="No">
<cfargument name="requestedAttributeTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["requestedAttributeTypes"]=arguments["requestedAttributeTypes"]>
		
</cffunction>

<cffunction name="getPaging" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['paging']" default="">
	<cfreturn variables["instance"]["paging"]>
	
</cffunction>

<cffunction name="setPaging" access="public" returntype="void" output="No">
<cfargument name="paging" required="Yes" type="any">
	
	<cfset variables["instance"]["paging"]=arguments["paging"]>
		
</cffunction>

<cffunction name="getLocaleCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['localeCode']" default="">
	<cfreturn variables["instance"]["localeCode"]>
	
</cffunction>

<cffunction name="setLocaleCode" access="public" returntype="void" output="No">
<cfargument name="localeCode" required="Yes" type="any">
	
	<cfset variables["instance"]["localeCode"]=arguments["localeCode"]>
		
</cffunction>

<cffunction name="getCurrencyCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['currencyCode']" default="">
	<cfreturn variables["instance"]["currencyCode"]>
	
</cffunction>

<cffunction name="setCurrencyCode" access="public" returntype="void" output="No">
<cfargument name="currencyCode" required="Yes" type="any">
	
	<cfset variables["instance"]["currencyCode"]=arguments["currencyCode"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
