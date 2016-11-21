<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CompetitionSearchParameter" hint="A SearchParameter for KEYWORD IdeaTypes used to filter the results by the amount of competition (eg: LOW, MEDIUM, HIGH). This element is supported by following IdeaTypes: KEYWORD. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="levels" required="no" type="string[]" hint="A set of Levels indicating a relative amount of competition that KEYWORD IdeaTypes should have in the results. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("CompetitionSearchParameter")>

<cffunction name="getLevels" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['levels']" default="">
	<cfreturn variables["instance"]["levels"]>
	
</cffunction>

<cffunction name="setLevels" access="public" returntype="void" output="No">
<cfargument name="levels" required="Yes" type="any">
	
	<cfset variables["instance"]["levels"]=arguments["levels"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
