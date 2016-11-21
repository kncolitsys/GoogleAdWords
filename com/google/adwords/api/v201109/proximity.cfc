<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Proximity" hint="Represents a Proximity Criterion. A proximity is an area within a certain radius of a point with the center point being described by a lat/long pair. The caller may also alternatively provide address fields which will be geocoded into a lat/long pair. Note: If a geoPoint value is provided, the address is not used for calculating the lat/long to target. A criterion of this type is only targetable." extends="Criterion">

<cfproperty name="geoPoint" required="no" type="GeoPoint" hint="Latitude and longitude. This field can be selected using the value 'GeoPoint'." seq="4">
<cfproperty name="radiusDistanceUnits" required="no" type="string" hint="Radius distance units. This field can be selected using the value 'RadiusDistanceUnits'. This field is required and should not be null when it is contained within Operators : ADD." seq="5">
<cfproperty name="radiusInUnits" required="no" type="double" hint="Radius expressed in distance units. This field can be selected using the value 'RadiusInUnits'. This field is required and should not be null when it is contained within Operators : ADD." seq="6">
<cfproperty name="address" required="no" type="Address" hint="Full address; null if unknonwn. This field can be selected using the value 'Address'." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Proximity")>

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

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
