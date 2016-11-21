<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="DeviceTypeSearchParameter" hint="A SearchParameter for choosing which device types to get ideas and statistics for. This element is supported by following IdeaTypes: KEYWORD, PLACEMENT. This element is supported by following RequestTypes: IDEAS, STATS." extends="SearchParameter">

<cfproperty name="deviceType" required="no" type="string" hint="The requested device type for ideas and stats. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("DeviceTypeSearchParameter")>

<cffunction name="getDeviceType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['deviceType']" default="">
	<cfreturn variables["instance"]["deviceType"]>
	
</cffunction>

<cffunction name="setDeviceType" access="public" returntype="void" output="No">
<cfargument name="deviceType" required="Yes" type="any">
	
	<cfset variables["instance"]["deviceType"]=arguments["deviceType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
