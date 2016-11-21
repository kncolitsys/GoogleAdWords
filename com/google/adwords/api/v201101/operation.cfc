<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Operation" hint="This represents an operation that includes an operator and an operand specified type." extends="utils">

<cfproperty name="operator" required="no" type="string" hint="Operator. This field is required and should not be null." seq="1">
<cfproperty name="Operation_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of Operation of this instance. It is ignored on input, and instead xsi:type should be specified." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getOperator" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operator']" default="">
	<cfreturn variables["instance"]["operator"]>
	
</cffunction>

<cffunction name="setOperator" access="public" returntype="void" output="No">
<cfargument name="operator" required="Yes" type="any">
	
	<cfset variables["instance"]["operator"]=arguments["operator"]>
		
</cffunction>

<cffunction name="getOperationType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Operation_Type']" default="">
	<cfreturn variables["instance"]["Operation_Type"]>
	
</cffunction>

<cffunction name="setOperationType" access="public" returntype="void" output="No">
<cfargument name="Operation_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Operation_Type"]=arguments["Operation_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
