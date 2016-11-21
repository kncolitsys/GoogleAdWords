<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Page" hint="Contains the results from a get call." extends="utils">

<cfproperty name="totalNumEntries" required="no" type="int" hint="Total number of entries in the result that this page is a part of." seq="1">
<cfproperty name="Page_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of Page of this instance. It is ignored on input, and instead xsi:type should be specified." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getTotalNumEntries" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['totalNumEntries']" default="">
	<cfreturn variables["instance"]["totalNumEntries"]>
	
</cffunction>

<cffunction name="setTotalNumEntries" access="public" returntype="void" output="No">
<cfargument name="totalNumEntries" required="Yes" type="any">
	
	<cfset variables["instance"]["totalNumEntries"]=arguments["totalNumEntries"]>
		
</cffunction>

<cffunction name="getPageType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Page_Type']" default="">
	<cfreturn variables["instance"]["Page_Type"]>
	
</cffunction>

<cffunction name="setPageType" access="public" returntype="void" output="No">
<cfargument name="Page_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Page_Type"]=arguments["Page_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
