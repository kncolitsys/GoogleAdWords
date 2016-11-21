<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Alert" hint="Alert for a single client. Triggering events are grouped by AlertType into the same alert with multiple Details." extends="utils">

<cfproperty name="alertSeverity" required="no" type="string" seq="1">
<cfproperty name="alertType" required="no" type="string" seq="2">
<cfproperty name="clientCustomerId" required="no" type="long" hint="The 10-digit Customer ID of the client causing this alert." seq="3">
<cfproperty name="details" required="no" type="Detail[]" hint="List of Details sorted by most recent trigger time." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAlertSeverity" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['alertSeverity']" default="">
	<cfreturn variables["instance"]["alertSeverity"]>
	
</cffunction>

<cffunction name="setAlertSeverity" access="public" returntype="void" output="No">
<cfargument name="alertSeverity" required="Yes" type="any">
	
	<cfset variables["instance"]["alertSeverity"]=arguments["alertSeverity"]>
		
</cffunction>

<cffunction name="getAlertType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['alertType']" default="">
	<cfreturn variables["instance"]["alertType"]>
	
</cffunction>

<cffunction name="setAlertType" access="public" returntype="void" output="No">
<cfargument name="alertType" required="Yes" type="any">
	
	<cfset variables["instance"]["alertType"]=arguments["alertType"]>
		
</cffunction>

<cffunction name="getClientCustomerId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientCustomerId']" default="">
	<cfreturn variables["instance"]["clientCustomerId"]>
	
</cffunction>

<cffunction name="setClientCustomerId" access="public" returntype="void" output="No">
<cfargument name="clientCustomerId" required="Yes" type="any">
	
	<cfset variables["instance"]["clientCustomerId"]=arguments["clientCustomerId"]>
		
</cffunction>

<cffunction name="getDetails" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['details']" default="">
	<cfreturn variables["instance"]["details"]>
	
</cffunction>

<cffunction name="setDetails" access="public" returntype="void" output="No">
<cfargument name="details" required="Yes" type="any">
	
	<cfset variables["instance"]["details"]=arguments["details"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201109">
	
</cffunction>	

</cfcomponent>
