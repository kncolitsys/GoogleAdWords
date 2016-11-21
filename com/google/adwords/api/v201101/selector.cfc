<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Selector" hint="A generic selector to specify the type of information to return." extends="utils">

<cfproperty name="fields" required="no" type="string[]" hint="List of fields to select. Possible values are marked Selectable on the entity's reference page. For example, for the CampaignService selector, refer to the selectable fields from the Campaign reference page. This field must contain distinct elements. This field must not contain null elements. This field is required and should not be null." seq="1">
<cfproperty name="predicates" required="no" type="Predicate[]" hint="Specifies how an entity (eg. adgroup, campaign, criterion, ad) should be filtered. This field must not contain null elements." seq="2">
<cfproperty name="dateRange" required="no" type="DateRange" hint="Range of dates for which you want to include data. If this value is omitted, results for all dates are returned. This range must be contained within the range [19700101, 20380101]." seq="3">
<cfproperty name="ordering" required="no" type="OrderBy[]" hint="The fields on which you want to sort, and the sort order. The order in the list is significant: The first element in the list indicates the primary sort order, the next specifies the secondary sort order and so on." seq="4">
<cfproperty name="paging" required="no" type="Paging" hint="Pagination information." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getFields" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fields']" default="">
	<cfreturn variables["instance"]["fields"]>
	
</cffunction>

<cffunction name="setFields" access="public" returntype="void" output="No">
<cfargument name="fields" required="Yes" type="any">
	
	<cfset variables["instance"]["fields"]=arguments["fields"]>
		
</cffunction>

<cffunction name="getPredicates" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['predicates']" default="">
	<cfreturn variables["instance"]["predicates"]>
	
</cffunction>

<cffunction name="setPredicates" access="public" returntype="void" output="No">
<cfargument name="predicates" required="Yes" type="any">
	
	<cfset variables["instance"]["predicates"]=arguments["predicates"]>
		
</cffunction>

<cffunction name="getDateRange" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dateRange']" default="">
	<cfreturn variables["instance"]["dateRange"]>
	
</cffunction>

<cffunction name="setDateRange" access="public" returntype="void" output="No">
<cfargument name="dateRange" required="Yes" type="any">
	
	<cfset variables["instance"]["dateRange"]=arguments["dateRange"]>
		
</cffunction>

<cffunction name="getOrdering" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ordering']" default="">
	<cfreturn variables["instance"]["ordering"]>
	
</cffunction>

<cffunction name="setOrdering" access="public" returntype="void" output="No">
<cfargument name="ordering" required="Yes" type="any">
	
	<cfset variables["instance"]["ordering"]=arguments["ordering"]>
		
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
