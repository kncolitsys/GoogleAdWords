<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="KeywordEstimate" hint="Represents the traffic estimate result for a single keyword." extends="Estimate">

<cfproperty name="criterionId" required="no" type="long" hint="The existing criterionId for this keyword, if any. This will not be returned if this is a new keyword." seq="2">
<cfproperty name="min" required="no" type="StatsEstimate" hint="The lower bound on the estimated stats. This is not a guarantee that actual performance will never be lower than these stats." seq="3">
<cfproperty name="max" required="no" type="StatsEstimate" hint="The upper bound on the estimated stats. This is not a guarantee that actual performance will never be higher than these stats." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setEstimateType("KeywordEstimate")>

<cffunction name="getCriterionId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criterionId']" default="">
	<cfreturn variables["instance"]["criterionId"]>
	
</cffunction>

<cffunction name="setCriterionId" access="public" returntype="void" output="No">
<cfargument name="criterionId" required="Yes" type="any">
	
	<cfset variables["instance"]["criterionId"]=arguments["criterionId"]>
		
</cffunction>

<cffunction name="getMin" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['min']" default="">
	<cfreturn variables["instance"]["min"]>
	
</cffunction>

<cffunction name="setMin" access="public" returntype="void" output="No">
<cfargument name="min" required="Yes" type="any">
	
	<cfset variables["instance"]["min"]=arguments["min"]>
		
</cffunction>

<cffunction name="getMax" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['max']" default="">
	<cfreturn variables["instance"]["max"]>
	
</cffunction>

<cffunction name="setMax" access="public" returntype="void" output="No">
<cfargument name="max" required="Yes" type="any">
	
	<cfset variables["instance"]["max"]=arguments["max"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
