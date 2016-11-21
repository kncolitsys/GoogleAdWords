<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ProximityTarget" hint="Structure to specify a geographic target for a proximity location. This proximity target doesn't support taking in a location address in place of a lat/long, geocoding it, and creating a proximity target for the campaign. The caller must ensure the address fields are valid and consistent with the supplied lat/long. GeoLocationService can be used to find a valid GeoPoint for an address that can be used with this service. Proximity targets cannot be used for exclusion, and other targets cannot be used to exclude regions of proximity targets." extends="GeoTarget">

<cfproperty name="geoPoint" required="no" type="GeoPoint" hint="Latitude and longitude. This field is required and should not be null." seq="1">
<cfproperty name="radiusDistanceUnits" required="no" type="string" hint="Radius distance units. This field is required and should not be null." seq="2">
<cfproperty name="radiusInUnits" required="no" type="double" hint="Radius expressed in distance units." seq="3">
<cfproperty name="address" required="no" type="Address" hint="Full address; null if unknonwn." seq="4">
<cfproperty name="allowServiceOfAddress" required="no" type="boolean" hint="True iff address is allowed to be served." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("GeoTarget")>

<cffunction name="getGeoPoint" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['geoPoint']" default="">
	<cfreturn variables["instance"]["geoPoint"]>
	
</cffunction>

<cffunction name="setGeoPoint" access="public" returntype="void" output="No">
<cfargument name="geoPoint" required="Yes" type="any">
	
	<cfset variables["instance"]["geoPoint"]=arguments["geoPoint"]>
		
</cffunction>

<cffunction name="getRadiusDistanceUnits" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['radiusDistanceUnits']" default="">
	<cfreturn variables["instance"]["radiusDistanceUnits"]>
	
</cffunction>

<cffunction name="setRadiusDistanceUnits" access="public" returntype="void" output="No">
<cfargument name="radiusDistanceUnits" required="Yes" type="any">
	
	<cfset variables["instance"]["radiusDistanceUnits"]=arguments["radiusDistanceUnits"]>
		
</cffunction>

<cffunction name="getRadiusInUnits" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['radiusInUnits']" default="">
	<cfreturn variables["instance"]["radiusInUnits"]>
	
</cffunction>

<cffunction name="setRadiusInUnits" access="public" returntype="void" output="No">
<cfargument name="radiusInUnits" required="Yes" type="any">
	
	<cfset variables["instance"]["radiusInUnits"]=arguments["radiusInUnits"]>
		
</cffunction>

<cffunction name="getAddress" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['address']" default="">
	<cfreturn variables["instance"]["address"]>
	
</cffunction>

<cffunction name="setAddress" access="public" returntype="void" output="No">
<cfargument name="address" required="Yes" type="any">
	
	<cfset variables["instance"]["address"]=arguments["address"]>
		
</cffunction>

<cffunction name="getAllowServiceOfAddress" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['allowServiceOfAddress']" default="">
	<cfreturn variables["instance"]["allowServiceOfAddress"]>
	
</cffunction>

<cffunction name="setAllowServiceOfAddress" access="public" returntype="void" output="No">
<cfargument name="allowServiceOfAddress" required="Yes" type="any">
	
	<cfset variables["instance"]["allowServiceOfAddress"]=arguments["allowServiceOfAddress"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
