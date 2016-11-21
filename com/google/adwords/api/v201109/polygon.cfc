<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Polygon" hint="Represents a Polygon Criterion. A polygon is described by a list of at least three points, where each point is a (latitude, longitude) ordered pair. No point can be more than 400km from the center of the polygon. The points are specified in microdegrees, the precison for the value is 1 second of angle which is equal to 277 microdegrees. Please note that Polygons are deprecated. This means that Polygon targets cannot be added through the API, though existing targets can be retrieved and deleted." extends="Criterion">

<cfproperty name="vertices" required="no" type="GeoPoint[]" hint="The latitude/longitude points that define the polygon. At least three points are required, and no point can be more than 400km away from the center of the polygon. This field can be selected using the value 'Vertices'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Polygon")>

<cffunction name="getVertices" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['vertices']" default="">
	<cfreturn variables["instance"]["vertices"]>
	
</cffunction>

<cffunction name="setVertices" access="public" returntype="void" output="No">
<cfargument name="vertices" required="Yes" type="any">
	
	<cfset variables["instance"]["vertices"]=arguments["vertices"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
