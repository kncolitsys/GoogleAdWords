<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Dimensions" hint="Represents a simple height-width dimension." extends="utils">

<cfproperty name="width" required="no" type="int" hint="Width of the dimension This field can be selected using the value 'Width'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="height" required="no" type="int" hint="Height of the dimension This field can be selected using the value 'Height'.This field can be filtered on. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getWidth" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['width']" default="">
	<cfreturn variables["instance"]["width"]>
	
</cffunction>

<cffunction name="setWidth" access="public" returntype="void" output="No">
<cfargument name="width" required="Yes" type="any">
	
	<cfset variables["instance"]["width"]=arguments["width"]>
		
</cffunction>

<cffunction name="getHeight" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['height']" default="">
	<cfreturn variables["instance"]["height"]>
	
</cffunction>

<cffunction name="setHeight" access="public" returntype="void" output="No">
<cfargument name="height" required="Yes" type="any">
	
	<cfset variables["instance"]["height"]=arguments["height"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
