<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="JobStats" hint="Job-handling statistics." extends="utils">

<cfproperty name="progressPercent" required="no" type="int" hint="The percent of the job's total work that is completed." seq="1">
<cfproperty name="pendingTimeMillis" required="no" type="long" hint="The time (in milliseconds) spent by the job in a pending state." seq="2">
<cfproperty name="processingTimeMillis" required="no" type="long" hint="The time (in milliseconds) spent by the job in a processing state." seq="3">
<cfproperty name="JobStats_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of JobStats. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getProgressPercent" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['progressPercent']" default="">
	<cfreturn variables["instance"]["progressPercent"]>
	
</cffunction>

<cffunction name="setProgressPercent" access="public" returntype="void" output="No">
<cfargument name="progressPercent" required="Yes" type="any">
	
	<cfset variables["instance"]["progressPercent"]=arguments["progressPercent"]>
		
</cffunction>

<cffunction name="getPendingTimeMillis" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['pendingTimeMillis']" default="">
	<cfreturn variables["instance"]["pendingTimeMillis"]>
	
</cffunction>

<cffunction name="setPendingTimeMillis" access="public" returntype="void" output="No">
<cfargument name="pendingTimeMillis" required="Yes" type="any">
	
	<cfset variables["instance"]["pendingTimeMillis"]=arguments["pendingTimeMillis"]>
		
</cffunction>

<cffunction name="getProcessingTimeMillis" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['processingTimeMillis']" default="">
	<cfreturn variables["instance"]["processingTimeMillis"]>
	
</cffunction>

<cffunction name="setProcessingTimeMillis" access="public" returntype="void" output="No">
<cfargument name="processingTimeMillis" required="Yes" type="any">
	
	<cfset variables["instance"]["processingTimeMillis"]=arguments["processingTimeMillis"]>
		
</cffunction>

<cffunction name="getJobStatsType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['JobStats_Type']" default="">
	<cfreturn variables["instance"]["JobStats_Type"]>
	
</cffunction>

<cffunction name="setJobStatsType" access="public" returntype="void" output="No">
<cfargument name="JobStats_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["JobStats_Type"]=arguments["JobStats_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
