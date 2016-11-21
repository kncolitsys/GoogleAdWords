<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdExtensionOverrideSelector" hint="Specifies criteria for selecting a set of AdExtensionOverrides." extends="utils">

<cfproperty name="campaignIds" required="no" type="long[]" hint="Returned AdExtensionOverrides should be on ads in the campaigns indicated by this given list of campaign ids. An empty list means there are no campaign restrictions during the query." seq="1">
<cfproperty name="adIds" required="no" type="long[]" hint="Returned AdExtensionOverrides should have an ad id from this list. An empty list means there are no ad restrictions during the query." seq="2">
<cfproperty name="adExtensionIds" required="no" type="long[]" hint="Returned AdExtensionOverrides should have overriding extensions with ad extension ids from this list. An empty list means there are no ad extension restrictions during the query." seq="3">
<cfproperty name="statuses" required="no" type="string[]" hint="Returned AdExtensionOverrides should have statuses from this list." seq="4">
<cfproperty name="paging" required="no" type="Paging" hint="The starting index and number of results to return." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCampaignIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignIds']" default="">
	<cfreturn variables["instance"]["campaignIds"]>
	
</cffunction>

<cffunction name="setCampaignIds" access="public" returntype="void" output="No">
<cfargument name="campaignIds" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignIds"]=arguments["campaignIds"]>
		
</cffunction>

<cffunction name="getAdIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adIds']" default="">
	<cfreturn variables["instance"]["adIds"]>
	
</cffunction>

<cffunction name="setAdIds" access="public" returntype="void" output="No">
<cfargument name="adIds" required="Yes" type="any">
	
	<cfset variables["instance"]["adIds"]=arguments["adIds"]>
		
</cffunction>

<cffunction name="getAdExtensionIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adExtensionIds']" default="">
	<cfreturn variables["instance"]["adExtensionIds"]>
	
</cffunction>

<cffunction name="setAdExtensionIds" access="public" returntype="void" output="No">
<cfargument name="adExtensionIds" required="Yes" type="any">
	
	<cfset variables["instance"]["adExtensionIds"]=arguments["adExtensionIds"]>
		
</cffunction>

<cffunction name="getStatuses" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['statuses']" default="">
	<cfreturn variables["instance"]["statuses"]>
	
</cffunction>

<cffunction name="setStatuses" access="public" returntype="void" output="No">
<cfargument name="statuses" required="Yes" type="any">
	
	<cfset variables["instance"]["statuses"]=arguments["statuses"]>
		
</cffunction>

<cffunction name="getPaging" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['paging']" default="">
	<cfreturn variables["instance"]["paging"]>
	
</cffunction>

<cffunction name="setPaging" access="public" returntype="void" output="No">
<cfargument name="paging" required="Yes" type="any">
	
	<cfset variables["instance"]["paging"]=arguments["paging"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
