<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Media_Size_StringMapEntry" hint="This represents an entry in a map with a key of type Size and value of type String." extends="utils">

<cfproperty name="key" required="no" type="string" seq="1">
<cfproperty name="value" required="no" type="string" seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getKey" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['key']" default="">
	<cfreturn variables["instance"]["key"]>
	
</cffunction>

<cffunction name="setKey" access="public" returntype="void" output="No">
<cfargument name="key" required="Yes" type="any">
	
	<cfset variables["instance"]["key"]=arguments["key"]>
		
</cffunction>

<cffunction name="getValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['value']" default="">
	<cfreturn variables["instance"]["value"]>
	
</cffunction>

<cffunction name="setValue" access="public" returntype="void" output="No">
<cfargument name="value" required="Yes" type="any">
	
	<cfset variables["instance"]["value"]=arguments["value"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
