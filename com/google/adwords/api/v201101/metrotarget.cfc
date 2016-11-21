<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MetroTarget" hint="Represents US metropolitan regions (metros) for targeting. The list of metros available for targeting are listed here." extends="GeoTarget">

<cfproperty name="metroCode" required="no" type="string" hint="Metro code. This field is required and should not be null. This string must not be empty." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("GeoTarget")>

<cffunction name="getMetroCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['metroCode']" default="">
	<cfreturn variables["instance"]["metroCode"]>
	
</cffunction>

<cffunction name="setMetroCode" access="public" returntype="void" output="No">
<cfargument name="metroCode" required="Yes" type="any">
	
	<cfset variables["instance"]["metroCode"]=arguments["metroCode"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
