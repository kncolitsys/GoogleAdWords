<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupAd" hint="Represents an ad in an ad group." extends="utils">

<cfproperty name="adGroupId" required="no" type="long" hint="The id of the adgroup containing this ad. This field can be selected using the value 'AdGroupId'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="ad" required="no" type="Ad" hint="The contents of the ad itself. This field is required and should not be null." seq="2">
<cfproperty name="experimentData" required="no" type="AdGroupAdExperimentData" hint="Experiment data associated with this AdGroupAd." seq="3">
<cfproperty name="status" required="no" type="string" hint="The status of the ad. This field can be selected using the value 'Status'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : SET." seq="4">
<cfproperty name="stats" required="no" type="AdStats" hint="Statistics about this ad. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupId']" default="">
	<cfreturn variables["instance"]["adGroupId"]>
	
</cffunction>

<cffunction name="setAdGroupId" access="public" returntype="void" output="No">
<cfargument name="adGroupId" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupId"]=arguments["adGroupId"]>
		
</cffunction>

<cffunction name="getAd" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ad']" default="">
	<cfreturn variables["instance"]["ad"]>
	
</cffunction>

<cffunction name="setAd" access="public" returntype="void" output="No">
<cfargument name="ad" required="Yes" type="any">
	
	<cfset variables["instance"]["ad"]=arguments["ad"]>
		
</cffunction>

<cffunction name="getExperimentData" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentData']" default="">
	<cfreturn variables["instance"]["experimentData"]>
	
</cffunction>

<cffunction name="setExperimentData" access="public" returntype="void" output="No">
<cfargument name="experimentData" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentData"]=arguments["experimentData"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getStats" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['stats']" default="">
	<cfreturn variables["instance"]["stats"]>
	
</cffunction>

<cffunction name="setStats" access="public" returntype="void" output="No">
<cfargument name="stats" required="Yes" type="any">
	
	<cfset variables["instance"]["stats"]=arguments["stats"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
