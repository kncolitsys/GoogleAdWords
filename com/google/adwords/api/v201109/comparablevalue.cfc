<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ComparableValue" hint="Comparable types for constructing ranges with." extends="utils">

<cfproperty name="ComparableValue_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of ComparableValue. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getComparableValueType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ComparableValue_Type']" default="">
	<cfreturn variables["instance"]["ComparableValue_Type"]>
	
</cffunction>

<cffunction name="setComparableValueType" access="public" returntype="void" output="No">
<cfargument name="ComparableValue_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["ComparableValue_Type"]=arguments["ComparableValue_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
