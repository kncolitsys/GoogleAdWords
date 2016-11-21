<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdExtension" hint="Base class for AdExtension objects. An AdExtension is an extension to an existing ad or metadata that will process into an extension. The class is concrete, so ad extensions can be added/removed to campaigns by referring to the id." extends="utils">

<cfproperty name="id" required="no" type="long" hint="Id of ad extension This field can be selected using the value 'AdExtensionId'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : REMOVE." seq="1">
<cfproperty name="AdExtension_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of AdExtension. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getAdExtensionType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['AdExtension_Type']" default="">
	<cfreturn variables["instance"]["AdExtension_Type"]>
	
</cffunction>

<cffunction name="setAdExtensionType" access="public" returntype="void" output="No">
<cfargument name="AdExtension_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["AdExtension_Type"]=arguments["AdExtension_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
