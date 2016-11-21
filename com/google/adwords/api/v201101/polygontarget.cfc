<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PolygonTarget" hint="Represents a geographic region enclosed by a set of vertices (points). A polygon target is described by a list of at least three points, where each point is a (latitude, longitude) ordered pair. No point can be no more than 400km from the center of the polygon. The points are specified in microdegrees, the precison for the value is 1 second which is equal to 277 microdegrees. Polygon targets cannot be used for exclusion, and other targets cannot be used to exclude regions of polygon targets." extends="GeoTarget">

<cfproperty name="vertices" required="no" type="GeoPoint[]" hint="The latitude/longitude points that define the polygon. At least three points are required, and no point can be more than 400km away from the center of the polygon." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("GeoTarget")>

<cffunction name="getVertices" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['vertices']" default="">
	<cfreturn variables["instance"]["vertices"]>
	
</cffunction>

<cffunction name="setVertices" access="public" returntype="void" output="No">
<cfargument name="vertices" required="Yes" type="any">
	
	<cfset variables["instance"]["vertices"]=arguments["vertices"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
