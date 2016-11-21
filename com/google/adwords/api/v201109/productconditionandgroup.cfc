<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ProductConditionAndGroup" hint="Groups a list of product conditions to be evaluated together as an AND condition (ie. true if all conditions are true, false otherwise)." extends="utils">

<cfproperty name="conditions" required="no" type="ProductCondition[]" hint="List of conditions to be evaluated as an AND This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getConditions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conditions']" default="">
	<cfreturn variables["instance"]["conditions"]>
	
</cffunction>

<cffunction name="setConditions" access="public" returntype="void" output="No">
<cfargument name="conditions" required="Yes" type="any">
	
	<cfset variables["instance"]["conditions"]=arguments["conditions"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
