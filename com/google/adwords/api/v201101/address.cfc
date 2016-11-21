<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Address" hint="Structure to specify an address location." extends="utils">

<cfproperty name="streetAddress" required="no" type="string" hint="Street address line 1; null if unknown. This string must not be empty." seq="1">
<cfproperty name="streetAddress2" required="no" type="string" hint="Street address line 2; null if unknown. This string must not be empty." seq="2">
<cfproperty name="cityName" required="no" type="string" hint="Name of the city; null if unknown. This string must not be empty." seq="3">
<cfproperty name="provinceCode" required="no" type="string" hint="Province or state code; null if unknown. This string must not be empty." seq="4">
<cfproperty name="provinceName" required="no" type="string" hint="Province or state name; null if unknown. This string must not be empty." seq="5">
<cfproperty name="postalCode" required="no" type="string" hint="Postal code; null if unknown. This string must not be empty." seq="6">
<cfproperty name="countryCode" required="no" type="string" hint="Country code; null if unknown." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getStreetAddress" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['streetAddress']" default="">
	<cfreturn variables["instance"]["streetAddress"]>
	
</cffunction>

<cffunction name="setStreetAddress" access="public" returntype="void" output="No">
<cfargument name="streetAddress" required="Yes" type="any">
	
	<cfset variables["instance"]["streetAddress"]=arguments["streetAddress"]>
		
</cffunction>

<cffunction name="getStreetAddress2" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['streetAddress2']" default="">
	<cfreturn variables["instance"]["streetAddress2"]>
	
</cffunction>

<cffunction name="setStreetAddress2" access="public" returntype="void" output="No">
<cfargument name="streetAddress2" required="Yes" type="any">
	
	<cfset variables["instance"]["streetAddress2"]=arguments["streetAddress2"]>
		
</cffunction>

<cffunction name="getCityName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['cityName']" default="">
	<cfreturn variables["instance"]["cityName"]>
	
</cffunction>

<cffunction name="setCityName" access="public" returntype="void" output="No">
<cfargument name="cityName" required="Yes" type="any">
	
	<cfset variables["instance"]["cityName"]=arguments["cityName"]>
		
</cffunction>

<cffunction name="getProvinceCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['provinceCode']" default="">
	<cfreturn variables["instance"]["provinceCode"]>
	
</cffunction>

<cffunction name="setProvinceCode" access="public" returntype="void" output="No">
<cfargument name="provinceCode" required="Yes" type="any">
	
	<cfset variables["instance"]["provinceCode"]=arguments["provinceCode"]>
		
</cffunction>

<cffunction name="getProvinceName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['provinceName']" default="">
	<cfreturn variables["instance"]["provinceName"]>
	
</cffunction>

<cffunction name="setProvinceName" access="public" returntype="void" output="No">
<cfargument name="provinceName" required="Yes" type="any">
	
	<cfset variables["instance"]["provinceName"]=arguments["provinceName"]>
		
</cffunction>

<cffunction name="getPostalCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['postalCode']" default="">
	<cfreturn variables["instance"]["postalCode"]>
	
</cffunction>

<cffunction name="setPostalCode" access="public" returntype="void" output="No">
<cfargument name="postalCode" required="Yes" type="any">
	
	<cfset variables["instance"]["postalCode"]=arguments["postalCode"]>
		
</cffunction>

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
