<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LanguageTargetSearchParameter" hint="A SearchParameter for both PLACEMENT and KEYWORD IdeaTypes used to indicate the languages being targeted. This can be used, for example, to search for KEYWORD IdeaTypes that are best for Japanese and Korean languages. Note: The LanguageTarget's excluded attribute is ignored. This search parameter can be used in bulk keyword requests through the getBulkKeywordIdeas(TargetingIdeaSelector) method. It must be single-valued when used in a call to that method. This element is supported by following IdeaTypes: KEYWORD, PLACEMENT. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="languageTargets" required="no" type="LanguageTarget[]" hint="A set of LanguageTargets indicating the desired languages being targeted in the results. The maximum size of this collection is 200. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("LanguageTargetSearchParameter")>

<cffunction name="getLanguageTargets" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['languageTargets']" default="">
	<cfreturn variables["instance"]["languageTargets"]>
	
</cffunction>

<cffunction name="setLanguageTargets" access="public" returntype="void" output="No">
<cfargument name="languageTargets" required="Yes" type="any">
	
	<cfset variables["instance"]["languageTargets"]=arguments["languageTargets"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
