<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
--->
<cfcomponent displayname="RequestHeader" hint="" extends="utils">

<cfproperty name="RequestHeader" required="No" type="any" hint="" seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getRequestHeader" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.requestheader>
	
</cffunction>

<cffunction name="setRequestHeader" access="public" returntype="void" output="No">
<cfargument name="requestheader" required="Yes" type="any">
	
	<cfset variables.instance["RequestHeader"]=arguments.requestheader>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn variables.instance.namespace>
	
</cffunction>	

<cffunction name="setNamespace" access="public" returntype="void" output="No">
<cfargument name="namespace" required="Yes" type="any">
	
	<cfset variables.instance["namespace"]=arguments.namespace>
		
</cffunction>

</cfcomponent>