<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="JobSelector" hint="For selecting jobs whose information will be returned from a get method call of a job service. The selector is immutable so use the inner Builder class to create one." extends="utils">

<cfproperty name="includeHistory" required="no" type="boolean" hint="Indicates if the event history should be included in the each of the returned jobs." seq="1">
<cfproperty name="includeStats" required="no" type="boolean" hint="Indicates if the processing statistics should be included in the each of the returned jobs." seq="2">
<cfproperty name="JobSelector_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of JobSelector. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getIncludeHistory" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['includeHistory']" default="">
	<cfreturn variables["instance"]["includeHistory"]>
	
</cffunction>

<cffunction name="setIncludeHistory" access="public" returntype="void" output="No">
<cfargument name="includeHistory" required="Yes" type="any">
	
	<cfset variables["instance"]["includeHistory"]=arguments["includeHistory"]>
		
</cffunction>

<cffunction name="getIncludeStats" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['includeStats']" default="">
	<cfreturn variables["instance"]["includeStats"]>
	
</cffunction>

<cffunction name="setIncludeStats" access="public" returntype="void" output="No">
<cfargument name="includeStats" required="Yes" type="any">
	
	<cfset variables["instance"]["includeStats"]=arguments["includeStats"]>
		
</cffunction>

<cffunction name="getJobSelectorType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['JobSelector_Type']" default="">
	<cfreturn variables["instance"]["JobSelector_Type"]>
	
</cffunction>

<cffunction name="setJobSelectorType" access="public" returntype="void" output="No">
<cfargument name="JobSelector_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["JobSelector_Type"]=arguments["JobSelector_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
