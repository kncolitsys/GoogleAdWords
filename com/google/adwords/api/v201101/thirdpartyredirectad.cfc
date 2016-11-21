<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ThirdPartyRedirectAd" hint="Data associated with rich media extension attributes." extends="RichMediaAd">

<cfproperty name="isCookieTargeted" required="no" type="boolean" hint="Defines whether or not the ad is cookie targeted. (i.e. user list targeting, or the network's equivalent). This field can be selected using the value 'IsCookieTargeted'. This field is required and should not be null." seq="1">
<cfproperty name="isUserInterestTargeted" required="no" type="boolean" hint="Defines whether or not the ad is targeting user interest. This field can be selected using the value 'IsUserInterestTargeted'. This field is required and should not be null." seq="2">
<cfproperty name="isTagged" required="no" type="boolean" hint="Defines whether or not the ad contains a tracking pixel of any kind. This field can be selected using the value 'IsTagged'. This field is required and should not be null." seq="3">
<cfproperty name="videoTypes" required="no" type="string[]" hint="Video Types of the ad. (RealMedia, Quick Time etc.) This field can be selected using the value 'VideoTypes'. This field is required and should not be null." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("RichMediaAd")>

<cffunction name="getIsCookieTargeted" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isCookieTargeted']" default="">
	<cfreturn variables["instance"]["isCookieTargeted"]>
	
</cffunction>

<cffunction name="setIsCookieTargeted" access="public" returntype="void" output="No">
<cfargument name="isCookieTargeted" required="Yes" type="any">
	
	<cfset variables["instance"]["isCookieTargeted"]=arguments["isCookieTargeted"]>
		
</cffunction>

<cffunction name="getIsUserInterestTargeted" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isUserInterestTargeted']" default="">
	<cfreturn variables["instance"]["isUserInterestTargeted"]>
	
</cffunction>

<cffunction name="setIsUserInterestTargeted" access="public" returntype="void" output="No">
<cfargument name="isUserInterestTargeted" required="Yes" type="any">
	
	<cfset variables["instance"]["isUserInterestTargeted"]=arguments["isUserInterestTargeted"]>
		
</cffunction>

<cffunction name="getIsTagged" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isTagged']" default="">
	<cfreturn variables["instance"]["isTagged"]>
	
</cffunction>

<cffunction name="setIsTagged" access="public" returntype="void" output="No">
<cfargument name="isTagged" required="Yes" type="any">
	
	<cfset variables["instance"]["isTagged"]=arguments["isTagged"]>
		
</cffunction>

<cffunction name="getVideoTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['videoTypes']" default="">
	<cfreturn variables["instance"]["videoTypes"]>
	
</cffunction>

<cffunction name="setVideoTypes" access="public" returntype="void" output="No">
<cfargument name="videoTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["videoTypes"]=arguments["videoTypes"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
