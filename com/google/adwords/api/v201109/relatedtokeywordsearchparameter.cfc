<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="RelatedToKeywordSearchParameter" hint="A SearchParameter for KEYWORD and PLACEMENT IdeaTypes that specifies a generic keyword that results should be related to. This search parameter can be used in bulk keyword requests through the getBulkKeywordIdeas(TargetingIdeaSelector) method. This element is supported by following IdeaTypes: KEYWORD, PLACEMENT. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="keywords" required="no" type="Keyword[]" hint="A List of Keywords that the search result should be related to. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("RelatedToKeywordSearchParameter")>

<cffunction name="getKeywords" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['keywords']" default="">
	<cfreturn variables["instance"]["keywords"]>
	
</cffunction>

<cffunction name="setKeywords" access="public" returntype="void" output="No">
<cfargument name="keywords" required="Yes" type="any">
	
	<cfset variables["instance"]["keywords"]=arguments["keywords"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
