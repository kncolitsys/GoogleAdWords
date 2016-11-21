<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LocationOverrideInfo" hint="Represents override info for ad level LocationExtension overrides." extends="utils">

<cfproperty name="radius" required="no" type="int" hint="Radius in the given units to target around the location indicated by the location extension. This field is required and should not be null." seq="1">
<cfproperty name="radiusUnits" required="no" type="string" hint="Units for the radius This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getRadius" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['radius']" default="">
	<cfreturn variables["instance"]["radius"]>
	
</cffunction>

<cffunction name="setRadius" access="public" returntype="void" output="No">
<cfargument name="radius" required="Yes" type="any">
	
	<cfset variables["instance"]["radius"]=arguments["radius"]>
		
</cffunction>

<cffunction name="getRadiusUnits" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['radiusUnits']" default="">
	<cfreturn variables["instance"]["radiusUnits"]>
	
</cffunction>

<cffunction name="setRadiusUnits" access="public" returntype="void" output="No">
<cfargument name="radiusUnits" required="Yes" type="any">
	
	<cfset variables["instance"]["radiusUnits"]=arguments["radiusUnits"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
