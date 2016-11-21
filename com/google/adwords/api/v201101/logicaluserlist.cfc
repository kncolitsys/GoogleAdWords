<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LogicalUserList" hint="Represents a user list that is a custom combination of user lists and user interests." extends="UserList">

<cfproperty name="rules" required="no" type="UserListLogicalRule[]" hint="Logical list rules that define this user list. The rules are defined as logical operator (ALL/ANY/NONE) and a list of user lists. All the rules are anded for the evaluation. This field can be selected using the value 'Rules'. This field is required and should not be null when it is contained within Operators : ADD." seq="13">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setUserListType("LogicalUserList")>

<cffunction name="getRules" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['rules']" default="">
	<cfreturn variables["instance"]["rules"]>
	
</cffunction>

<cffunction name="setRules" access="public" returntype="void" output="No">
<cfargument name="rules" required="Yes" type="any">
	
	<cfset variables["instance"]["rules"]=arguments["rules"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
