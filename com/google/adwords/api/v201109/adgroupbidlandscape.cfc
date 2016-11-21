<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupBidLandscape" hint="Represents data about a bidlandscape for an adgroup." extends="BidLandscape">

<cfproperty name="type" required="no" type="string" hint="This field can be selected using the value 'LandscapeType'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="landscapeCurrent" required="no" type="boolean" hint="This field can be selected using the value 'LandscapeCurrent'.This field can be filtered on. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setDataEntryType("BidLandscape")>

<cffunction name="getType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['type']" default="">
	<cfreturn variables["instance"]["type"]>
	
</cffunction>

<cffunction name="setType" access="public" returntype="void" output="No">
<cfargument name="type" required="Yes" type="any">
	
	<cfset variables["instance"]["type"]=arguments["type"]>
		
</cffunction>

<cffunction name="getLandscapeCurrent" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['landscapeCurrent']" default="">
	<cfreturn variables["instance"]["landscapeCurrent"]>
	
</cffunction>

<cffunction name="setLandscapeCurrent" access="public" returntype="void" output="No">
<cfargument name="landscapeCurrent" required="Yes" type="any">
	
	<cfset variables["instance"]["landscapeCurrent"]=arguments["landscapeCurrent"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
