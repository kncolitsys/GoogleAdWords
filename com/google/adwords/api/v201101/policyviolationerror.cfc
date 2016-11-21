<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PolicyViolationError" hint="Represents violations of a single policy by some text in a field. Violations of a single policy by the same string in multiple places within a field is reported in one instace of this class and only one exemption needs to be filed. Violations of a single policy by two different strings is reported as two separate instances of this class. e.g. If 'ACME' violates 'capitalization' and occurs twice in a text ad it would be represented by one instance. If the ad also contains 'INC' which also violates 'capitalization' it would be represented in a separate instance." extends="ApiError">

<cfproperty name="key" required="no" type="PolicyViolationKey" hint="Unique identifier for the violation." seq="5">
<cfproperty name="externalPolicyName" required="no" type="string" hint="Name of policy suitable for display to users. In the user's preferred language." seq="6">
<cfproperty name="externalPolicyUrl" required="no" type="string" hint="Url with writeup about the policy." seq="7">
<cfproperty name="externalPolicyDescription" required="no" type="string" hint="Localized description of the violation." seq="8">
<cfproperty name="isExemptable" required="no" type="boolean" hint="Whether user can file an exemption request for this violation." seq="9">
<cfproperty name="violatingParts" required="no" type="PolicyViolationError.Part[]" hint="Lists the parts that violate the policy." seq="10">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setApiErrorType("PolicyViolationError")>

<cffunction name="getKey" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['key']" default="">
	<cfreturn variables["instance"]["key"]>
	
</cffunction>

<cffunction name="setKey" access="public" returntype="void" output="No">
<cfargument name="key" required="Yes" type="any">
	
	<cfset variables["instance"]["key"]=arguments["key"]>
		
</cffunction>

<cffunction name="getExternalPolicyName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['externalPolicyName']" default="">
	<cfreturn variables["instance"]["externalPolicyName"]>
	
</cffunction>

<cffunction name="setExternalPolicyName" access="public" returntype="void" output="No">
<cfargument name="externalPolicyName" required="Yes" type="any">
	
	<cfset variables["instance"]["externalPolicyName"]=arguments["externalPolicyName"]>
		
</cffunction>

<cffunction name="getExternalPolicyUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['externalPolicyUrl']" default="">
	<cfreturn variables["instance"]["externalPolicyUrl"]>
	
</cffunction>

<cffunction name="setExternalPolicyUrl" access="public" returntype="void" output="No">
<cfargument name="externalPolicyUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["externalPolicyUrl"]=arguments["externalPolicyUrl"]>
		
</cffunction>

<cffunction name="getExternalPolicyDescription" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['externalPolicyDescription']" default="">
	<cfreturn variables["instance"]["externalPolicyDescription"]>
	
</cffunction>

<cffunction name="setExternalPolicyDescription" access="public" returntype="void" output="No">
<cfargument name="externalPolicyDescription" required="Yes" type="any">
	
	<cfset variables["instance"]["externalPolicyDescription"]=arguments["externalPolicyDescription"]>
		
</cffunction>

<cffunction name="getIsExemptable" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isExemptable']" default="">
	<cfreturn variables["instance"]["isExemptable"]>
	
</cffunction>

<cffunction name="setIsExemptable" access="public" returntype="void" output="No">
<cfargument name="isExemptable" required="Yes" type="any">
	
	<cfset variables["instance"]["isExemptable"]=arguments["isExemptable"]>
		
</cffunction>

<cffunction name="getViolatingParts" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['violatingParts']" default="">
	<cfreturn variables["instance"]["violatingParts"]>
	
</cffunction>

<cffunction name="setViolatingParts" access="public" returntype="void" output="No">
<cfargument name="violatingParts" required="Yes" type="any">
	
	<cfset variables["instance"]["violatingParts"]=arguments["violatingParts"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
