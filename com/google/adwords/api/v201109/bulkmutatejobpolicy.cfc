<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateJobPolicy" hint="A basic job policy." extends="utils">

<cfproperty name="prerequisiteJobIds" required="no" type="long[]" hint="Ids of jobs that must successfully complete before this job can be processed. The maximum size of this collection is 100." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getPrerequisiteJobIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['prerequisiteJobIds']" default="">
	<cfreturn variables["instance"]["prerequisiteJobIds"]>
	
</cffunction>

<cffunction name="setPrerequisiteJobIds" access="public" returntype="void" output="No">
<cfargument name="prerequisiteJobIds" required="Yes" type="any">
	
	<cfset variables["instance"]["prerequisiteJobIds"]=arguments["prerequisiteJobIds"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
