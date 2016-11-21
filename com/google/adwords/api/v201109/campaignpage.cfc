<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignPage" hint="Contains a subset of campaign resulting from the filtering and paging of the get call." extends="Page">

<cfproperty name="totalBudget" required="no" type="Budget" hint="The total budget." seq="3">
<cfproperty name="entries" required="no" type="Campaign[]" hint="The result entries in this page." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setPageType("CampaignPage")>

<cffunction name="getTotalBudget" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['totalBudget']" default="">
	<cfreturn variables["instance"]["totalBudget"]>
	
</cffunction>

<cffunction name="setTotalBudget" access="public" returntype="void" output="No">
<cfargument name="totalBudget" required="Yes" type="any">
	
	<cfset variables["instance"]["totalBudget"]=arguments["totalBudget"]>
		
</cffunction>

<cffunction name="getEntries" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['entries']" default="">
	<cfreturn variables["instance"]["entries"]>
	
</cffunction>

<cffunction name="setEntries" access="public" returntype="void" output="No">
<cfargument name="entries" required="Yes" type="any">
	
	<cfset variables["instance"]["entries"]=arguments["entries"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
