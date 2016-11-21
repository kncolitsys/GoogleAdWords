<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ApiException" hint="Exception class for holding a list of service errors." extends="ApplicationException">

<cfproperty name="errors" required="no" type="ApiError[]" hint="List of errors." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setApplicationExceptionType("ApiException")>

<cffunction name="getErrors" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['errors']" default="">
	<cfreturn variables["instance"]["errors"]>
	
</cffunction>

<cffunction name="setErrors" access="public" returntype="void" output="No">
<cfargument name="errors" required="Yes" type="any">
	
	<cfset variables["instance"]["errors"]=arguments["errors"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
