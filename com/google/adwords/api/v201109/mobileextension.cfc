<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MobileExtension" hint="Represents a phone extension. This type of ad extension attaches a phone number to a text ad, which lets customers call the advertiser directly from the ad. Phone extensions will appear as clickable phone numbers beneath the main text ad, and will be visible to high-end mobile device users who access Google.com search, Voice search, Google Mobile App, or Google Maps for Mobile from their phone. Learn more about phone extensions here ." extends="AdExtension">

<cfproperty name="phoneNumber" required="no" type="string" hint="Advertiser's phone number to append to the ad. This is typically the E.164 representation (e.g., '+16502530000'). This field can be selected using the value 'PhoneNumber'. This field is required and should not be null. The length of this string should be at least 3." seq="3">
<cfproperty name="countryCode" required="no" type="string" hint="Two-character country code (e.g. 'US') of the advertiser's phone number. The list of available country codes . This field can be selected using the value 'CountryCode'. This field is required and should not be null. The length of this string should be between 2 and 2, inclusive." seq="4">
<cfproperty name="isCallOnly" required="no" type="boolean" hint="Indicates whether the extended ad should be call only, where the phone number will be displayed and the URL will not. This affects search and display ads in high end mobile devices (e.g., iPhone and Android phones) This field can be selected using the value 'IsCallOnly'." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdExtensionType("MobileExtension")>

<cffunction name="getPhoneNumber" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['phoneNumber']" default="">
	<cfreturn variables["instance"]["phoneNumber"]>
	
</cffunction>

<cffunction name="setPhoneNumber" access="public" returntype="void" output="No">
<cfargument name="phoneNumber" required="Yes" type="any">
	
	<cfset variables["instance"]["phoneNumber"]=arguments["phoneNumber"]>
		
</cffunction>

<cffunction name="getCountryCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['countryCode']" default="">
	<cfreturn variables["instance"]["countryCode"]>
	
</cffunction>

<cffunction name="setCountryCode" access="public" returntype="void" output="No">
<cfargument name="countryCode" required="Yes" type="any">
	
	<cfset variables["instance"]["countryCode"]=arguments["countryCode"]>
		
</cffunction>

<cffunction name="getIsCallOnly" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isCallOnly']" default="">
	<cfreturn variables["instance"]["isCallOnly"]>
	
</cffunction>

<cffunction name="setIsCallOnly" access="public" returntype="void" output="No">
<cfargument name="isCallOnly" required="Yes" type="any">
	
	<cfset variables["instance"]["isCallOnly"]=arguments["isCallOnly"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
