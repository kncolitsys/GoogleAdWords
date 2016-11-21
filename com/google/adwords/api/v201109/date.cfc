<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Date" hint="Represents a date." extends="utils">

<cfproperty name="year" required="no" type="int" hint="Year (e.g., 2009)" seq="1">
<cfproperty name="month" required="no" type="int" hint="Month (1..12)" seq="2">
<cfproperty name="day" required="no" type="int" hint="Day (1..31)" seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getYear" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['year']" default="">
	<cfreturn variables["instance"]["year"]>
	
</cffunction>

<cffunction name="setYear" access="public" returntype="void" output="No">
<cfargument name="year" required="Yes" type="any">
	
	<cfset variables["instance"]["year"]=arguments["year"]>
		
</cffunction>

<cffunction name="getMonth" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['month']" default="">
	<cfreturn variables["instance"]["month"]>
	
</cffunction>

<cffunction name="setMonth" access="public" returntype="void" output="No">
<cfargument name="month" required="Yes" type="any">
	
	<cfset variables["instance"]["month"]=arguments["month"]>
		
</cffunction>

<cffunction name="getDay" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['day']" default="">
	<cfreturn variables["instance"]["day"]>
	
</cffunction>

<cffunction name="setDay" access="public" returntype="void" output="No">
<cfargument name="day" required="Yes" type="any">
	
	<cfset variables["instance"]["day"]=arguments["day"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
