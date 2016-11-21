<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MonthlySearchVolume" hint="A keyword response value representing search volume for a single month. An instance with a null count is valid, indicating that the information is unavailable." extends="utils">

<cfproperty name="year" required="no" type="int" hint="The year this search volume occurred in. (i.e. 2009)" seq="1">
<cfproperty name="month" required="no" type="int" hint="The month this search volume occurred in. Month is 1 indexed, such that 1=January and 12=December." seq="2">
<cfproperty name="count" required="no" type="long" hint="The approximate number of searches in this year/month. A null count means that data is unavailable or unknown." seq="3">

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

<cffunction name="getCount" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['count']" default="">
	<cfreturn variables["instance"]["count"]>
	
</cffunction>

<cffunction name="setCount" access="public" returntype="void" output="No">
<cfargument name="count" required="Yes" type="any">
	
	<cfset variables["instance"]["count"]=arguments["count"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
