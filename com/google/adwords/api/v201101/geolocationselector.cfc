<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="GeoLocationSelector" hint="A selector used to fetch geographic coordinates for given addresses." extends="utils">

<cfproperty name="addresses" required="no" type="Address[]" hint="List of addresses to get the geolocation information. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAddresses" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['addresses']" default="">
	<cfreturn variables["instance"]["addresses"]>
	
</cffunction>

<cffunction name="setAddresses" access="public" returntype="void" output="No">
<cfargument name="addresses" required="Yes" type="any">
	
	<cfset variables["instance"]["addresses"]=arguments["addresses"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
