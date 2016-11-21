<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="OrderBy" hint="Specifies how the resulting information should be sorted." extends="utils">

<cfproperty name="field" required="no" type="string" hint="The field to sort the results on. This field is required and should not be null." seq="1">
<cfproperty name="sortOrder" required="no" type="string" hint="The order to sort the results on. The default sort order is SortOrder ASCENDING." seq="2">

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

<cffunction name="getSortOrder" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sortOrder']" default="">
	<cfreturn variables["instance"]["sortOrder"]>
	
</cffunction>

<cffunction name="setSortOrder" access="public" returntype="void" output="No">
<cfargument name="sortOrder" required="Yes" type="any">
	
	<cfset variables["instance"]["sortOrder"]=arguments["sortOrder"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
