<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="EntityNotFound" hint="An id did not correspond to an entity, or it referred to an entity which does not belong to the customer." extends="ApiError">

<cfproperty name="reason" required="no" type="string" hint="Reason for this error." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setApiErrorType("EntityNotFound")>

<cffunction name="getReason" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reason']" default="">
	<cfreturn variables["instance"]["reason"]>
	
</cffunction>

<cffunction name="setReason" access="public" returntype="void" output="No">
<cfargument name="reason" required="Yes" type="any">
	
	<cfset variables["instance"]["reason"]=arguments["reason"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>