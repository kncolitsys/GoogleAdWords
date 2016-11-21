<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Estimate" hint="Abstract class representing an reply to an EstimateRequest." extends="utils">

<cfproperty name="Estimate_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/o/v201109'" hint="Indicates that this instance is a subtype of Estimate. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getEstimateType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Estimate_Type']" default="">
	<cfreturn variables["instance"]["Estimate_Type"]>
	
</cffunction>

<cffunction name="setEstimateType" access="public" returntype="void" output="No">
<cfargument name="Estimate_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Estimate_Type"]=arguments["Estimate_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
