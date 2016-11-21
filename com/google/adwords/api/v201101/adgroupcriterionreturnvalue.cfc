<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupCriterionReturnValue" hint="A container for return values from the AdGroupCriterionService." extends="ListReturnValue">

<cfproperty name="value" required="no" type="AdGroupCriterion[]" hint="List of adgroup criteria." seq="2">
<cfproperty name="partialFailureErrors" required="no" type="ApiError[]" hint="List of partial failure errors." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setListReturnValueType("AdGroupCriterionReturnValue")>

<cffunction name="getValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['value']" default="">
	<cfreturn variables["instance"]["value"]>
	
</cffunction>

<cffunction name="setValue" access="public" returntype="void" output="No">
<cfargument name="value" required="Yes" type="any">
	
	<cfset variables["instance"]["value"]=arguments["value"]>
		
</cffunction>

<cffunction name="getPartialFailureErrors" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['partialFailureErrors']" default="">
	<cfreturn variables["instance"]["partialFailureErrors"]>
	
</cffunction>

<cffunction name="setPartialFailureErrors" access="public" returntype="void" output="No">
<cfargument name="partialFailureErrors" required="Yes" type="any">
	
	<cfset variables["instance"]["partialFailureErrors"]=arguments["partialFailureErrors"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
