<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="SoapResponseHeader" hint="Defines the elements within the header of a SOAP response." extends="utils">

<cfproperty name="requestId" required="no" type="string" hint="Unique id that identifies this request. If developers have any support issues, sending us this id will enable us to find their request more easily." seq="1">
<cfproperty name="operations" required="no" type="long" hint="Number of operations performed for this SOAP request." seq="2">
<cfproperty name="responseTime" required="no" type="long" hint="Elapsed time in milliseconds between the AdWords API receiving the request and sending the response." seq="3">
<cfproperty name="units" required="no" type="long" hint="Total number of API units the SOAP request used." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getRequestId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['requestId']" default="">
	<cfreturn variables["instance"]["requestId"]>
	
</cffunction>

<cffunction name="setRequestId" access="public" returntype="void" output="No">
<cfargument name="requestId" required="Yes" type="any">
	
	<cfset variables["instance"]["requestId"]=arguments["requestId"]>
		
</cffunction>

<cffunction name="getOperations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operations']" default="">
	<cfreturn variables["instance"]["operations"]>
	
</cffunction>

<cffunction name="setOperations" access="public" returntype="void" output="No">
<cfargument name="operations" required="Yes" type="any">
	
	<cfset variables["instance"]["operations"]=arguments["operations"]>
		
</cffunction>

<cffunction name="getResponseTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['responseTime']" default="">
	<cfreturn variables["instance"]["responseTime"]>
	
</cffunction>

<cffunction name="setResponseTime" access="public" returntype="void" output="No">
<cfargument name="responseTime" required="Yes" type="any">
	
	<cfset variables["instance"]["responseTime"]=arguments["responseTime"]>
		
</cffunction>

<cffunction name="getUnits" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['units']" default="">
	<cfreturn variables["instance"]["units"]>
	
</cffunction>

<cffunction name="setUnits" access="public" returntype="void" output="No">
<cfargument name="units" required="Yes" type="any">
	
	<cfset variables["instance"]["units"]=arguments["units"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
