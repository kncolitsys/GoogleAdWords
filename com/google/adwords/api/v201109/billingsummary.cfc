<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BillingSummary" hint="Represents the billing summary of the job that provides the overall cost of the job's operations, i.e., for the work done by the job. This therefore excludes the cost of operating on the job itself - setting up the job, polling for its status, retrieving the result, etc." extends="utils">

<cfproperty name="numOperations" required="no" type="int" hint="The number of billable operations performed by this job." seq="1">
<cfproperty name="numUnits" required="no" type="long" hint="The cost of this job in number of billing quota units." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getNumOperations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numOperations']" default="">
	<cfreturn variables["instance"]["numOperations"]>
	
</cffunction>

<cffunction name="setNumOperations" access="public" returntype="void" output="No">
<cfargument name="numOperations" required="Yes" type="any">
	
	<cfset variables["instance"]["numOperations"]=arguments["numOperations"]>
		
</cffunction>

<cffunction name="getNumUnits" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numUnits']" default="">
	<cfreturn variables["instance"]["numUnits"]>
	
</cffunction>

<cffunction name="setNumUnits" access="public" returntype="void" output="No">
<cfargument name="numUnits" required="Yes" type="any">
	
	<cfset variables["instance"]["numUnits"]=arguments["numUnits"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
