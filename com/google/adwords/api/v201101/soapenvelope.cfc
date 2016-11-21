<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
--->
<cfcomponent displayname="Soapenvelope" hint="" extends="utils">

<cfproperty name="Header" required="No" type="requestHeader" hint="" seq="1">
<cfproperty name="Body" required="No" type="any" hint="" seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getHeader" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.header>
	
</cffunction>

<cffunction name="setHeader" access="public" returntype="void" output="No">
<cfargument name="header" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["Header"]=arguments.header>
		
</cffunction>


<cffunction name="getBody" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.body>
	
</cffunction>

<cffunction name="setBody" access="public" returntype="void" output="No">
<cfargument name="body" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["Body"]=arguments.body>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "http://schemas.xmlsoap.org/soap/envelope/">
	
</cffunction>

</cfcomponent>