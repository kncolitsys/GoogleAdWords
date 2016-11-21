<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Sitelink" hint="Class to represent a single sitelink" extends="utils">

<cfproperty name="displayText" required="no" type="string" hint="This field can be selected using the value 'DisplayText'. This field is required and should not be null. The length of this string should be between 1 and 35, inclusive." seq="1">
<cfproperty name="destinationUrl" required="no" type="string" hint="This field can be selected using the value 'DestinationUrl'. This field is required and should not be null. The length of this string should be between 1 and 1024, inclusive." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getDisplayText" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['displayText']" default="">
	<cfreturn variables["instance"]["displayText"]>
	
</cffunction>

<cffunction name="setDisplayText" access="public" returntype="void" output="No">
<cfargument name="displayText" required="Yes" type="any">
	
	<cfset variables["instance"]["displayText"]=arguments["displayText"]>
		
</cffunction>

<cffunction name="getDestinationUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['destinationUrl']" default="">
	<cfreturn variables["instance"]["destinationUrl"]>
	
</cffunction>

<cffunction name="setDestinationUrl" access="public" returntype="void" output="No">
<cfargument name="destinationUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["destinationUrl"]=arguments["destinationUrl"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
