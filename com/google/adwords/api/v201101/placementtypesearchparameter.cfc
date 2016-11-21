<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PlacementTypeSearchParameter" hint="A SearchParameter for PLACEMENT IdeaTypes used to filter results based on the type of website, known as PLACEMENT_TYPE, that they appear in. For example, searches may be limited to find results that only appear within mobile websites or feeds. This element is supported by following IdeaTypes: PLACEMENT. This element is supported by following RequestTypes: IDEAS." extends="SearchParameter">

<cfproperty name="placementTypes" required="no" type="string[]" hint="A Set of PlacementTypes representing the types of sites in which ideas must appear. This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("PlacementTypeSearchParameter")>

<cffunction name="getPlacementTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['placementTypes']" default="">
	<cfreturn variables["instance"]["placementTypes"]>
	
</cffunction>

<cffunction name="setPlacementTypes" access="public" returntype="void" output="No">
<cfargument name="placementTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["placementTypes"]=arguments["placementTypes"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
