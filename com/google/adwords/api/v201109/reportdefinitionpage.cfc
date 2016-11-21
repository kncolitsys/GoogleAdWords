<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ReportDefinitionPage" hint="Contains a subset of report definitions resulting from the filtering and paging of the get call." extends="utils">

<cfproperty name="entries" required="no" type="ReportDefinition[]" hint="The result entries in this page." seq="1">
<cfproperty name="totalNumEntries" required="no" type="int" hint="Total number of entries in the result that this page is a part of." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getEntries" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['entries']" default="">
	<cfreturn variables["instance"]["entries"]>
	
</cffunction>

<cffunction name="setEntries" access="public" returntype="void" output="No">
<cfargument name="entries" required="Yes" type="any">
	
	<cfset variables["instance"]["entries"]=arguments["entries"]>
		
</cffunction>

<cffunction name="getTotalNumEntries" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['totalNumEntries']" default="">
	<cfreturn variables["instance"]["totalNumEntries"]>
	
</cffunction>

<cffunction name="setTotalNumEntries" access="public" returntype="void" output="No">
<cfargument name="totalNumEntries" required="Yes" type="any">
	
	<cfset variables["instance"]["totalNumEntries"]=arguments["totalNumEntries"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
