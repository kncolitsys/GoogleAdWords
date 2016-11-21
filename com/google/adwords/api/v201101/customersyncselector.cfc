<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CustomerSyncSelector" hint="A filter for selecting changehistory events for a customer." extends="utils">

<cfproperty name="dateTimeRange" required="no" type="DateTimeRange" hint="Only return entities that have changed during the specified time range. String Format: yyyyMMdd HHmmss zzz (e.g. 20100609 150223 UTC) This field is required and should not be null." seq="1">
<cfproperty name="campaignIds" required="no" type="long[]" hint="Return entities belonging to these campaigns. This field must contain distinct elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getDateTimeRange" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dateTimeRange']" default="">
	<cfreturn variables["instance"]["dateTimeRange"]>
	
</cffunction>

<cffunction name="setDateTimeRange" access="public" returntype="void" output="No">
<cfargument name="dateTimeRange" required="Yes" type="any">
	
	<cfset variables["instance"]["dateTimeRange"]=arguments["dateTimeRange"]>
		
</cffunction>

<cffunction name="getCampaignIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['campaignIds']" default="">
	<cfreturn variables["instance"]["campaignIds"]>
	
</cffunction>

<cffunction name="setCampaignIds" access="public" returntype="void" output="No">
<cfargument name="campaignIds" required="Yes" type="any">
	
	<cfset variables["instance"]["campaignIds"]=arguments["campaignIds"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/ch/v201101">
	
</cffunction>	

</cfcomponent>
