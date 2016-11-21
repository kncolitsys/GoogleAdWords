<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="JobContext" hint="Represents the request and processing context information of a job." extends="utils">

<cfproperty name="authenticatedUserEmail" required="no" type="string" hint="The login email of the authenticated user who submitted the job request." seq="1">
<cfproperty name="effectiveCustomerId" required="no" type="long" hint="The id of the customer being operated upon in the job request." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAuthenticatedUserEmail" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['authenticatedUserEmail']" default="">
	<cfreturn variables["instance"]["authenticatedUserEmail"]>
	
</cffunction>

<cffunction name="setAuthenticatedUserEmail" access="public" returntype="void" output="No">
<cfargument name="authenticatedUserEmail" required="Yes" type="any">
	
	<cfset variables["instance"]["authenticatedUserEmail"]=arguments["authenticatedUserEmail"]>
		
</cffunction>

<cffunction name="getEffectiveCustomerId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['effectiveCustomerId']" default="">
	<cfreturn variables["instance"]["effectiveCustomerId"]>
	
</cffunction>

<cffunction name="setEffectiveCustomerId" access="public" returntype="void" output="No">
<cfargument name="effectiveCustomerId" required="Yes" type="any">
	
	<cfset variables["instance"]["effectiveCustomerId"]=arguments["effectiveCustomerId"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
