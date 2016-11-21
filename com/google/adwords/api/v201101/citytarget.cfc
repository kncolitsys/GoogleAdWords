<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CityTarget" hint="Represents cities for targeting. The list of cities around the world available for targeting are listed here. The list of cities within US available for targeting are listed here." extends="GeoTarget">

<cfproperty name="cityName" required="no" type="string" hint="Name of the city. This field is required and should not be null. This string must not be empty." seq="1">
<cfproperty name="provinceCode" required="no" type="string" hint="Province or state code; null if unknonwn. This string must not be empty." seq="2">
<cfproperty name="countryCode" required="no" type="string" hint="Country code. This field is required and should not be null." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("GeoTarget")>

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
