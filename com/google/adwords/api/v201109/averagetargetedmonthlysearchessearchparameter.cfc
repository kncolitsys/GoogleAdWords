<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AverageTargetedMonthlySearchesSearchParameter" hint="A SearchParameter that constrains the approximate average number of targeted monthly searches on ideas to be returned. Absence of a AverageTargetedMonthlySearchesSearchParameter in a com.google.ads.api.services.targetingideas.TargetingIdeaSelector is equivalent to having no constraint on average targeted monthly searches pecified. This element is supported by following IdeaTypes: KEYWORD. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="operation" required="no" type="LongComparisonOperation" hint="Used to specify the range of Average Targeted Monthly Searches. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("AverageTargetedMonthlySearchesSearchParameter")>

<cffunction name="getOperation" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operation']" default="">
	<cfreturn variables["instance"]["operation"]>
	
</cffunction>

<cffunction name="setOperation" access="public" returntype="void" output="No">
<cfargument name="operation" required="Yes" type="any">
	
	<cfset variables["instance"]["operation"]=arguments["operation"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
