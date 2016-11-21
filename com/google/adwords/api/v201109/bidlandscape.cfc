<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BidLandscape" hint="Represents data about a bid landscape for an ad group or criterion." extends="DataEntry">

<cfproperty name="campaignId" required="no" type="long" hint="ID of the campaign that contains the criterion with which this bid landscape is associated. This field can be selected using the value 'CampaignId'.This field can be filtered on." seq="2">
<cfproperty name="adGroupId" required="no" type="long" hint="ID of the ad group that contains the criterion with which this bid landscape is associated. This field can be selected using the value 'AdGroupId'.This field can be filtered on." seq="3">
<cfproperty name="startDate" required="no" type="string" hint="First day on which this landscape is based. Typically, it could be up to a week ago. This field can be selected using the value 'StartDate'. This field is required and should not be null." seq="4">
<cfproperty name="endDate" required="no" type="string" hint="Last day on which this landscape is based. This field can be selected using the value 'EndDate'. This field is required and should not be null." seq="5">
<cfproperty name="landscapePoints" required="no" type="BidLandscape.LandscapePoint[]" hint="List of landscape points, each corresponding to a specifid bid amount." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setDataEntryType("BidLandscape")>

<cffunction name="getCampaignId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignId']" default="">
	<cfreturn variables["instance"]["campaignId"]>
	
</cffunction>

<cffunction name="setCampaignId" access="public" returntype="void" output="No">
<cfargument name="campaignId" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignId"]=arguments["campaignId"]>
		
</cffunction>

<cffunction name="getAdGroupId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupId']" default="">
	<cfreturn variables["instance"]["adGroupId"]>
	
</cffunction>

<cffunction name="setAdGroupId" access="public" returntype="void" output="No">
<cfargument name="adGroupId" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupId"]=arguments["adGroupId"]>
		
</cffunction>

<cffunction name="getStartDate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['startDate']" default="">
	<cfreturn variables["instance"]["startDate"]>
	
</cffunction>

<cffunction name="setStartDate" access="public" returntype="void" output="No">
<cfargument name="startDate" required="Yes" type="any">
	
	<cfset variables["instance"]["startDate"]=arguments["startDate"]>
		
</cffunction>

<cffunction name="getEndDate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['endDate']" default="">
	<cfreturn variables["instance"]["endDate"]>
	
</cffunction>

<cffunction name="setEndDate" access="public" returntype="void" output="No">
<cfargument name="endDate" required="Yes" type="any">
	
	<cfset variables["instance"]["endDate"]=arguments["endDate"]>
		
</cffunction>

<cffunction name="getLandscapePoints" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['landscapePoints']" default="">
	<cfreturn variables["instance"]["landscapePoints"]>
	
</cffunction>

<cffunction name="setLandscapePoints" access="public" returntype="void" output="No">
<cfargument name="landscapePoints" required="Yes" type="any">
	
	<cfset variables["instance"]["landscapePoints"]=arguments["landscapePoints"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
