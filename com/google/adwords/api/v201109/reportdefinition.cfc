<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ReportDefinition" hint="Represents a report definition." extends="utils">

<cfproperty name="id" required="no" type="long" hint="ID of this report definition. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored. This field is required and should not be null when it is contained within Operators : SET, REMOVE." seq="1">
<cfproperty name="selector" required="no" type="Selector" hint="Defines the report fields and the filters for this report definition. This field is required when creating a new report definition." seq="2">
<cfproperty name="reportName" required="no" type="string" hint="Name of the report definition. This field is required and should not be null when it is contained within Operators : ADD. This string must not be empty." seq="3">
<cfproperty name="reportType" required="no" type="string" hint="Type of the report. This field is required and should not be null when it is contained within Operators : ADD." seq="4">
<cfproperty name="hasAttachment" required="no" type="boolean" hint="Flag to indicate whether report will be sent as email attachment." seq="5">
<cfproperty name="dateRangeType" required="no" type="string" hint="Date range for running report. This field is required and should not be null when it is contained within Operators : ADD." seq="6">
<cfproperty name="downloadFormat" required="no" type="string" hint="Download format of report contents. This field is required and should not be null when it is contained within Operators : ADD." seq="7">
<cfproperty name="creationTime" required="no" type="string" hint="Creation time of ReportDefinition. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="8">
<cfproperty name="includeZeroImpressions" required="no" type="boolean" hint="Indicates whether the report output should include rows that do not have any impressions associated with them. Setting this value to false will guarantee that zero impression rows will not be returned. Some fields do not support zero impression rows, so when those fields are selected zero impression rows will not be included even though this field is set to true." seq="9">

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

<cffunction name="getSelector" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['selector']" default="">
	<cfreturn variables["instance"]["selector"]>
	
</cffunction>

<cffunction name="setSelector" access="public" returntype="void" output="No">
<cfargument name="selector" required="Yes" type="any">
	
	<cfset variables["instance"]["selector"]=arguments["selector"]>
		
</cffunction>

<cffunction name="getReportName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reportName']" default="">
	<cfreturn variables["instance"]["reportName"]>
	
</cffunction>

<cffunction name="setReportName" access="public" returntype="void" output="No">
<cfargument name="reportName" required="Yes" type="any">
	
	<cfset variables["instance"]["reportName"]=arguments["reportName"]>
		
</cffunction>

<cffunction name="getReportType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reportType']" default="">
	<cfreturn variables["instance"]["reportType"]>
	
</cffunction>

<cffunction name="setReportType" access="public" returntype="void" output="No">
<cfargument name="reportType" required="Yes" type="any">
	
	<cfset variables["instance"]["reportType"]=arguments["reportType"]>
		
</cffunction>

<cffunction name="getHasAttachment" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['hasAttachment']" default="">
	<cfreturn variables["instance"]["hasAttachment"]>
	
</cffunction>

<cffunction name="setHasAttachment" access="public" returntype="void" output="No">
<cfargument name="hasAttachment" required="Yes" type="any">
	
	<cfset variables["instance"]["hasAttachment"]=arguments["hasAttachment"]>
		
</cffunction>

<cffunction name="getDateRangeType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dateRangeType']" default="">
	<cfreturn variables["instance"]["dateRangeType"]>
	
</cffunction>

<cffunction name="setDateRangeType" access="public" returntype="void" output="No">
<cfargument name="dateRangeType" required="Yes" type="any">
	
	<cfset variables["instance"]["dateRangeType"]=arguments["dateRangeType"]>
		
</cffunction>

<cffunction name="getDownloadFormat" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['downloadFormat']" default="">
	<cfreturn variables["instance"]["downloadFormat"]>
	
</cffunction>

<cffunction name="setDownloadFormat" access="public" returntype="void" output="No">
<cfargument name="downloadFormat" required="Yes" type="any">
	
	<cfset variables["instance"]["downloadFormat"]=arguments["downloadFormat"]>
		
</cffunction>

<cffunction name="getCreationTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['creationTime']" default="">
	<cfreturn variables["instance"]["creationTime"]>
	
</cffunction>

<cffunction name="setCreationTime" access="public" returntype="void" output="No">
<cfargument name="creationTime" required="Yes" type="any">
	
	<cfset variables["instance"]["creationTime"]=arguments["creationTime"]>
		
</cffunction>

<cffunction name="getIncludeZeroImpressions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['includeZeroImpressions']" default="">
	<cfreturn variables["instance"]["includeZeroImpressions"]>
	
</cffunction>

<cffunction name="setIncludeZeroImpressions" access="public" returntype="void" output="No">
<cfargument name="includeZeroImpressions" required="Yes" type="any">
	
	<cfset variables["instance"]["includeZeroImpressions"]=arguments["includeZeroImpressions"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
