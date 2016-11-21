<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="IdeaTextMatchesSearchParameter" hint="A SearchParameter for KEYWORD IdeaTypes that specifies a collection of strings by which the results should be constrained. This guarantees that each idea in the result will match at least one of the included values. This element is supported by following IdeaTypes: KEYWORD. This element is supported by following RequestTypes: IDEAS." extends="SearchParameter">

<cfproperty name="included" required="no" type="string[]" hint="A set of strings specifying which ideas should be included in the results. This field must contain distinct elements. This field must not contain null elements." seq="2">
<cfproperty name="excluded" required="no" type="string[]" hint="A set of strings specifying which ideas should be excluded from the results. This field must contain distinct elements. This field must not contain null elements." seq="3">
<cfproperty name="priorityAction" required="no" type="string" hint="Specifies the action to take (include/exclude) in cases where an idea matches more than one term with different actions specified for each. Default value is MatchAction EXCLUDE." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("IdeaTextMatchesSearchParameter")>

<cffunction name="getIncluded" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['included']" default="">
	<cfreturn variables["instance"]["included"]>
	
</cffunction>

<cffunction name="setIncluded" access="public" returntype="void" output="No">
<cfargument name="included" required="Yes" type="any">
	
	<cfset variables["instance"]["included"]=arguments["included"]>
		
</cffunction>

<cffunction name="getExcluded" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['excluded']" default="">
	<cfreturn variables["instance"]["excluded"]>
	
</cffunction>

<cffunction name="setExcluded" access="public" returntype="void" output="No">
<cfargument name="excluded" required="Yes" type="any">
	
	<cfset variables["instance"]["excluded"]=arguments["excluded"]>
		
</cffunction>

<cffunction name="getPriorityAction" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['priorityAction']" default="">
	<cfreturn variables["instance"]["priorityAction"]>
	
</cffunction>

<cffunction name="setPriorityAction" access="public" returntype="void" output="No">
<cfargument name="priorityAction" required="Yes" type="any">
	
	<cfset variables["instance"]["priorityAction"]=arguments["priorityAction"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
