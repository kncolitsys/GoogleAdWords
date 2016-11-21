<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CountryTarget" hint="Represents countries in the world for targeting. The list of countries of the world available for targeting are listed here." extends="GeoTarget">

<cfproperty name="countryCode" required="no" type="string" hint="Country code. This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("GeoTarget")>

<cffunction name="getCountryCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['countryCode']" default="">
	<cfreturn variables["instance"]["countryCode"]>
	
</cffunction>

<cffunction name="setCountryCode" access="public" returntype="void" output="No">
<cfargument name="countryCode" required="Yes" type="any">
	
	<cfset variables["instance"]["countryCode"]=arguments["countryCode"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
