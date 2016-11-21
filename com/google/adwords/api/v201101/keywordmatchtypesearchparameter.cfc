<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="KeywordMatchTypeSearchParameter" hint="A SearchParameter for KEYWORD IdeaTypes that specifies the KeywordMatchTypes that all results must match. For example, results may be limited to only Broad or Exact matches. Setting no KeywordMatchTypeSearchParameter will match all targeting ideas, regardless of KeywordMatchType. If multiple KeywordMatchTypes are set, a result need only match one match type to be returned. This element is supported by following IdeaTypes: KEYWORD. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="keywordMatchTypes" required="no" type="string[]" hint="A Set of KeywordMatchTypes that results must match. Results need only match a single match type in the set. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("KeywordMatchTypeSearchParameter")>

<cffunction name="getKeywordMatchTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['keywordMatchTypes']" default="">
	<cfreturn variables["instance"]["keywordMatchTypes"]>
	
</cffunction>

<cffunction name="setKeywordMatchTypes" access="public" returntype="void" output="No">
<cfargument name="keywordMatchTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["keywordMatchTypes"]=arguments["keywordMatchTypes"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
