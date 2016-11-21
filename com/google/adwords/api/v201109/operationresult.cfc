<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="OperationResult" hint="Represents the result of an individual mutate operation." extends="utils">

<cfproperty name="OperationResult_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of OperationResult. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getOperationResultType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['OperationResult_Type']" default="">
	<cfreturn variables["instance"]["OperationResult_Type"]>
	
</cffunction>

<cffunction name="setOperationResultType" access="public" returntype="void" output="No">
<cfargument name="OperationResult_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["OperationResult_Type"]=arguments["OperationResult_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
