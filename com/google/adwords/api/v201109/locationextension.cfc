<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LocationExtension" hint="Location based ad extension." extends="AdExtension">

<cfproperty name="address" required="no" type="Address" hint="Address of the location (as is populated in GeoLocation by GeoLocationService). This field can be selected using the value 'Address'." seq="3">
<cfproperty name="geoPoint" required="no" type="GeoPoint" hint="The lat/long point of the location (as is populated in GeoLocation by GeoLocationService). This field can be selected using the value 'GeoPoint'." seq="4">
<cfproperty name="encodedLocation" required="no" type="base64Binary" hint="Byte data encoding address and geo point (as is populated in GeoLocation by GeoLocationService). Input only. Required on location extension creation. This field can be selected using the value 'EncodedLocation'." seq="5">
<cfproperty name="companyName" required="no" type="string" hint="The name of the company located at the given address This field can be selected using the value 'CompanyName'. The length of this string should be between 1 and 80, inclusive." seq="6">
<cfproperty name="phoneNumber" required="no" type="string" hint="The phone number for the location This field can be selected using the value 'PhoneNumber'." seq="7">
<cfproperty name="source" required="no" type="string" hint="The source which generated the extension This field can be selected using the value 'LocationExtensionSource'.This field can be filtered on." seq="8">
<cfproperty name="iconMediaId" required="no" type="long" hint="The business icon to use with the extension This field can be selected using the value 'IconMediaId'." seq="9">
<cfproperty name="imageMediaId" required="no" type="long" hint="The store front image to use with the extension This field can be selected using the value 'ImageMediaId'." seq="10">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdExtensionType("LocationExtension")>

<cffunction name="getAddress" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['address']" default="">
	<cfreturn variables["instance"]["address"]>
	
</cffunction>

<cffunction name="setAddress" access="public" returntype="void" output="No">
<cfargument name="address" required="Yes" type="any">
	
	<cfset variables["instance"]["address"]=arguments["address"]>
		
</cffunction>

<cffunction name="getGeoPoint" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['geoPoint']" default="">
	<cfreturn variables["instance"]["geoPoint"]>
	
</cffunction>

<cffunction name="setGeoPoint" access="public" returntype="void" output="No">
<cfargument name="geoPoint" required="Yes" type="any">
	
	<cfset variables["instance"]["geoPoint"]=arguments["geoPoint"]>
		
</cffunction>

<cffunction name="getEncodedLocation" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['encodedLocation']" default="">
	<cfreturn variables["instance"]["encodedLocation"]>
	
</cffunction>

<cffunction name="setEncodedLocation" access="public" returntype="void" output="No">
<cfargument name="encodedLocation" required="Yes" type="any">
	
	<cfset variables["instance"]["encodedLocation"]=arguments["encodedLocation"]>
		
</cffunction>

<cffunction name="getCompanyName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['companyName']" default="">
	<cfreturn variables["instance"]["companyName"]>
	
</cffunction>

<cffunction name="setCompanyName" access="public" returntype="void" output="No">
<cfargument name="companyName" required="Yes" type="any">
	
	<cfset variables["instance"]["companyName"]=arguments["companyName"]>
		
</cffunction>

<cffunction name="getPhoneNumber" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['phoneNumber']" default="">
	<cfreturn variables["instance"]["phoneNumber"]>
	
</cffunction>

<cffunction name="setPhoneNumber" access="public" returntype="void" output="No">
<cfargument name="phoneNumber" required="Yes" type="any">
	
	<cfset variables["instance"]["phoneNumber"]=arguments["phoneNumber"]>
		
</cffunction>

<cffunction name="getSource" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['source']" default="">
	<cfreturn variables["instance"]["source"]>
	
</cffunction>

<cffunction name="setSource" access="public" returntype="void" output="No">
<cfargument name="source" required="Yes" type="any">
	
	<cfset variables["instance"]["source"]=arguments["source"]>
		
</cffunction>

<cffunction name="getIconMediaId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['iconMediaId']" default="">
	<cfreturn variables["instance"]["iconMediaId"]>
	
</cffunction>

<cffunction name="setIconMediaId" access="public" returntype="void" output="No">
<cfargument name="iconMediaId" required="Yes" type="any">
	
	<cfset variables["instance"]["iconMediaId"]=arguments["iconMediaId"]>
		
</cffunction>

<cffunction name="getImageMediaId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['imageMediaId']" default="">
	<cfreturn variables["instance"]["imageMediaId"]>
	
</cffunction>

<cffunction name="setImageMediaId" access="public" returntype="void" output="No">
<cfargument name="imageMediaId" required="Yes" type="any">
	
	<cfset variables["instance"]["imageMediaId"]=arguments["imageMediaId"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
