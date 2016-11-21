<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="DateTimeRange" extends="utils">

<cfproperty name="min" required="no" type="string" seq="1">
<cfproperty name="max" required="no" type="string" seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getMin" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['min']" default="">
	<cfreturn variables["instance"]["min"]>
	
</cffunction>

<cffunction name="setMin" access="public" returntype="void" output="No">
<cfargument name="min" required="Yes" type="any">
	
	<cfset variables["instance"]["min"]=arguments["min"]>
		
</cffunction>

<cffunction name="getMax" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['max']" default="">
	<cfreturn variables["instance"]["max"]>
	
</cffunction>

<cffunction name="setMax" access="public" returntype="void" output="No">
<cfargument name="max" required="Yes" type="any">
	
	<cfset variables["instance"]["max"]=arguments["max"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
