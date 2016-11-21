<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="StatsEstimate" hint="Represents a set of stats for a traffic estimate." extends="utils">

<cfproperty name="averageCpc" required="no" type="Money" hint="The estimated average CPC." seq="1">
<cfproperty name="averagePosition" required="no" type="double" hint="The estimated average position." seq="2">
<cfproperty name="clicksPerDay" required="no" type="float" hint="The estimated number of clicks per day, in floating point representation." seq="3">
<cfproperty name="totalCost" required="no" type="Money" hint="The estimated total cost." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAverageCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['averageCpc']" default="">
	<cfreturn variables["instance"]["averageCpc"]>
	
</cffunction>

<cffunction name="setAverageCpc" access="public" returntype="void" output="No">
<cfargument name="averageCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["averageCpc"]=arguments["averageCpc"]>
		
</cffunction>

<cffunction name="getAveragePosition" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['averagePosition']" default="">
	<cfreturn variables["instance"]["averagePosition"]>
	
</cffunction>

<cffunction name="setAveragePosition" access="public" returntype="void" output="No">
<cfargument name="averagePosition" required="Yes" type="any">
	
	<cfset variables["instance"]["averagePosition"]=arguments["averagePosition"]>
		
</cffunction>

<cffunction name="getClicksPerDay" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clicksPerDay']" default="">
	<cfreturn variables["instance"]["clicksPerDay"]>
	
</cffunction>

<cffunction name="setClicksPerDay" access="public" returntype="void" output="No">
<cfargument name="clicksPerDay" required="Yes" type="any">
	
	<cfset variables["instance"]["clicksPerDay"]=arguments["clicksPerDay"]>
		
</cffunction>

<cffunction name="getTotalCost" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['totalCost']" default="">
	<cfreturn variables["instance"]["totalCost"]>
	
</cffunction>

<cffunction name="setTotalCost" access="public" returntype="void" output="No">
<cfargument name="totalCost" required="Yes" type="any">
	
	<cfset variables["instance"]["totalCost"]=arguments["totalCost"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
