<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ServicedAccountGraph" hint="Represents a list of the requested managers and clients, and the relationships between them." extends="utils">

<cfproperty name="accounts" required="no" type="Account[]" hint="The accounts found that match the selector query" seq="1">
<cfproperty name="links" required="no" type="Link[]" hint="The manager links between the listed accounts" seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAccounts" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['accounts']" default="">
	<cfreturn variables["instance"]["accounts"]>
	
</cffunction>

<cffunction name="setAccounts" access="public" returntype="void" output="No">
<cfargument name="accounts" required="Yes" type="any">
	
	<cfset variables["instance"]["accounts"]=arguments["accounts"]>
		
</cffunction>

<cffunction name="getLinks" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['links']" default="">
	<cfreturn variables["instance"]["links"]>
	
</cffunction>

<cffunction name="setLinks" access="public" returntype="void" output="No">
<cfargument name="links" required="Yes" type="any">
	
	<cfset variables["instance"]["links"]=arguments["links"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201101">
	
</cffunction>	

</cfcomponent>
