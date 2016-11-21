<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="reportdefinitionservicegetreportfields" extends="utils">

<cfproperty name="reportType" required="no" type="string" hint="This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getReportType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reportType']" default="">
	<cfreturn variables["instance"]["reportType"]>
	
</cffunction>

<cffunction name="setReportType" access="public" returntype="void" output="No">
<cfargument name="reportType" required="Yes" type="any">
	
	<cfset variables["instance"]["reportType"]=arguments["reportType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
