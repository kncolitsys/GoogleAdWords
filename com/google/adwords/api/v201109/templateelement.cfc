<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TemplateElement" hint="Represents an element in a template. Each template element is composed of a list of fields (actual value data)." extends="utils">

<cfproperty name="uniqueName" required="no" type="string" hint="Unique name for this element. This field can be selected using the value 'UniqueName'. This field is required and should not be null." seq="1">
<cfproperty name="fields" required="no" type="TemplateElementField[]" hint="List of fields to use for this template element. These must be the same for all template ads in the same template ad union. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getUniqueName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['uniqueName']" default="">
	<cfreturn variables["instance"]["uniqueName"]>
	
</cffunction>

<cffunction name="setUniqueName" access="public" returntype="void" output="No">
<cfargument name="uniqueName" required="Yes" type="any">
	
	<cfset variables["instance"]["uniqueName"]=arguments["uniqueName"]>
		
</cffunction>

<cffunction name="getFields" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fields']" default="">
	<cfreturn variables["instance"]["fields"]>
	
</cffunction>

<cffunction name="setFields" access="public" returntype="void" output="No">
<cfargument name="fields" required="Yes" type="any">
	
	<cfset variables["instance"]["fields"]=arguments["fields"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
