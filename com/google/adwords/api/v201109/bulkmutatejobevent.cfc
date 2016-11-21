<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateJobEvent" hint="An event defined by a status change of a bulk mutate job." extends="JobEvent">

<cfproperty name="status" required="no" type="string" hint="The new job status defining this event." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setJobEventType("BulkMutateJobEvent")>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
