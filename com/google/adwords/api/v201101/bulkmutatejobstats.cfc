<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateJobStats" hint="Bulk mutate job-handling statistics." extends="JobStats">

<cfproperty name="numOperations" required="no" type="int" hint="The total number of operations in this bulk mutate job." seq="5">
<cfproperty name="numFailedOperations" required="no" type="int" hint="The number of failed operations in this bulk mutate job." seq="6">
<cfproperty name="numUnprocessedOperations" required="no" type="int" hint="The number of operations in this bulk mutate job that have not yet been processed, or will not be processed." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setJobStatsType("BulkMutateJobStats")>

<cffunction name="getNumOperations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numOperations']" default="">
	<cfreturn variables["instance"]["numOperations"]>
	
</cffunction>

<cffunction name="setNumOperations" access="public" returntype="void" output="No">
<cfargument name="numOperations" required="Yes" type="any">
	
	<cfset variables["instance"]["numOperations"]=arguments["numOperations"]>
		
</cffunction>

<cffunction name="getNumFailedOperations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numFailedOperations']" default="">
	<cfreturn variables["instance"]["numFailedOperations"]>
	
</cffunction>

<cffunction name="setNumFailedOperations" access="public" returntype="void" output="No">
<cfargument name="numFailedOperations" required="Yes" type="any">
	
	<cfset variables["instance"]["numFailedOperations"]=arguments["numFailedOperations"]>
		
</cffunction>

<cffunction name="getNumUnprocessedOperations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numUnprocessedOperations']" default="">
	<cfreturn variables["instance"]["numUnprocessedOperations"]>
	
</cffunction>

<cffunction name="setNumUnprocessedOperations" access="public" returntype="void" output="No">
<cfargument name="numUnprocessedOperations" required="Yes" type="any">
	
	<cfset variables["instance"]["numUnprocessedOperations"]=arguments["numUnprocessedOperations"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
