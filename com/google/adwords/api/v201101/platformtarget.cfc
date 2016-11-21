<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PlatformTarget" hint="A platform target is used to discriminate among the potential devices from which the users access the web (ie, desktops vs. mobile devices)." extends="Target">

<cfproperty name="platformType" required="no" type="string" hint="Type of device platform to be targeted This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("PlatformTarget")>

<cffunction name="getPlatformType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['platformType']" default="">
	<cfreturn variables["instance"]["platformType"]>
	
</cffunction>

<cffunction name="setPlatformType" access="public" returntype="void" output="No">
<cfargument name="platformType" required="Yes" type="any">
	
	<cfset variables["instance"]["platformType"]=arguments["platformType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
