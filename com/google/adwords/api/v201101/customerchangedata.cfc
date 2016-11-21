<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CustomerChangeData" hint="Holds information about changes to a customer" extends="utils">

<cfproperty name="changedCampaigns" required="no" type="CampaignChangeData[]" hint="A list of campaign changes for the customer, as specified by the selector. If a campaign is included in the selector it will be included in this list, even if it did not change." seq="1">
<cfproperty name="lastChangeTimestamp" required="no" type="string" hint="The timestamp for the last changed processed for this customer. It is important that this timestamp be used for subsequent requests to avoid missing any changes." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getChangedCampaigns" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['changedCampaigns']" default="">
	<cfreturn variables["instance"]["changedCampaigns"]>
	
</cffunction>

<cffunction name="setChangedCampaigns" access="public" returntype="void" output="No">
<cfargument name="changedCampaigns" required="Yes" type="any">
	
	<cfset variables["instance"]["changedCampaigns"]=arguments["changedCampaigns"]>
		
</cffunction>

<cffunction name="getLastChangeTimestamp" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['lastChangeTimestamp']" default="">
	<cfreturn variables["instance"]["lastChangeTimestamp"]>
	
</cffunction>

<cffunction name="setLastChangeTimestamp" access="public" returntype="void" output="No">
<cfargument name="lastChangeTimestamp" required="Yes" type="any">
	
	<cfset variables["instance"]["lastChangeTimestamp"]=arguments["lastChangeTimestamp"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/ch/v201101">
	
</cffunction>	

</cfcomponent>
