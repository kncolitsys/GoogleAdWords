<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Predicate" hint="Specifies how an entity (eg. adgroup, campaign, criterion, ad) should be filtered." extends="utils">

<cfproperty name="field" required="no" type="string" hint="The field by which to filter the returned data. Possible values are marked Filterable on the entity's reference page. For example, for predicates for the CampaignService selector, refer to the filterable fields from the Campaign reference page. This field is required and should not be null." seq="1">
<cfproperty name="operator" required="no" type="string" hint="The operator to use for filtering the data returned. This field is required and should not be null." seq="2">
<cfproperty name="values" required="no" type="string[]" hint="The values by which to filter the field. The Operator IN and Operator NOT_IN take multiple values. All others take a single value. This field must not contain null elements. This field is required and should not be null." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getField" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['field']" default="">
	<cfreturn variables["instance"]["field"]>
	
</cffunction>

<cffunction name="setField" access="public" returntype="void" output="No">
<cfargument name="field" required="Yes" type="any">
	
	<cfset variables["instance"]["field"]=arguments["field"]>
		
</cffunction>

<cffunction name="getOperator" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operator']" default="">
	<cfreturn variables["instance"]["operator"]>
	
</cffunction>

<cffunction name="setOperator" access="public" returntype="void" output="No">
<cfargument name="operator" required="Yes" type="any">
	
	<cfset variables["instance"]["operator"]=arguments["operator"]>
		
</cffunction>

<cffunction name="getValues" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['values']" default="">
	<cfreturn variables["instance"]["values"]>
	
</cffunction>

<cffunction name="setValues" access="public" returntype="void" output="No">
<cfargument name="values" required="Yes" type="any">
	
	<cfset variables["instance"]["values"]=arguments["values"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
