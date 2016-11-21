<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Target" hint="Target abstract class." extends="utils">

<cfproperty name="Target_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of Target. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getTargetType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Target_Type']" default="">
	<cfreturn variables["instance"]["Target_Type"]>
	
</cffunction>

<cffunction name="setTargetType" access="public" returntype="void" output="No">
<cfargument name="Target_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Target_Type"]=arguments["Target_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
