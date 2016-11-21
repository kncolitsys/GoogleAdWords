<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MobilePlatformTarget" hint="Represents a mobile operating system platform. See available platforms." extends="MobileTarget">

<cfproperty name="platformName" required="no" type="string" hint="Language code. This field is required and should not be null. This string must not be empty." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("MobileTarget")>

<cffunction name="getPlatformName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['platformName']" default="">
	<cfreturn variables["instance"]["platformName"]>
	
</cffunction>

<cffunction name="setPlatformName" access="public" returntype="void" output="No">
<cfargument name="platformName" required="Yes" type="any">
	
	<cfset variables["instance"]["platformName"]=arguments["platformName"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
