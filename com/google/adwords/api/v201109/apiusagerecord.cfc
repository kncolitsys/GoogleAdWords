<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ApiUsageRecord" hint="Data record for per client API units." extends="utils">

<cfproperty name="clientEmail" required="no" type="string" hint="The email address of the client" seq="1">
<cfproperty name="clientCustomerId" required="no" type="long" hint="The customer ID of the client" seq="2">
<cfproperty name="cost" required="no" type="long" hint="The cost of the API" seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getClientEmail" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientEmail']" default="">
	<cfreturn variables["instance"]["clientEmail"]>
	
</cffunction>

<cffunction name="setClientEmail" access="public" returntype="void" output="No">
<cfargument name="clientEmail" required="Yes" type="any">
	
	<cfset variables["instance"]["clientEmail"]=arguments["clientEmail"]>
		
</cffunction>

<cffunction name="getClientCustomerId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientCustomerId']" default="">
	<cfreturn variables["instance"]["clientCustomerId"]>
	
</cffunction>

<cffunction name="setClientCustomerId" access="public" returntype="void" output="No">
<cfargument name="clientCustomerId" required="Yes" type="any">
	
	<cfset variables["instance"]["clientCustomerId"]=arguments["clientCustomerId"]>
		
</cffunction>

<cffunction name="getCost" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['cost']" default="">
	<cfreturn variables["instance"]["cost"]>
	
</cffunction>

<cffunction name="setCost" access="public" returntype="void" output="No">
<cfargument name="cost" required="Yes" type="any">
	
	<cfset variables["instance"]["cost"]=arguments["cost"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/info/v201109">
	
</cffunction>	

</cfcomponent>
