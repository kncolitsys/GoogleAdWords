<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LocationSearchParameter" hint="A SearchParameter for both PLACEMENT and KEYWORD IdeaTypes used to indicate the locations being targeted. This can be used, for example, to search for KEYWORD IdeaTypes that are best for Japan and Los Angeles. This parameter replaces the CountryTargetSearchParameter. Warning: Not all back-ends support sub-country precision. This search parameter can be used in bulk keyword requests through the getBulkKeywordIdeas(TargetingIdeaSelector) method. It must be single-valued when used in a call to that method. This element is supported by following IdeaTypes: KEYWORD, PLACEMENT. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="locations" required="no" type="Location[]" hint="A List of Locations indicating the desired countries being targeted in the results. The maximum size of this collection is 300. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("LocationSearchParameter")>

<cffunction name="getLocations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['locations']" default="">
	<cfreturn variables["instance"]["locations"]>
	
</cffunction>

<cffunction name="setLocations" access="public" returntype="void" output="No">
<cfargument name="locations" required="Yes" type="any">
	
	<cfset variables["instance"]["locations"]=arguments["locations"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
