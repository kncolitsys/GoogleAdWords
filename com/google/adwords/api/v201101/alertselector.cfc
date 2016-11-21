<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AlertSelector" hint="Selector for querying for alerts." extends="utils">

<cfproperty name="query" required="no" type="AlertQuery" hint="Criteria of alerts to select like types and trigger time. This field is required and should not be null." seq="1">
<cfproperty name="paging" required="no" type="Paging" hint="Offset and count into the alerts matching this selector. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getQuery" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['query']" default="">
	<cfreturn variables["instance"]["query"]>
	
</cffunction>

<cffunction name="setQuery" access="public" returntype="void" output="No">
<cfargument name="query" required="Yes" type="any">
	
	<cfset variables["instance"]["query"]=arguments["query"]>
		
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
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201101">
	
</cffunction>	

</cfcomponent>
