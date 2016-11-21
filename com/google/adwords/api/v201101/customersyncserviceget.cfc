<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="customersyncserviceget" extends="utils">

<cfproperty name="selector" required="no" type="CustomerSyncSelector" hint="This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getSelector" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['selector']" default="">
	<cfreturn variables["instance"]["selector"]>
	
</cffunction>

<cffunction name="setSelector" access="public" returntype="void" output="No">
<cfargument name="selector" required="Yes" type="any">
	
	<cfset variables["instance"]["selector"]=arguments["selector"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/ch/v201101">
	
</cffunction>	

</cfcomponent>