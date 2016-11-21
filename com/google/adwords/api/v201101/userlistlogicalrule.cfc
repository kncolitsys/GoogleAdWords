<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="UserListLogicalRule" hint="A user list logical rule. A rule has a logical operator (and/or/not) and a list of operands that can be user lists or user interests." extends="utils">

<cfproperty name="operator" required="no" type="string" hint="The logical operator of the rule. This field is required and should not be null." seq="1">
<cfproperty name="ruleOperands" required="no" type="LogicalUserListOperand[]" hint="The list of operands of the rule. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

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

<cffunction name="getRuleOperands" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ruleOperands']" default="">
	<cfreturn variables["instance"]["ruleOperands"]>
	
</cffunction>

<cffunction name="setRuleOperands" access="public" returntype="void" output="No">
<cfargument name="ruleOperands" required="Yes" type="any">
	
	<cfset variables["instance"]["ruleOperands"]=arguments["ruleOperands"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
