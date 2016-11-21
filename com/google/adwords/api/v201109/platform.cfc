<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Platform" hint="Represents Platform criterion. A criterion of this type can only be created using an ID. A criterion of this type is only targetable." extends="Criterion">

<cfproperty name="platformName" required="no" type="string" hint="This field can be selected using the value 'PlatformName'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Platform")>

<cffunction name="getPlatformName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['platformName']" default="">
	<cfreturn variables["instance"]["platformName"]>
	
</cffunction>

<cffunction name="setPlatformName" access="public" returntype="void" output="No">
<cfargument name="platformName" required="Yes" type="any">
	
	<cfset variables["instance"]["platformName"]=arguments["platformName"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
