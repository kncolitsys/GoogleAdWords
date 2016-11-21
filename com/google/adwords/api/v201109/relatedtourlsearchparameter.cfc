<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="RelatedToUrlSearchParameter" hint="A SearchParameter for KEYWORD and PLACEMENT IdeaTypes that specifies a set of URLs that results should in some way be related too. For example, keyword results would be similar to content keywords found on the related URLs. This search parameter can be used in bulk keyword requests through the getBulkKeywordIdeas(TargetingIdeaSelector) method. It must be single-valued when used in a call to that method. This element is supported by following IdeaTypes: KEYWORD, PLACEMENT. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="urls" required="no" type="string[]" hint="A set of URL strings to which search results should be related. For PLACEMENT queries, up to five URLs may be submitted. For KEYWORD queries, only one URL may be submitted. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">
<cfproperty name="includeSubUrls" required="no" type="boolean" hint="Whether to crawl links off of the urls for the same domain. Default is false. Ignored on KEYWORD queries," seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("RelatedToUrlSearchParameter")>

<cffunction name="getUrls" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['urls']" default="">
	<cfreturn variables["instance"]["urls"]>
	
</cffunction>

<cffunction name="setUrls" access="public" returntype="void" output="No">
<cfargument name="urls" required="Yes" type="any">
	
	<cfset variables["instance"]["urls"]=arguments["urls"]>
		
</cffunction>

<cffunction name="getIncludeSubUrls" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['includeSubUrls']" default="">
	<cfreturn variables["instance"]["includeSubUrls"]>
	
</cffunction>

<cffunction name="setIncludeSubUrls" access="public" returntype="void" output="No">
<cfargument name="includeSubUrls" required="Yes" type="any">
	
	<cfset variables["instance"]["includeSubUrls"]=arguments["includeSubUrls"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
