<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroup" hint="Represents an ad group." extends="utils">

<cfproperty name="id" required="no" type="long" hint="ID of this ad group. This field can be selected using the value 'Id'.This field can be filtered on. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored. This field is required and should not be null when it is contained within Operators : SET." seq="1">
<cfproperty name="campaignId" required="no" type="long" hint="ID of the campaign with which this ad group is associated. This field can be selected using the value 'CampaignId'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : ADD." seq="2">
<cfproperty name="campaignName" required="no" type="string" hint="Name of the campaign with which this ad group is associated. This field can be selected using the value 'CampaignName'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="name" required="no" type="string" hint="Name of this ad group (at most 255 UTF-8 full-width characters). This field can be selected using the value 'Name'.This field can be filtered on." seq="4">
<cfproperty name="status" required="no" type="string" hint="Status of this ad group. This field can be selected using the value 'Status'.This field can be filtered on." seq="5">
<cfproperty name="bids" required="no" type="AdGroupBids" hint="The default bid amounts for criteria in this ad group. The type of bid (i.e. the type of this field) must match the parent campaign's strategy." seq="6">
<cfproperty name="experimentData" required="no" type="AdGroupExperimentData" hint="Data from a campaign bidding strategy experiment, returned by get() only if the experimentId is supplied." seq="7">
<cfproperty name="stats" required="no" type="Stats" hint="Statistics for this ad group, returned by get() only if requested in the selector." seq="8">

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

<cffunction name="getCampaignId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignId']" default="">
	<cfreturn variables["instance"]["campaignId"]>
	
</cffunction>

<cffunction name="setCampaignId" access="public" returntype="void" output="No">
<cfargument name="campaignId" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignId"]=arguments["campaignId"]>
		
</cffunction>

<cffunction name="getCampaignName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignName']" default="">
	<cfreturn variables["instance"]["campaignName"]>
	
</cffunction>

<cffunction name="setCampaignName" access="public" returntype="void" output="No">
<cfargument name="campaignName" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignName"]=arguments["campaignName"]>
		
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

<cffunction name="getBids" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bids']" default="">
	<cfreturn variables["instance"]["bids"]>
	
</cffunction>

<cffunction name="setBids" access="public" returntype="void" output="No">
<cfargument name="bids" required="Yes" type="any">
	
	<cfset variables["instance"]["bids"]=arguments["bids"]>
		
</cffunction>

<cffunction name="getExperimentData" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentData']" default="">
	<cfreturn variables["instance"]["experimentData"]>
	
</cffunction>

<cffunction name="setExperimentData" access="public" returntype="void" output="No">
<cfargument name="experimentData" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentData"]=arguments["experimentData"]>
		
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
