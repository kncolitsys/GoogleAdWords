<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Criterion" hint="Represents a criterion (such as a keyword, placement, or vertical)." extends="utils">

<cfproperty name="id" required="no" type="long" hint="ID of this criterion. This field can be selected using the value 'Id'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : SET, REMOVE." seq="1">
<cfproperty name="Criterion_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of Criterion of this instance. It is ignored on input, and instead xsi:type should be specified." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getCriterionType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Criterion_Type']" default="">
	<cfreturn variables["instance"]["Criterion_Type"]>
	
</cffunction>

<cffunction name="setCriterionType" access="public" returntype="void" output="No">
<cfargument name="Criterion_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Criterion_Type"]=arguments["Criterion_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
