<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="GeoPoint" hint="Specifies a geo location with the supplied latitude/longitude." extends="utils">

<cfproperty name="latitudeInMicroDegrees" required="no" type="int" hint="Micro degrees for the latitude. This field is required and should not be null." seq="1">
<cfproperty name="longitudeInMicroDegrees" required="no" type="int" hint="Micro degrees for the longitude. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getLatitudeInMicroDegrees" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['latitudeInMicroDegrees']" default="">
	<cfreturn variables["instance"]["latitudeInMicroDegrees"]>
	
</cffunction>

<cffunction name="setLatitudeInMicroDegrees" access="public" returntype="void" output="No">
<cfargument name="latitudeInMicroDegrees" required="Yes" type="any">
	
	<cfset variables["instance"]["latitudeInMicroDegrees"]=arguments["latitudeInMicroDegrees"]>
		
</cffunction>

<cffunction name="getLongitudeInMicroDegrees" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['longitudeInMicroDegrees']" default="">
	<cfreturn variables["instance"]["longitudeInMicroDegrees"]>
	
</cffunction>

<cffunction name="setLongitudeInMicroDegrees" access="public" returntype="void" output="No">
<cfargument name="longitudeInMicroDegrees" required="Yes" type="any">
	
	<cfset variables["instance"]["longitudeInMicroDegrees"]=arguments["longitudeInMicroDegrees"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
