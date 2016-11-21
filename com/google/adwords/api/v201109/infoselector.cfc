<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="InfoSelector" hint="Specifies the type of API usage information to be returned. API usage information returned is based on the type specified. All returned values are specific to the developer token being used to call InfoService.get. For each of the apiUsageType values, other InfoSelector fields must also be set as described below: FREE_USAGE_API_UNITS_PER_MONTH : Returns the number of allocated free API units for this entire month. Specify only the apiUsageType parameter. TOTAL_USAGE_API_UNITS_PER_MONTH : Returns the total number of allocated API units for this entire month. Includes both free and paid API units. Specify only the apiUsageType parameter. OPERATION_COUNT : Returns the number of operations recorded over the given date range. The given dates are inclusive; to get the operation count for a single day, supply it as both the start and end date. Specify the apiUsageType and dateRange parameters. UNIT_COUNT : Returns the number of API units recorded. Specify the apiUsageType and dateRange parameters to retrieve the units recorded over the given date range. Specify the apiUsageType, serviceName, methodName and dateRange to retrieve the units recorded over the given date range for a specified method. UNIT_COUNT_FOR_CLIENTS : Returns the number of API units recorded for a subset of clients over the given date range. The given dates are inclusive; to get the unit count for a single day, supply it as both the start and end date. Specify the apiUsageType, dateRange and clientEmails parameters. METHOD_COST : Returns the cost, in API units per operation, of the given method on a specific date. Methods default to a cost of 1. Specify the apiUsageType, dateRange (start date and end date should be the same), serviceName, methodName, operator parameters." extends="utils">

<cfproperty name="serviceName" required="no" type="string" hint="The name of the service." seq="1">
<cfproperty name="methodName" required="no" type="string" hint="The method whose cost has been queried." seq="2">
<cfproperty name="operator" required="no" type="string" hint="Specifies the operator. This is applicable when the method is a 'mutate' method." seq="3">
<cfproperty name="dateRange" required="no" type="DateRange" hint="Date range to get the API usage for. The given dates are inclusive; to get the usage information for a single day, supply it as both the start and end date." seq="4">
<cfproperty name="clientEmails" required="no" type="string[]" hint="List of login emails used to identify the clients to retrieve the API usage for. If the list is null or empty, return the API usage for all clients. NOTE: Only one of clientEmails or clientCustomerIds may be specified at once." seq="5">
<cfproperty name="clientCustomerIds" required="no" type="long[]" hint="List of login customer IDs used to identify the clients to retrieve the API usage for. If the list is null or empty, return the API usage for all clients. NOTE: Only one of clientEmails or clientCustomerIds may be specified at once." seq="6">
<cfproperty name="includeSubAccounts" required="no" type="boolean" hint="If true, include child accounts of the MCC in the search." seq="7">
<cfproperty name="apiUsageType" required="no" type="string" hint="The API usage type information that needs to be fetched. This field is required and should not be null." seq="8">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getServiceName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['serviceName']" default="">
	<cfreturn variables["instance"]["serviceName"]>
	
</cffunction>

<cffunction name="setServiceName" access="public" returntype="void" output="No">
<cfargument name="serviceName" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceName"]=arguments["serviceName"]>
		
</cffunction>

<cffunction name="getMethodName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['methodName']" default="">
	<cfreturn variables["instance"]["methodName"]>
	
</cffunction>

<cffunction name="setMethodName" access="public" returntype="void" output="No">
<cfargument name="methodName" required="Yes" type="any">
	
	<cfset variables["instance"]["methodName"]=arguments["methodName"]>
		
</cffunction>

<cffunction name="getOperator" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operator']" default="">
	<cfreturn variables["instance"]["operator"]>
	
</cffunction>

<cffunction name="setOperator" access="public" returntype="void" output="No">
<cfargument name="operator" required="Yes" type="any">
	
	<cfset variables["instance"]["operator"]=arguments["operator"]>
		
</cffunction>

<cffunction name="getDateRange" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dateRange']" default="">
	<cfreturn variables["instance"]["dateRange"]>
	
</cffunction>

<cffunction name="setDateRange" access="public" returntype="void" output="No">
<cfargument name="dateRange" required="Yes" type="any">
	
	<cfset variables["instance"]["dateRange"]=arguments["dateRange"]>
		
</cffunction>

<cffunction name="getClientEmails" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientEmails']" default="">
	<cfreturn variables["instance"]["clientEmails"]>
	
</cffunction>

<cffunction name="setClientEmails" access="public" returntype="void" output="No">
<cfargument name="clientEmails" required="Yes" type="any">
	
	<cfset variables["instance"]["clientEmails"]=arguments["clientEmails"]>
		
</cffunction>

<cffunction name="getClientCustomerIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientCustomerIds']" default="">
	<cfreturn variables["instance"]["clientCustomerIds"]>
	
</cffunction>

<cffunction name="setClientCustomerIds" access="public" returntype="void" output="No">
<cfargument name="clientCustomerIds" required="Yes" type="any">
	
	<cfset variables["instance"]["clientCustomerIds"]=arguments["clientCustomerIds"]>
		
</cffunction>

<cffunction name="getIncludeSubAccounts" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['includeSubAccounts']" default="">
	<cfreturn variables["instance"]["includeSubAccounts"]>
	
</cffunction>

<cffunction name="setIncludeSubAccounts" access="public" returntype="void" output="No">
<cfargument name="includeSubAccounts" required="Yes" type="any">
	
	<cfset variables["instance"]["includeSubAccounts"]=arguments["includeSubAccounts"]>
		
</cffunction>

<cffunction name="getApiUsageType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['apiUsageType']" default="">
	<cfreturn variables["instance"]["apiUsageType"]>
	
</cffunction>

<cffunction name="setApiUsageType" access="public" returntype="void" output="No">
<cfargument name="apiUsageType" required="Yes" type="any">
	
	<cfset variables["instance"]["apiUsageType"]=arguments["apiUsageType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/info/v201109">
	
</cffunction>	

</cfcomponent>
