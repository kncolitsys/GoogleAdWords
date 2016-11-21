<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ProductCondition" hint="Conditions to filter the products defined in product feed for targeting. The condition is defined as operand=argument." extends="utils">

<cfproperty name="argument" required="no" type="string" hint="Value of the product operand to comapare against This field can be selected using the value 'Argument'. This field is required and should not be null." seq="1">
<cfproperty name="operand" required="no" type="ProductConditionOperand" hint="Operand of product filter condition This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getArgument" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['argument']" default="">
	<cfreturn variables["instance"]["argument"]>
	
</cffunction>

<cffunction name="setArgument" access="public" returntype="void" output="No">
<cfargument name="argument" required="Yes" type="any">
	
	<cfset variables["instance"]["argument"]=arguments["argument"]>
		
</cffunction>

<cffunction name="getOperand" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operand']" default="">
	<cfreturn variables["instance"]["operand"]>
	
</cffunction>

<cffunction name="setOperand" access="public" returntype="void" output="No">
<cfargument name="operand" required="Yes" type="any">
	
	<cfset variables["instance"]["operand"]=arguments["operand"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
