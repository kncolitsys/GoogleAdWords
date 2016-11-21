<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AlertQuery" hint="Querying criteria for getting alerts." extends="utils">

<cfproperty name="clientSpec" required="no" type="string" hint="Specifies what clients to get alerts for. This field is required and should not be null." seq="1">
<cfproperty name="filterSpec" required="no" type="string" hint="Specifies whether/how to filter the result set based on whether the customer can manage. This field is required and should not be null." seq="2">
<cfproperty name="types" required="no" type="string[]" hint="The specific types of Alerts to return. This field must not contain null elements." seq="3">
<cfproperty name="severities" required="no" type="string[]" hint="This field must not contain null elements." seq="4">
<cfproperty name="triggerTimeSpec" required="no" type="string" hint="Specifies what time interval for which to get alerts. This field is required and should not be null." seq="5">
<cfproperty name="triggerTime" required="no" type="string" hint="If TriggerTimeSpec CUSTOM_TIME was specified, only alerts generated after this time will be returned." seq="6">
<cfproperty name="clientCustomerIds" required="no" type="long[]" hint="If {@link ClientSpec ID_LIST is specified, only alerts for the client accounts specified here will be returned. This field must contain distinct elements." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getClientSpec" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientSpec']" default="">
	<cfreturn variables["instance"]["clientSpec"]>
	
</cffunction>

<cffunction name="setClientSpec" access="public" returntype="void" output="No">
<cfargument name="clientSpec" required="Yes" type="any">
	
	<cfset variables["instance"]["clientSpec"]=arguments["clientSpec"]>
		
</cffunction>

<cffunction name="getFilterSpec" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['filterSpec']" default="">
	<cfreturn variables["instance"]["filterSpec"]>
	
</cffunction>

<cffunction name="setFilterSpec" access="public" returntype="void" output="No">
<cfargument name="filterSpec" required="Yes" type="any">
	
	<cfset variables["instance"]["filterSpec"]=arguments["filterSpec"]>
		
</cffunction>

<cffunction name="getTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['types']" default="">
	<cfreturn variables["instance"]["types"]>
	
</cffunction>

<cffunction name="setTypes" access="public" returntype="void" output="No">
<cfargument name="types" required="Yes" type="any">
	
	<cfset variables["instance"]["types"]=arguments["types"]>
		
</cffunction>

<cffunction name="getSeverities" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['severities']" default="">
	<cfreturn variables["instance"]["severities"]>
	
</cffunction>

<cffunction name="setSeverities" access="public" returntype="void" output="No">
<cfargument name="severities" required="Yes" type="any">
	
	<cfset variables["instance"]["severities"]=arguments["severities"]>
		
</cffunction>

<cffunction name="getTriggerTimeSpec" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['triggerTimeSpec']" default="">
	<cfreturn variables["instance"]["triggerTimeSpec"]>
	
</cffunction>

<cffunction name="setTriggerTimeSpec" access="public" returntype="void" output="No">
<cfargument name="triggerTimeSpec" required="Yes" type="any">
	
	<cfset variables["instance"]["triggerTimeSpec"]=arguments["triggerTimeSpec"]>
		
</cffunction>

<cffunction name="getTriggerTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['triggerTime']" default="">
	<cfreturn variables["instance"]["triggerTime"]>
	
</cffunction>

<cffunction name="setTriggerTime" access="public" returntype="void" output="No">
<cfargument name="triggerTime" required="Yes" type="any">
	
	<cfset variables["instance"]["triggerTime"]=arguments["triggerTime"]>
		
</cffunction>

<cffunction name="getClientCustomerIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientCustomerIds']" default="">
	<cfreturn variables["instance"]["clientCustomerIds"]>
	
</cffunction>

<cffunction name="setClientCustomerIds" access="public" returntype="void" output="No">
<cfargument name="clientCustomerIds" required="Yes" type="any">
	
	<cfset variables["instance"]["clientCustomerIds"]=arguments["clientCustomerIds"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201101">
	
</cffunction>	

</cfcomponent>
