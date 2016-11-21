<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="RichMediaAd" hint="Data associated with a rich media ad." extends="Ad">

<cfproperty name="name" required="no" type="string" hint="Name of the rich media ad. This field can be selected using the value 'RichMediaAdName'. This field is required and should not be null." seq="8">
<cfproperty name="dimensions" required="no" type="Dimensions" hint="Dimensions (height and width) of the ad. It's required for standard third party ads." seq="9">
<cfproperty name="snippet" required="no" type="string" hint="Snippet for this ad. It's required for standard third party ads. This field can be selected using the value 'RichMediaAdSnippet'." seq="10">
<cfproperty name="impressionBeaconUrl" required="no" type="string" hint="Impression beacon URL for the ad. This field can be selected using the value 'RichMediaAdImpressionBeaconUrl'." seq="11">
<cfproperty name="certifiedVendorFormatId" required="no" type="long" hint="Certified Vendor Format ID. This field can be selected using the value 'RichMediaAdCertifiedVendorFormatId'. This field is required and should not be null." seq="12">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("RichMediaAd")>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getDimensions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dimensions']" default="">
	<cfreturn variables["instance"]["dimensions"]>
	
</cffunction>

<cffunction name="setDimensions" access="public" returntype="void" output="No">
<cfargument name="dimensions" required="Yes" type="any">
	
	<cfset variables["instance"]["dimensions"]=arguments["dimensions"]>
		
</cffunction>

<cffunction name="getSnippet" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['snippet']" default="">
	<cfreturn variables["instance"]["snippet"]>
	
</cffunction>

<cffunction name="setSnippet" access="public" returntype="void" output="No">
<cfargument name="snippet" required="Yes" type="any">
	
	<cfset variables["instance"]["snippet"]=arguments["snippet"]>
		
</cffunction>

<cffunction name="getImpressionBeaconUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['impressionBeaconUrl']" default="">
	<cfreturn variables["instance"]["impressionBeaconUrl"]>
	
</cffunction>

<cffunction name="setImpressionBeaconUrl" access="public" returntype="void" output="No">
<cfargument name="impressionBeaconUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["impressionBeaconUrl"]=arguments["impressionBeaconUrl"]>
		
</cffunction>

<cffunction name="getCertifiedVendorFormatId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['certifiedVendorFormatId']" default="">
	<cfreturn variables["instance"]["certifiedVendorFormatId"]>
	
</cffunction>

<cffunction name="setCertifiedVendorFormatId" access="public" returntype="void" output="No">
<cfargument name="certifiedVendorFormatId" required="Yes" type="any">
	
	<cfset variables["instance"]["certifiedVendorFormatId"]=arguments["certifiedVendorFormatId"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
