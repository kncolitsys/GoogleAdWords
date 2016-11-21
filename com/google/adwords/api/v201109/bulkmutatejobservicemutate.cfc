<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="bulkmutatejobservicemutate" extends="utils">

<cfproperty name="operation" required="no" type="JobOperation" hint="This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getOperation" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operation']" default="">
	<cfreturn variables["instance"]["operation"]>
	
</cffunction>

<cffunction name="setOperation" access="public" returntype="void" output="No">
<cfargument name="operation" required="Yes" type="any">
	
	<cfset variables["instance"]["operation"]=arguments["operation"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
