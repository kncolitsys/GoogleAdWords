<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PolicyViolationKey" hint="Key of the violation. The key is used for referring to a violation when filing an exemption request." extends="utils">

<cfproperty name="policyName" required="no" type="string" hint="Unique id of the violated policy. This field is required and should not be null." seq="1">
<cfproperty name="violatingText" required="no" type="string" hint="The text that violates the policy if specified. Otherwise, refers to the policy in general (e.g. when requesting to be exempt from the whole policy). May be null for criterion exemptions, in which case this refers to the whole policy. Must be specified for ad exemptions." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getPolicyName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['policyName']" default="">
	<cfreturn variables["instance"]["policyName"]>
	
</cffunction>

<cffunction name="setPolicyName" access="public" returntype="void" output="No">
<cfargument name="policyName" required="Yes" type="any">
	
	<cfset variables["instance"]["policyName"]=arguments["policyName"]>
		
</cffunction>

<cffunction name="getViolatingText" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['violatingText']" default="">
	<cfreturn variables["instance"]["violatingText"]>
	
</cffunction>

<cffunction name="setViolatingText" access="public" returntype="void" output="No">
<cfargument name="violatingText" required="Yes" type="any">
	
	<cfset variables["instance"]["violatingText"]=arguments["violatingText"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
