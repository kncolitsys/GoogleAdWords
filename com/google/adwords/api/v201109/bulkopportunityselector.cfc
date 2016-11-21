<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkOpportunitySelector" extends="utils">

<cfproperty name="ideaTypes" required="no" type="string[]" hint="This field must not contain null elements. This field is required and should not be null." seq="1">
<cfproperty name="requestedAttributeTypes" required="no" type="string[]" hint="This field must not contain null elements. This field is required and should not be null." seq="2">
<cfproperty name="paging" required="no" type="Paging" hint="This field is required and should not be null." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getIdeaTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ideaTypes']" default="">
	<cfreturn variables["instance"]["ideaTypes"]>
	
</cffunction>

<cffunction name="setIdeaTypes" access="public" returntype="void" output="No">
<cfargument name="ideaTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["ideaTypes"]=arguments["ideaTypes"]>
		
</cffunction>

<cffunction name="getRequestedAttributeTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['requestedAttributeTypes']" default="">
	<cfreturn variables["instance"]["requestedAttributeTypes"]>
	
</cffunction>

<cffunction name="setRequestedAttributeTypes" access="public" returntype="void" output="No">
<cfargument name="requestedAttributeTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["requestedAttributeTypes"]=arguments["requestedAttributeTypes"]>
		
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
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
