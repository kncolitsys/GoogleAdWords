<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MobileAd" hint="Represents a mobile ad. A mobile ad can contain a click-to-call phone number, a link to a website, or both. You specify which features you want by setting certain fields, as shown in the following table. For example, to create a click-to-call mobile ad, set the fields in the Click-to-call column. A hyphen indicates that you should not set the corresponding field. For more information, see Mobile Ads Requirements. Click-to-call Website Both headline description mobileCarriers phoneNumber countryCode businessName - - - headline description mobileCarriers - - - displayUrl destinationUrl markupLanguages headline description mobileCarriers phoneNumber countryCode businessName displayUrl destinationUrl markupLanguages" extends="Ad">

<cfproperty name="headline" required="no" type="string" hint="The headline of the ad This field can be selected using the value 'Headline'." seq="8">
<cfproperty name="description" required="no" type="string" hint="The description line This field can be selected using the value 'Description'." seq="9">
<cfproperty name="markupLanguages" required="no" type="string[]" hint="The list of markup languages to use for the mobile ad. This field can be selected using the value 'MarkupLanguages'." seq="10">
<cfproperty name="mobileCarriers" required="no" type="string[]" hint="The list of mobile carriers to use for the mobile ad. Each string must be of the form 'CarrierName@CountryCode'. To specify that all available carriers are to be used, use the reserved keyword 'ALLCARRIERS'. See available mobile carriers. This field can be selected using the value 'MobileCarriers'." seq="11">
<cfproperty name="businessName" required="no" type="string" hint="The business name of the mobile ad. Must not exceed 20 characters (except for ads targeted to Japan, which must not exceed 10 Japanese characters). This field can be selected using the value 'BusinessName'." seq="12">
<cfproperty name="countryCode" required="no" type="string" hint="The country code for the phone number in the click-to-call mobile ad. The click-to-call ad will display only in this country. This field will be used to verify the phone number format and validate the targeted mobile carriers. This field can be selected using the value 'CountryCode'." seq="13">
<cfproperty name="phoneNumber" required="no" type="string" hint="The click-to-call phone number. Must not exceed 20 characters. This field can be selected using the value 'PhoneNumber'." seq="14">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("MobileAd")>

<cffunction name="getHeadline" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['headline']" default="">
	<cfreturn variables["instance"]["headline"]>
	
</cffunction>

<cffunction name="setHeadline" access="public" returntype="void" output="No">
<cfargument name="headline" required="Yes" type="any">
	
	<cfset variables["instance"]["headline"]=arguments["headline"]>
		
</cffunction>

<cffunction name="getDescription" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['description']" default="">
	<cfreturn variables["instance"]["description"]>
	
</cffunction>

<cffunction name="setDescription" access="public" returntype="void" output="No">
<cfargument name="description" required="Yes" type="any">
	
	<cfset variables["instance"]["description"]=arguments["description"]>
		
</cffunction>

<cffunction name="getMarkupLanguages" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['markupLanguages']" default="">
	<cfreturn variables["instance"]["markupLanguages"]>
	
</cffunction>

<cffunction name="setMarkupLanguages" access="public" returntype="void" output="No">
<cfargument name="markupLanguages" required="Yes" type="any">
	
	<cfset variables["instance"]["markupLanguages"]=arguments["markupLanguages"]>
		
</cffunction>

<cffunction name="getMobileCarriers" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['mobileCarriers']" default="">
	<cfreturn variables["instance"]["mobileCarriers"]>
	
</cffunction>

<cffunction name="setMobileCarriers" access="public" returntype="void" output="No">
<cfargument name="mobileCarriers" required="Yes" type="any">
	
	<cfset variables["instance"]["mobileCarriers"]=arguments["mobileCarriers"]>
		
</cffunction>

<cffunction name="getBusinessName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['businessName']" default="">
	<cfreturn variables["instance"]["businessName"]>
	
</cffunction>

<cffunction name="setBusinessName" access="public" returntype="void" output="No">
<cfargument name="businessName" required="Yes" type="any">
	
	<cfset variables["instance"]["businessName"]=arguments["businessName"]>
		
</cffunction>

<cffunction name="getCountryCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['countryCode']" default="">
	<cfreturn variables["instance"]["countryCode"]>
	
</cffunction>

<cffunction name="setCountryCode" access="public" returntype="void" output="No">
<cfargument name="countryCode" required="Yes" type="any">
	
	<cfset variables["instance"]["countryCode"]=arguments["countryCode"]>
		
</cffunction>

<cffunction name="getPhoneNumber" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['phoneNumber']" default="">
	<cfreturn variables["instance"]["phoneNumber"]>
	
</cffunction>

<cffunction name="setPhoneNumber" access="public" returntype="void" output="No">
<cfargument name="phoneNumber" required="Yes" type="any">
	
	<cfset variables["instance"]["phoneNumber"]=arguments["phoneNumber"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
