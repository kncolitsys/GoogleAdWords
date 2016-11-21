<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ExcludedKeywordSearchParameter" hint="A SearchParameter for KEYWORD IdeaTypes that specifies Keywords that should be excluded from the results. The KeywordMatchType associated with these keywords is used to provide various filtering strategies. For example, the excluded keyword 'sony player' will exclude ideas from the resulting ideas as described by the table below. Idea BROAD PHRASE EXACT sony player Exclude Exclude Exclude blu-ray sony player Exclude Exclude Include sony dvd player Exclude Include Include sony dvd Include Include Include This element is supported by following IdeaTypes: KEYWORD. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="keywords" required="no" type="Keyword[]" hint="A List of Keywords to be excluded from the search results. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("ExcludedKeywordSearchParameter")>

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
