<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="GeoTarget" hint="Abstract class to identify a geographic target." extends="Target">

<cfproperty name="excluded" required="no" type="boolean" hint="Target is to be excluded if set to true; false means it is to be included." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("GeoTarget")>

<cffunction name="getExcluded" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['excluded']" default="">
	<cfreturn variables["instance"]["excluded"]>
	
</cffunction>

<cffunction name="setExcluded" access="public" returntype="void" output="No">
<cfargument name="excluded" required="Yes" type="any">
	
	<cfset variables["instance"]["excluded"]=arguments["excluded"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
