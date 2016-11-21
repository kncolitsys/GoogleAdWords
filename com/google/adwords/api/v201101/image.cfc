<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Image" extends="Media">

<cfproperty name="data" required="no" type="base64Binary" hint="Raw image data." seq="12">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setMediaType("Image")>

<cffunction name="getData" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['data']" default="">
	<cfreturn variables["instance"]["data"]>
	
</cffunction>

<cffunction name="setData" access="public" returntype="void" output="No">
<cfargument name="data" required="Yes" type="any">
	
	<cfset variables["instance"]["data"]=arguments["data"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
