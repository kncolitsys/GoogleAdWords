<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ApiError" hint="The API error base class that provides details about an error that occurred while processing a service request. The OGNL field path is provided for parsers to identify the request data element that may have caused the error." extends="utils">

<cfproperty name="fieldPath" required="no" type="string" hint="The OGNL field path to identify cause of error." seq="1">
<cfproperty name="trigger" required="no" type="string" hint="The data that caused the error." seq="2">
<cfproperty name="errorString" required="no" type="string" hint="A simple string representation of the error and reason." seq="3">
<cfproperty name="ApiError_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of ApiError. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getFieldPath" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fieldPath']" default="">
	<cfreturn variables["instance"]["fieldPath"]>
	
</cffunction>

<cffunction name="setFieldPath" access="public" returntype="void" output="No">
<cfargument name="fieldPath" required="Yes" type="any">
	
	<cfset variables["instance"]["fieldPath"]=arguments["fieldPath"]>
		
</cffunction>

<cffunction name="getTrigger" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['trigger']" default="">
	<cfreturn variables["instance"]["trigger"]>
	
</cffunction>

<cffunction name="setTrigger" access="public" returntype="void" output="No">
<cfargument name="trigger" required="Yes" type="any">
	
	<cfset variables["instance"]["trigger"]=arguments["trigger"]>
		
</cffunction>

<cffunction name="getErrorString" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['errorString']" default="">
	<cfreturn variables["instance"]["errorString"]>
	
</cffunction>

<cffunction name="setErrorString" access="public" returntype="void" output="No">
<cfargument name="errorString" required="Yes" type="any">
	
	<cfset variables["instance"]["errorString"]=arguments["errorString"]>
		
</cffunction>

<cffunction name="getApiErrorType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ApiError_Type']" default="">
	<cfreturn variables["instance"]["ApiError_Type"]>
	
</cffunction>

<cffunction name="setApiErrorType" access="public" returntype="void" output="No">
<cfargument name="ApiError_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["ApiError_Type"]=arguments["ApiError_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
