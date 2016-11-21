<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Job" hint="Represents an asynchronous macro unit of work." extends="utils">

<cfproperty name="customerJobKey" required="no" type="string" hint="Unique job key (per customer) for guarding against duplicate job submissions. This field is optional. This field is read only and should not be set for following Operators : SET. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="context" required="no" type="JobContext" hint="The request and processing context of this job. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="failureReason" required="no" type="ApiErrorReason" hint="Failure reason if this job has failed. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="stats" required="no" type="JobStats" hint="The statistics concerning the processing of this job. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="billingSummary" required="no" type="BillingSummary" hint="The billing summary specifying the cost of this job. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">
<cfproperty name="Job_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of Job of this instance. It is ignored on input, and instead xsi:type should be specified." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCustomerJobKey" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['customerJobKey']" default="">
	<cfreturn variables["instance"]["customerJobKey"]>
	
</cffunction>

<cffunction name="setCustomerJobKey" access="public" returntype="void" output="No">
<cfargument name="customerJobKey" required="Yes" type="any">
	
	<cfset variables["instance"]["customerJobKey"]=arguments["customerJobKey"]>
		
</cffunction>

<cffunction name="getContext" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['context']" default="">
	<cfreturn variables["instance"]["context"]>
	
</cffunction>

<cffunction name="setContext" access="public" returntype="void" output="No">
<cfargument name="context" required="Yes" type="any">
	
	<cfset variables["instance"]["context"]=arguments["context"]>
		
</cffunction>

<cffunction name="getFailureReason" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['failureReason']" default="">
	<cfreturn variables["instance"]["failureReason"]>
	
</cffunction>

<cffunction name="setFailureReason" access="public" returntype="void" output="No">
<cfargument name="failureReason" required="Yes" type="any">
	
	<cfset variables["instance"]["failureReason"]=arguments["failureReason"]>
		
</cffunction>

<cffunction name="getStats" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['stats']" default="">
	<cfreturn variables["instance"]["stats"]>
	
</cffunction>

<cffunction name="setStats" access="public" returntype="void" output="No">
<cfargument name="stats" required="Yes" type="any">
	
	<cfset variables["instance"]["stats"]=arguments["stats"]>
		
</cffunction>

<cffunction name="getBillingSummary" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['billingSummary']" default="">
	<cfreturn variables["instance"]["billingSummary"]>
	
</cffunction>

<cffunction name="setBillingSummary" access="public" returntype="void" output="No">
<cfargument name="billingSummary" required="Yes" type="any">
	
	<cfset variables["instance"]["billingSummary"]=arguments["billingSummary"]>
		
</cffunction>

<cffunction name="getJobType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Job_Type']" default="">
	<cfreturn variables["instance"]["Job_Type"]>
	
</cffunction>

<cffunction name="setJobType" access="public" returntype="void" output="No">
<cfargument name="Job_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Job_Type"]=arguments["Job_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
