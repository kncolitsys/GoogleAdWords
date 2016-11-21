<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="QuotaError" hint="Errors that are thrown if a quota limit is exceeded." extends="ApiError">

<cfproperty name="reason" required="no" type="string" hint="The error reason represented by an enum." seq="5">
<cfproperty name="limit" required="no" type="int" hint="The number of entities allowed for this quota." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setApiErrorType("QuotaError")>

<cffunction name="getReason" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reason']" default="">
	<cfreturn variables["instance"]["reason"]>
	
</cffunction>

<cffunction name="setReason" access="public" returntype="void" output="No">
<cfargument name="reason" required="Yes" type="any">
	
	<cfset variables["instance"]["reason"]=arguments["reason"]>
		
</cffunction>

<cffunction name="getLimit" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['limit']" default="">
	<cfreturn variables["instance"]["limit"]>
	
</cffunction>

<cffunction name="setLimit" access="public" returntype="void" output="No">
<cfargument name="limit" required="Yes" type="any">
	
	<cfset variables["instance"]["limit"]=arguments["limit"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
