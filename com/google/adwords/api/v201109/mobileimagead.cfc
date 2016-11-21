<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MobileImageAd" hint="Represents a mobile image ad. For more information, see the mobile ads guidelines." extends="Ad">

<cfproperty name="markupLanguages" required="no" type="string[]" hint="The list of markup languages to use for the mobile ad. This field can be selected using the value 'MobileImageAdMarkupLanguages'." seq="8">
<cfproperty name="mobileCarriers" required="no" type="string[]" hint="The list of mobile carriers to use for the mobile ad. Each string must be of the form 'CarrierName@CountryCode'. To specify that all available carriers are to be used, use the reserved keyword 'ALLCARRIERS'. See available mobile carriers. This field can be selected using the value 'MobileImageAdMobileCarriers'. This field is required and should not be null." seq="9">
<cfproperty name="image" required="no" type="Image" hint="Image to be used in the mobile image ad." seq="10">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("MobileImageAd")>

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

<cffunction name="getImage" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['image']" default="">
	<cfreturn variables["instance"]["image"]>
	
</cffunction>

<cffunction name="setImage" access="public" returntype="void" output="No">
<cfargument name="image" required="Yes" type="any">
	
	<cfset variables["instance"]["image"]=arguments["image"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
