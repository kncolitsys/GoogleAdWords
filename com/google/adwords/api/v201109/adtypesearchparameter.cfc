<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdTypeSearchParameter" hint="A SearchParameter for PLACEMENT IdeaTypes used to filter the results by the AdType. This element is supported by following IdeaTypes: PLACEMENT. This element is supported by following RequestTypes: IDEAS." extends="SearchParameter">

<cfproperty name="adTypes" required="no" type="string[]" hint="A set of AdTypes desired in the results. For example, specify DISPLAY AdType to get PLACEMENT IdeaTypes that support display ads (independent of the ad size). This field must contain distinct elements. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("AdTypeSearchParameter")>

<cffunction name="getAdTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adTypes']" default="">
	<cfreturn variables["instance"]["adTypes"]>
	
</cffunction>

<cffunction name="setAdTypes" access="public" returntype="void" output="No">
<cfargument name="adTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["adTypes"]=arguments["adTypes"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
