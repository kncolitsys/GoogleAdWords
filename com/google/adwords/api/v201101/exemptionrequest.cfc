<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ExemptionRequest" hint="A request to be exempted from a PolicyViolationError." extends="utils">

<cfproperty name="key" required="no" type="PolicyViolationKey" hint="Identifies the violation to request an exemption for. This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getKey" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['key']" default="">
	<cfreturn variables["instance"]["key"]>
	
</cffunction>

<cffunction name="setKey" access="public" returntype="void" output="No">
<cfargument name="key" required="Yes" type="any">
	
	<cfset variables["instance"]["key"]=arguments["key"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
