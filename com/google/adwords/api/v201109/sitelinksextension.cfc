<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="SitelinksExtension" hint="Class to represent a set of sitelinks and their order of preference." extends="AdExtension">

<cfproperty name="sitelinks" required="no" type="Sitelink[]" hint="This field must contain at least one element. This field is required and should not be null." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdExtensionType("SitelinksExtension")>

<cffunction name="getSitelinks" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sitelinks']" default="">
	<cfreturn variables["instance"]["sitelinks"]>
	
</cffunction>

<cffunction name="setSitelinks" access="public" returntype="void" output="No">
<cfargument name="sitelinks" required="Yes" type="any">
	
	<cfset variables["instance"]["sitelinks"]=arguments["sitelinks"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
