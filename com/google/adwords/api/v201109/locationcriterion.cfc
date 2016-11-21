<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LocationCriterion" hint="Represents data that encapsulates a location criterion." extends="utils">

<cfproperty name="location" required="no" type="Location" hint="Location criterion" seq="1">
<cfproperty name="canonicalName" required="no" type="string" hint="Canonical name of the location criterion. This field can be selected using the value 'CanonicalName'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="reach" required="no" type="long" hint="Approximate user population that will be targeted, rounded to the nearest 100. This field can be selected using the value 'Reach'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="locale" required="no" type="string" hint="Locale of the name, as specified in the request. Note: If the specified locale filter is invalid, or not supported, en_US will be used by default. This field can be filtered on using the value 'Locale'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="searchTerm" required="no" type="string" hint="Firenze. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getLocation" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['location']" default="">
	<cfreturn variables["instance"]["location"]>
	
</cffunction>

<cffunction name="setLocation" access="public" returntype="void" output="No">
<cfargument name="location" required="Yes" type="any">
	
	<cfset variables["instance"]["location"]=arguments["location"]>
		
</cffunction>

<cffunction name="getCanonicalName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['canonicalName']" default="">
	<cfreturn variables["instance"]["canonicalName"]>
	
</cffunction>

<cffunction name="setCanonicalName" access="public" returntype="void" output="No">
<cfargument name="canonicalName" required="Yes" type="any">
	
	<cfset variables["instance"]["canonicalName"]=arguments["canonicalName"]>
		
</cffunction>

<cffunction name="getReach" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reach']" default="">
	<cfreturn variables["instance"]["reach"]>
	
</cffunction>

<cffunction name="setReach" access="public" returntype="void" output="No">
<cfargument name="reach" required="Yes" type="any">
	
	<cfset variables["instance"]["reach"]=arguments["reach"]>
		
</cffunction>

<cffunction name="getLocale" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['locale']" default="">
	<cfreturn variables["instance"]["locale"]>
	
</cffunction>

<cffunction name="setLocale" access="public" returntype="void" output="No">
<cfargument name="locale" required="Yes" type="any">
	
	<cfset variables["instance"]["locale"]=arguments["locale"]>
		
</cffunction>

<cffunction name="getSearchTerm" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['searchTerm']" default="">
	<cfreturn variables["instance"]["searchTerm"]>
	
</cffunction>

<cffunction name="setSearchTerm" access="public" returntype="void" output="No">
<cfargument name="searchTerm" required="Yes" type="any">
	
	<cfset variables["instance"]["searchTerm"]=arguments["searchTerm"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
