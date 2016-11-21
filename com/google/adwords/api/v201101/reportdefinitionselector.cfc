<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ReportDefinitionSelector" hint="A selector used to specify which report definitions should be returned." extends="utils">

<cfproperty name="definitionIds" required="no" type="long[]" hint="The list of report definition ids to be selected. If this list is not set, a call to ReportDefinitionService get(ReportDefinitionSelector) will return the most recent report definitions up to a certain limit. This field must contain distinct elements. This field must not contain null elements." seq="1">
<cfproperty name="paging" required="no" type="Paging" hint="The list of report definition ids to be selected. If this list is not set, a call to ReportDefinitionService get(ReportDefinitionSelector) will return the most recent report definitions up to a certain limit. This field must contain distinct elements. This field must not contain null elements." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getDefinitionIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['definitionIds']" default="">
	<cfreturn variables["instance"]["definitionIds"]>
	
</cffunction>

<cffunction name="setDefinitionIds" access="public" returntype="void" output="No">
<cfargument name="definitionIds" required="Yes" type="any">
	
	<cfset variables["instance"]["definitionIds"]=arguments["definitionIds"]>
		
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
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
