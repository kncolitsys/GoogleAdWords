<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ProductExtension" hint="Metadata to be used for retrieving offers from Google Base." extends="AdExtension">

<cfproperty name="googleBaseCustomerId" required="no" type="int" hint="Google Base customer id This field can be selected using the value 'GoogleBaseCustomerId'. This field is required and should not be null." seq="3">
<cfproperty name="advertiserName" required="no" type="string" hint="Advertiser name This field can be selected using the value 'AdvertiserName'. This field is required and should not be null." seq="4">
<cfproperty name="productSelection" required="no" type="ProductConditionAndGroup[]" hint="List of ProductConditionAndGroups to OR together to determine if a product in the feed should be eligible to show. If this list is null/empty, there are no selection criteria to enforce on the feed (ie. all products in the feed are eligible). This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdExtensionType("ProductExtension")>

<cffunction name="getGoogleBaseCustomerId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['googleBaseCustomerId']" default="">
	<cfreturn variables["instance"]["googleBaseCustomerId"]>
	
</cffunction>

<cffunction name="setGoogleBaseCustomerId" access="public" returntype="void" output="No">
<cfargument name="googleBaseCustomerId" required="Yes" type="any">
	
	<cfset variables["instance"]["googleBaseCustomerId"]=arguments["googleBaseCustomerId"]>
		
</cffunction>

<cffunction name="getAdvertiserName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['advertiserName']" default="">
	<cfreturn variables["instance"]["advertiserName"]>
	
</cffunction>

<cffunction name="setAdvertiserName" access="public" returntype="void" output="No">
<cfargument name="advertiserName" required="Yes" type="any">
	
	<cfset variables["instance"]["advertiserName"]=arguments["advertiserName"]>
		
</cffunction>

<cffunction name="getProductSelection" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['productSelection']" default="">
	<cfreturn variables["instance"]["productSelection"]>
	
</cffunction>

<cffunction name="setProductSelection" access="public" returntype="void" output="No">
<cfargument name="productSelection" required="Yes" type="any">
	
	<cfset variables["instance"]["productSelection"]=arguments["productSelection"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
