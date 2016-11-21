<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ListReturnValue" hint="Base list return value type." extends="utils">

<cfproperty name="ListReturnValue_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of ListReturnValue of this instance. It is ignored on input, and instead xsi:type should be specified." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getListReturnValueType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ListReturnValue_Type']" default="">
	<cfreturn variables["instance"]["ListReturnValue_Type"]>
	
</cffunction>

<cffunction name="setListReturnValueType" access="public" returntype="void" output="No">
<cfargument name="ListReturnValue_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["ListReturnValue_Type"]=arguments["ListReturnValue_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
