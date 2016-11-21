<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="EnumValuePair" hint="Represents information about enum values." extends="utils">

<cfproperty name="enumValue" required="no" type="string" hint="The api enum value. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="enumDisplayValue" required="no" type="string" hint="The enum value displayed in the downloaded report. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getEnumValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enumValue']" default="">
	<cfreturn variables["instance"]["enumValue"]>
	
</cffunction>

<cffunction name="setEnumValue" access="public" returntype="void" output="No">
<cfargument name="enumValue" required="Yes" type="any">
	
	<cfset variables["instance"]["enumValue"]=arguments["enumValue"]>
		
</cffunction>

<cffunction name="getEnumDisplayValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enumDisplayValue']" default="">
	<cfreturn variables["instance"]["enumDisplayValue"]>
	
</cffunction>

<cffunction name="setEnumDisplayValue" access="public" returntype="void" output="No">
<cfargument name="enumDisplayValue" required="Yes" type="any">
	
	<cfset variables["instance"]["enumDisplayValue"]=arguments["enumDisplayValue"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
