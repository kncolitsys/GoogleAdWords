<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
--->
<cfcomponent displayname="Soap" hint="I am the SOAP container object." extends="utils">

<cfproperty name="Envelope" required="No" type="soapenvelope" hint="I am the soap envelope." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getEnvelope" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.envelope>
	
</cffunction>

<cffunction name="setEnvelope" access="public" returntype="void" output="No">
<cfargument name="envelope" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["Envelope"]=arguments.envelope>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "http://schemas.xmlsoap.org/soap/envelope/">
	
</cffunction>	

</cfcomponent>