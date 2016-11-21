<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LongValue" hint="Number value type for constructing long valued ranges." extends="NumberValue">

<cfproperty name="number" required="no" type="long" hint="the underlying long value." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getNumber" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['number']" default="">
	<cfreturn variables["instance"]["number"]>
	
</cffunction>

<cffunction name="setNumber" access="public" returntype="void" output="No">
<cfargument name="number" required="Yes" type="any">
	
	<cfset variables["instance"]["number"]=arguments["number"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
