<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdExtensionOverrideStats" hint="Represents stats specific to AdExtensionOverrides." extends="Stats">


<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setStatsType("AdExtensionOverrideStats")>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
