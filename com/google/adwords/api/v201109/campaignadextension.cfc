<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignAdExtension" hint="Represents a campaign level ad extension. A campaign ad extension specifies a campaign and an ad extension which can extend any ad under that campaign." extends="utils">

<cfproperty name="campaignId" required="no" type="long" hint="Campaign ID of the campaign to which the ad extension is connected. This field can be selected using the value 'CampaignId'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : ADD, REMOVE." seq="1">
<cfproperty name="adExtension" required="no" type="AdExtension" hint="Ad extension. This field is required and should not be null." seq="2">
<cfproperty name="status" required="no" type="string" hint="Status of ad extension in the campaign - defaults to ACTIVE on add if unspecified. This field can be selected using the value 'Status'.This field can be filtered on." seq="3">
<cfproperty name="approvalStatus" required="no" type="string" hint="Approval status. This field can be selected using the value 'ApprovalStatus'.This field can be filtered on." seq="4">
<cfproperty name="stats" required="no" type="CampaignAdExtensionStats" hint="Stats for the campaign ad extension. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCampaignId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignId']" default="">
	<cfreturn variables["instance"]["campaignId"]>
	
</cffunction>

<cffunction name="setCampaignId" access="public" returntype="void" output="No">
<cfargument name="campaignId" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignId"]=arguments["campaignId"]>
		
</cffunction>

<cffunction name="getAdExtension" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adExtension']" default="">
	<cfreturn variables["instance"]["adExtension"]>
	
</cffunction>

<cffunction name="setAdExtension" access="public" returntype="void" output="No">
<cfargument name="adExtension" required="Yes" type="any">
	
	<cfset variables["instance"]["adExtension"]=arguments["adExtension"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getApprovalStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['approvalStatus']" default="">
	<cfreturn variables["instance"]["approvalStatus"]>
	
</cffunction>

<cffunction name="setApprovalStatus" access="public" returntype="void" output="No">
<cfargument name="approvalStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["approvalStatus"]=arguments["approvalStatus"]>
		
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
