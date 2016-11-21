<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="mediaserviceupload" extends="utils">

<cfproperty name="media" required="no" type="Media[]" seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getMedia" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['media']" default="">
	<cfreturn variables["instance"]["media"]>
	
</cffunction>

<cffunction name="setMedia" access="public" returntype="void" output="No">
<cfargument name="media" required="Yes" type="any">
	
	<cfset variables["instance"]["media"]=arguments["media"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
