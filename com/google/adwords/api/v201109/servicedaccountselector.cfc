<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ServicedAccountSelector" hint="Selector for querying the ServicedAccount graph." extends="utils">

<cfproperty name="customerIds" required="no" type="long[]" hint="If nonempty, only customers (recursively) managed by these 'seeds' will be returned." seq="1">
<cfproperty name="enablePaging" required="no" type="boolean" hint="Whether to treat the results as a flat list instead of a graph of links. If false, paging options will be ignored." seq="2">
<cfproperty name="submanagersOnly" required="no" type="boolean" hint="Whether the result should only return accounts that themselves can manage clients." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCustomerIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['customerIds']" default="">
	<cfreturn variables["instance"]["customerIds"]>
	
</cffunction>

<cffunction name="setCustomerIds" access="public" returntype="void" output="No">
<cfargument name="customerIds" required="Yes" type="any">
	
	<cfset variables["instance"]["customerIds"]=arguments["customerIds"]>
		
</cffunction>

<cffunction name="getEnablePaging" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enablePaging']" default="">
	<cfreturn variables["instance"]["enablePaging"]>
	
</cffunction>

<cffunction name="setEnablePaging" access="public" returntype="void" output="No">
<cfargument name="enablePaging" required="Yes" type="any">
	
	<cfset variables["instance"]["enablePaging"]=arguments["enablePaging"]>
		
</cffunction>

<cffunction name="getSubmanagersOnly" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['submanagersOnly']" default="">
	<cfreturn variables["instance"]["submanagersOnly"]>
	
</cffunction>

<cffunction name="setSubmanagersOnly" access="public" returntype="void" output="No">
<cfargument name="submanagersOnly" required="Yes" type="any">
	
	<cfset variables["instance"]["submanagersOnly"]=arguments["submanagersOnly"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201109">
	
</cffunction>	

</cfcomponent>
