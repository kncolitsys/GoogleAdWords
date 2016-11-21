<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TargetList" hint="Targets list abstract class (a list of a given type of targets along with their campaign ID)." extends="utils">

<cfproperty name="campaignId" required="no" type="long" hint="Id of campaign having its targets operated on. This field is required and should not be null." seq="1">
<cfproperty name="TargetList_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of TargetList of this instance. It is ignored on input, and instead xsi:type should be specified." seq="2">

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

<cffunction name="getTargetListType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['TargetList_Type']" default="">
	<cfreturn variables["instance"]["TargetList_Type"]>
	
</cffunction>

<cffunction name="setTargetListType" access="public" returntype="void" output="No">
<cfargument name="TargetList_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["TargetList_Type"]=arguments["TargetList_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
