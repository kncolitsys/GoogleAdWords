<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupAdOperation" hint="AdGroupAd service operations." extends="Operation">

<cfproperty name="operand" required="no" type="AdGroupAd" hint="AdGroupAd to operate on. This field is required and should not be null." seq="3">
<cfproperty name="exemptionRequests" required="no" type="ExemptionRequest[]" hint="Exemption requests for any policy violations in this Ad. This field is only used for ADD operations" seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationType("AdGroupAdOperation")>

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
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
