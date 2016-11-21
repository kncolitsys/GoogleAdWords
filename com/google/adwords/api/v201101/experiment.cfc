<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Experiment" hint="Class representing a experiment for the ExperimentService." extends="utils">

<cfproperty name="id" required="no" type="long" hint="This field can be selected using the value 'Id'.This field can be filtered on. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored. This field is required and should not be null when it is contained within Operators : SET." seq="1">
<cfproperty name="controlId" required="no" type="long" hint="The id of the control associated with this experiment This field can be selected using the value 'ControlId'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="campaignId" required="no" type="long" hint="This field can be selected using the value 'CampaignId'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : ADD." seq="3">
<cfproperty name="name" required="no" type="string" hint="Experiment name. This field can be selected using the value 'Name'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : ADD. This string must not be empty." seq="4">
<cfproperty name="status" required="no" type="string" hint="Status of the experiment. For ADD, this can only be ACTIVE, as nothing else makes sense. Default is ACTIVE for ADDs where this field is omitted. This field can be selected using the value 'Status'.This field can be filtered on." seq="5">
<cfproperty name="servingStatus" required="no" type="string" hint="Serving status of the experiment. This field can be selected using the value 'ServingStatus'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="6">
<cfproperty name="queryPercentage" required="no" type="int" hint="The percentage of queries that will get routed to the experiment. It is also the percentage of budget that will be used for the experiment. Valid values for this field are 10, 20, 30, 40, 50, 60, 70, 80, 90. This field can be selected using the value 'QueryPercentage'.This field can be filtered on. This field must be between 0.0 and 100.0, inclusive. This field is required and should not be null when it is contained within Operators : ADD." seq="7">
<cfproperty name="startDateTime" required="no" type="string" hint="Experiment started serving date; null indicates campaign start date is indefinitely in the future. This field can be selected using the value 'StartDateTime'.This field can be filtered on." seq="8">
<cfproperty name="endDateTime" required="no" type="string" hint="Experiment ended serving date; null indicates campaign end date depends on start date. If start date is null, this is undefined. If start date is not null, this defaults to 30 days after the start date. This field can be selected using the value 'EndDateTime'.This field can be filtered on." seq="9">
<cfproperty name="lastModifiedDateTime" required="no" type="string" hint="The last time any change was made to this experiment, such as adding a keyword to the experiment only, adding a keyword to the control only, or updating a bid modifier. This field can be selected using the value 'LastModifiedDateTime'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="10">
<cfproperty name="experimentSummaryStats" required="no" type="ExperimentSummaryStats" hint="This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="11">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getControlId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['controlId']" default="">
	<cfreturn variables["instance"]["controlId"]>
	
</cffunction>

<cffunction name="setControlId" access="public" returntype="void" output="No">
<cfargument name="controlId" required="Yes" type="any">
	
	<cfset variables["instance"]["controlId"]=arguments["controlId"]>
		
</cffunction>

<cffunction name="getCampaignId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignId']" default="">
	<cfreturn variables["instance"]["campaignId"]>
	
</cffunction>

<cffunction name="setCampaignId" access="public" returntype="void" output="No">
<cfargument name="campaignId" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignId"]=arguments["campaignId"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getServingStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['servingStatus']" default="">
	<cfreturn variables["instance"]["servingStatus"]>
	
</cffunction>

<cffunction name="setServingStatus" access="public" returntype="void" output="No">
<cfargument name="servingStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["servingStatus"]=arguments["servingStatus"]>
		
</cffunction>

<cffunction name="getQueryPercentage" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['queryPercentage']" default="">
	<cfreturn variables["instance"]["queryPercentage"]>
	
</cffunction>

<cffunction name="setQueryPercentage" access="public" returntype="void" output="No">
<cfargument name="queryPercentage" required="Yes" type="any">
	
	<cfset variables["instance"]["queryPercentage"]=arguments["queryPercentage"]>
		
</cffunction>

<cffunction name="getStartDateTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['startDateTime']" default="">
	<cfreturn variables["instance"]["startDateTime"]>
	
</cffunction>

<cffunction name="setStartDateTime" access="public" returntype="void" output="No">
<cfargument name="startDateTime" required="Yes" type="any">
	
	<cfset variables["instance"]["startDateTime"]=arguments["startDateTime"]>
		
</cffunction>

<cffunction name="getEndDateTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['endDateTime']" default="">
	<cfreturn variables["instance"]["endDateTime"]>
	
</cffunction>

<cffunction name="setEndDateTime" access="public" returntype="void" output="No">
<cfargument name="endDateTime" required="Yes" type="any">
	
	<cfset variables["instance"]["endDateTime"]=arguments["endDateTime"]>
		
</cffunction>

<cffunction name="getLastModifiedDateTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['lastModifiedDateTime']" default="">
	<cfreturn variables["instance"]["lastModifiedDateTime"]>
	
</cffunction>

<cffunction name="setLastModifiedDateTime" access="public" returntype="void" output="No">
<cfargument name="lastModifiedDateTime" required="Yes" type="any">
	
	<cfset variables["instance"]["lastModifiedDateTime"]=arguments["lastModifiedDateTime"]>
		
</cffunction>

<cffunction name="getExperimentSummaryStats" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentSummaryStats']" default="">
	<cfreturn variables["instance"]["experimentSummaryStats"]>
	
</cffunction>

<cffunction name="setExperimentSummaryStats" access="public" returntype="void" output="No">
<cfargument name="experimentSummaryStats" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentSummaryStats"]=arguments["experimentSummaryStats"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
