<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="GeoLocation" hint="Class representing a location with its geographic coordinates." extends="utils">

<cfproperty name="geoPoint" required="no" type="GeoPoint" hint="Latitude/Longitude of the location. This field is required and should not be null." seq="1">
<cfproperty name="address" required="no" type="Address" hint="Address of the location. This field is required and should not be null." seq="2">
<cfproperty name="encodedLocation" required="no" type="base64Binary" hint="Encoded location information. This field is required and should not be null." seq="3">
<cfproperty name="GeoLocation_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of GeoLocation of this instance. It is ignored on input, and instead xsi:type should be specified." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getGeoPoint" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['geoPoint']" default="">
	<cfreturn variables["instance"]["geoPoint"]>
	
</cffunction>

<cffunction name="setGeoPoint" access="public" returntype="void" output="No">
<cfargument name="geoPoint" required="Yes" type="any">
	
	<cfset variables["instance"]["geoPoint"]=arguments["geoPoint"]>
		
</cffunction>

<cffunction name="getAddress" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['address']" default="">
	<cfreturn variables["instance"]["address"]>
	
</cffunction>

<cffunction name="setAddress" access="public" returntype="void" output="No">
<cfargument name="address" required="Yes" type="any">
	
	<cfset variables["instance"]["address"]=arguments["address"]>
		
</cffunction>

<cffunction name="getEncodedLocation" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['encodedLocation']" default="">
	<cfreturn variables["instance"]["encodedLocation"]>
	
</cffunction>

<cffunction name="setEncodedLocation" access="public" returntype="void" output="No">
<cfargument name="encodedLocation" required="Yes" type="any">
	
	<cfset variables["instance"]["encodedLocation"]=arguments["encodedLocation"]>
		
</cffunction>

<cffunction name="getGeoLocationType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['GeoLocation_Type']" default="">
	<cfreturn variables["instance"]["GeoLocation_Type"]>
	
</cffunction>

<cffunction name="setGeoLocationType" access="public" returntype="void" output="No">
<cfargument name="GeoLocation_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["GeoLocation_Type"]=arguments["GeoLocation_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
