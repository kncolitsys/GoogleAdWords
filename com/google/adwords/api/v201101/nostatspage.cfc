<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="NoStatsPage" hint="Base class for Get results for a page of entities that do not use statistics." extends="Page">


<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setPageType("NoStatsPage")>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
