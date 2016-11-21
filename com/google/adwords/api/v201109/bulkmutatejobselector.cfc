<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateJobSelector" hint="Specifies additional criteria for selecting bulk mutate jobs." extends="JobSelector">

<cfproperty name="jobIds" required="no" type="long[]" hint="The list of jobs, specified by IDs, to be selected. This field must contain distinct elements. This field must not contain null elements." seq="4">
<cfproperty name="jobStatuses" required="no" type="string[]" hint="Only jobs having these statuses are selected. If omitted, it indicates that all jobs statuses should be selected. This field must contain distinct elements. This field must not contain null elements." seq="5">
<cfproperty name="resultPartIndex" required="no" type="int" hint="The index of the result part to include with in the returned jobs. null indicates that no result part is to be included. Only set this field if the selector specifies exactly one job using  jobIds (a request part can be retrieved for only one job at a time). This field must be greater than or equal to 0." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setJobSelectorType("BulkMutateJobSelector")>

<cffunction name="getJobIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['jobIds']" default="">
	<cfreturn variables["instance"]["jobIds"]>
	
</cffunction>

<cffunction name="setJobIds" access="public" returntype="void" output="No">
<cfargument name="jobIds" required="Yes" type="any">
	
	<cfset variables["instance"]["jobIds"]=arguments["jobIds"]>
		
</cffunction>

<cffunction name="getJobStatuses" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['jobStatuses']" default="">
	<cfreturn variables["instance"]["jobStatuses"]>
	
</cffunction>

<cffunction name="setJobStatuses" access="public" returntype="void" output="No">
<cfargument name="jobStatuses" required="Yes" type="any">
	
	<cfset variables["instance"]["jobStatuses"]=arguments["jobStatuses"]>
		
</cffunction>

<cffunction name="getResultPartIndex" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['resultPartIndex']" default="">
	<cfreturn variables["instance"]["resultPartIndex"]>
	
</cffunction>

<cffunction name="setResultPartIndex" access="public" returntype="void" output="No">
<cfargument name="resultPartIndex" required="Yes" type="any">
	
	<cfset variables["instance"]["resultPartIndex"]=arguments["resultPartIndex"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
