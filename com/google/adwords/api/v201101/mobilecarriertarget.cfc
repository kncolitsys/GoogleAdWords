<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MobileCarrierTarget" hint="Represents a mobile carrier for a particular country. See available carriers for each country code." extends="MobileTarget">

<cfproperty name="carrierName" required="no" type="string" hint="This field is required and should not be null. This string must not be empty." seq="1">
<cfproperty name="countryCode" required="no" type="string" hint="This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("MobileTarget")>

<cffunction name="getCarrierName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['carrierName']" default="">
	<cfreturn variables["instance"]["carrierName"]>
	
</cffunction>

<cffunction name="setCarrierName" access="public" returntype="void" output="No">
<cfargument name="carrierName" required="Yes" type="any">
	
	<cfset variables["instance"]["carrierName"]=arguments["carrierName"]>
		
</cffunction>

<cffunction name="getCountryCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['countryCode']" default="">
	<cfreturn variables["instance"]["countryCode"]>
	
</cffunction>

<cffunction name="setCountryCode" access="public" returntype="void" output="No">
<cfargument name="countryCode" required="Yes" type="any">
	
	<cfset variables["instance"]["countryCode"]=arguments["countryCode"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
