<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="JobEvent" hint="An event defined by a status change of a job." extends="utils">

<cfproperty name="dateTime" required="no" type="string" hint="Time when the job status changed." seq="1">
<cfproperty name="JobEvent_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of JobEvent. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getDateTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dateTime']" default="">
	<cfreturn variables["instance"]["dateTime"]>
	
</cffunction>

<cffunction name="setDateTime" access="public" returntype="void" output="No">
<cfargument name="dateTime" required="Yes" type="any">
	
	<cfset variables["instance"]["dateTime"]=arguments["dateTime"]>
		
</cffunction>

<cffunction name="getJobEventType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['JobEvent_Type']" default="">
	<cfreturn variables["instance"]["JobEvent_Type"]>
	
</cffunction>

<cffunction name="setJobEventType" access="public" returntype="void" output="No">
<cfargument name="JobEvent_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["JobEvent_Type"]=arguments["JobEvent_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
