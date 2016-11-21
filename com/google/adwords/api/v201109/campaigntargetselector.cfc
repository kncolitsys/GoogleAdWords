<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignTargetSelector" hint="A campaign targeting selector to specify which targets to return." extends="utils">

<cfproperty name="campaignIds" required="no" type="long[]" hint="List of ids for the campaigns that targets are being retrieved. This field must contain distinct elements. This field must not contain null elements." seq="1">

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

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
