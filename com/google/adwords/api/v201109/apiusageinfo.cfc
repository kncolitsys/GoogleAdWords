<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ApiUsageInfo" hint="Represents the API usage information." extends="utils">

<cfproperty name="apiUsageRecords" required="no" type="ApiUsageRecord[]" hint="The list of API usage for the specific clients." seq="1">
<cfproperty name="cost" required="no" type="long" hint="The cost is set when the API usage is been fetched for all clients." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getApiUsageRecords" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['apiUsageRecords']" default="">
	<cfreturn variables["instance"]["apiUsageRecords"]>
	
</cffunction>

<cffunction name="setApiUsageRecords" access="public" returntype="void" output="No">
<cfargument name="apiUsageRecords" required="Yes" type="any">
	
	<cfset variables["instance"]["apiUsageRecords"]=arguments["apiUsageRecords"]>
		
</cffunction>

<cffunction name="getCost" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['cost']" default="">
	<cfreturn variables["instance"]["cost"]>
	
</cffunction>

<cffunction name="setCost" access="public" returntype="void" output="No">
<cfargument name="cost" required="Yes" type="any">
	
	<cfset variables["instance"]["cost"]=arguments["cost"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/info/v201109">
	
</cffunction>	

</cfcomponent>
