<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConversionTrackerStats" hint="Usage stats about a single ConversionTracker." extends="utils">

<cfproperty name="numConversionEvents" required="no" type="int" hint="This field can be selected using the value 'NumConversionEvents'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="conversionValue" required="no" type="Money" hint="This field can be selected using the value 'ConversionValue'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="mostRecentConversionDate" required="no" type="string" hint="This field can be selected using the value 'MostRecentConversionDate'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="numConvertedClicks" required="no" type="int" hint="The number of converted clicks, a.k.a. 1-per-click conversions. This field can be selected using the value 'NumConvertedClicks'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getNumConversionEvents" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numConversionEvents']" default="">
	<cfreturn variables["instance"]["numConversionEvents"]>
	
</cffunction>

<cffunction name="setNumConversionEvents" access="public" returntype="void" output="No">
<cfargument name="numConversionEvents" required="Yes" type="any">
	
	<cfset variables["instance"]["numConversionEvents"]=arguments["numConversionEvents"]>
		
</cffunction>

<cffunction name="getConversionValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversionValue']" default="">
	<cfreturn variables["instance"]["conversionValue"]>
	
</cffunction>

<cffunction name="setConversionValue" access="public" returntype="void" output="No">
<cfargument name="conversionValue" required="Yes" type="any">
	
	<cfset variables["instance"]["conversionValue"]=arguments["conversionValue"]>
		
</cffunction>

<cffunction name="getMostRecentConversionDate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['mostRecentConversionDate']" default="">
	<cfreturn variables["instance"]["mostRecentConversionDate"]>
	
</cffunction>

<cffunction name="setMostRecentConversionDate" access="public" returntype="void" output="No">
<cfargument name="mostRecentConversionDate" required="Yes" type="any">
	
	<cfset variables["instance"]["mostRecentConversionDate"]=arguments["mostRecentConversionDate"]>
		
</cffunction>

<cffunction name="getNumConvertedClicks" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numConvertedClicks']" default="">
	<cfreturn variables["instance"]["numConvertedClicks"]>
	
</cffunction>

<cffunction name="setNumConvertedClicks" access="public" returntype="void" output="No">
<cfargument name="numConvertedClicks" required="Yes" type="any">
	
	<cfset variables["instance"]["numConvertedClicks"]=arguments["numConvertedClicks"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
