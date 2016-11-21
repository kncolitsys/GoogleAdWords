<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LanguageSearchParameter" hint="A SearchParameter for both PLACEMENT and KEYWORD IdeaTypes used to indicate the languages being targeted. This can be used, for example, to search for KEYWORD IdeaTypes that are best for Japanese and Korean languages. This search parameter can be used in bulk keyword requests through the getBulkKeywordIdeas(TargetingIdeaSelector) method. It must be single-valued when used in a call to that method. This element is supported by following IdeaTypes: KEYWORD, PLACEMENT. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="languages" required="no" type="Language[]" hint="A set of Languages indicating the desired languages being targeted in the results. The maximum size of this collection is 200. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("LanguageSearchParameter")>

<cffunction name="getLanguages" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['languages']" default="">
	<cfreturn variables["instance"]["languages"]>
	
</cffunction>

<cffunction name="setLanguages" access="public" returntype="void" output="No">
<cfargument name="languages" required="Yes" type="any">
	
	<cfset variables["instance"]["languages"]=arguments["languages"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
