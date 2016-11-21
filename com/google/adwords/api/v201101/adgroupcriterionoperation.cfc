<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupCriterionOperation" hint="Operation (add, remove and set) on adgroup criteria." extends="Operation">

<cfproperty name="operand" required="no" type="AdGroupCriterion" hint="The adgroup criterion being operated on. This field is required and should not be null." seq="3">
<cfproperty name="exemptionRequests" required="no" type="ExemptionRequest[]" hint="List of exemption requests for policy violations flagged by this criterion. Only set this field when adding criteria that trigger policy violations for which you wish to get exemptions for." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationType("AdGroupCriterionOperation")>

<cffunction name="getOperand" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operand']" default="">
	<cfreturn variables["instance"]["operand"]>
	
</cffunction>

<cffunction name="setOperand" access="public" returntype="void" output="No">
<cfargument name="operand" required="Yes" type="any">
	
	<cfset variables["instance"]["operand"]=arguments["operand"]>
		
</cffunction>

<cffunction name="getExemptionRequests" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['exemptionRequests']" default="">
	<cfreturn variables["instance"]["exemptionRequests"]>
	
</cffunction>

<cffunction name="setExemptionRequests" access="public" returntype="void" output="No">
<cfargument name="exemptionRequests" required="Yes" type="any">
	
	<cfset variables["instance"]["exemptionRequests"]=arguments["exemptionRequests"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
