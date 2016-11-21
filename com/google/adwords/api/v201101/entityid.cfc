<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="EntityId" hint="A qualified long-valued identity that can identify different types of AdWords entities such as campaigns and ad-groups." extends="utils">

<cfproperty name="type" required="no" type="string" hint="Entity id type." seq="1">
<cfproperty name="value" required="no" type="long" hint="Entity id value." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['type']" default="">
	<cfreturn variables["instance"]["type"]>
	
</cffunction>

<cffunction name="setType" access="public" returntype="void" output="No">
<cfargument name="type" required="Yes" type="any">
	
	<cfset variables["instance"]["type"]=arguments["type"]>
		
</cffunction>

<cffunction name="getValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['value']" default="">
	<cfreturn variables["instance"]["value"]>
	
</cffunction>

<cffunction name="setValue" access="public" returntype="void" output="No">
<cfargument name="value" required="Yes" type="any">
	
	<cfset variables["instance"]["value"]=arguments["value"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
