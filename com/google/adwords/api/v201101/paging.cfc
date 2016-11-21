<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Paging" hint="Specifies the page of results to return in the response. A page is specified by the result position to start at and the maximum number of results to return." extends="utils">

<cfproperty name="startIndex" required="no" type="int" hint="Index of the first result to return in this page. This field must be greater than or equal to 0." seq="1">
<cfproperty name="numberResults" required="no" type="int" hint="Maximum number of results to return in this page. This field must be greater than or equal to 0." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getStartIndex" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['startIndex']" default="">
	<cfreturn variables["instance"]["startIndex"]>
	
</cffunction>

<cffunction name="setStartIndex" access="public" returntype="void" output="No">
<cfargument name="startIndex" required="Yes" type="any">
	
	<cfset variables["instance"]["startIndex"]=arguments["startIndex"]>
		
</cffunction>

<cffunction name="getNumberResults" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numberResults']" default="">
	<cfreturn variables["instance"]["numberResults"]>
	
</cffunction>

<cffunction name="setNumberResults" access="public" returntype="void" output="No">
<cfargument name="numberResults" required="Yes" type="any">
	
	<cfset variables["instance"]["numberResults"]=arguments["numberResults"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
