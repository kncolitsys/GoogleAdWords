<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Link" hint="Represents an AdWords manager-client link." extends="utils">

<cfproperty name="managerId" required="no" type="CustomerId" hint="The ID of the manager represented in ths link." seq="1">
<cfproperty name="clientId" required="no" type="CustomerId" hint="The ID of the client represented in this link." seq="2">
<cfproperty name="serviceType" required="no" type="string" hint="The service level of this link." seq="3">
<cfproperty name="typeOfLink" required="no" type="string" hint="Whether the link has been established." seq="4">
<cfproperty name="descriptiveName" required="no" type="string" hint="The descriptive name used by the manager to refer to the client." seq="5">
<cfproperty name="Link_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/mcm/v201101'" hint="This field indicates the subtype of Link of this instance. It is ignored on input, and instead xsi:type should be specified." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getManagerId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['managerId']" default="">
	<cfreturn variables["instance"]["managerId"]>
	
</cffunction>

<cffunction name="setManagerId" access="public" returntype="void" output="No">
<cfargument name="managerId" required="Yes" type="any">
	
	<cfset variables["instance"]["managerId"]=arguments["managerId"]>
		
</cffunction>

<cffunction name="getClientId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientId']" default="">
	<cfreturn variables["instance"]["clientId"]>
	
</cffunction>

<cffunction name="setClientId" access="public" returntype="void" output="No">
<cfargument name="clientId" required="Yes" type="any">
	
	<cfset variables["instance"]["clientId"]=arguments["clientId"]>
		
</cffunction>

<cffunction name="getServiceType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['serviceType']" default="">
	<cfreturn variables["instance"]["serviceType"]>
	
</cffunction>

<cffunction name="setServiceType" access="public" returntype="void" output="No">
<cfargument name="serviceType" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceType"]=arguments["serviceType"]>
		
</cffunction>

<cffunction name="getTypeOfLink" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['typeOfLink']" default="">
	<cfreturn variables["instance"]["typeOfLink"]>
	
</cffunction>

<cffunction name="setTypeOfLink" access="public" returntype="void" output="No">
<cfargument name="typeOfLink" required="Yes" type="any">
	
	<cfset variables["instance"]["typeOfLink"]=arguments["typeOfLink"]>
		
</cffunction>

<cffunction name="getDescriptiveName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['descriptiveName']" default="">
	<cfreturn variables["instance"]["descriptiveName"]>
	
</cffunction>

<cffunction name="setDescriptiveName" access="public" returntype="void" output="No">
<cfargument name="descriptiveName" required="Yes" type="any">
	
	<cfset variables["instance"]["descriptiveName"]=arguments["descriptiveName"]>
		
</cffunction>

<cffunction name="getLinkType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Link_Type']" default="">
	<cfreturn variables["instance"]["Link_Type"]>
	
</cffunction>

<cffunction name="setLinkType" access="public" returntype="void" output="No">
<cfargument name="Link_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Link_Type"]=arguments["Link_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201101">
	
</cffunction>	

</cfcomponent>
