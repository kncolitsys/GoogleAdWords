<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PolicyViolationError.Part" hint="Points to a substring within an ad field or criterion." extends="utils">

<cfproperty name="index" required="no" type="int" hint="Index of the starting position of the violating text within the line." seq="1">
<cfproperty name="length" required="no" type="int" hint="The length of the violating text." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getIndex" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['index']" default="">
	<cfreturn variables["instance"]["index"]>
	
</cffunction>

<cffunction name="setIndex" access="public" returntype="void" output="No">
<cfargument name="index" required="Yes" type="any">
	
	<cfset variables["instance"]["index"]=arguments["index"]>
		
</cffunction>

<cffunction name="getLength" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['length']" default="">
	<cfreturn variables["instance"]["length"]>
	
</cffunction>

<cffunction name="setLength" access="public" returntype="void" output="No">
<cfargument name="length" required="Yes" type="any">
	
	<cfset variables["instance"]["length"]=arguments["length"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
