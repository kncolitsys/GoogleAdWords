<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdFormatSpec" hint="A placement response object which provides information about one of the ad formats supported by a placement." extends="utils">

<cfproperty name="format" required="no" type="string" hint="The ad format specifier." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getFormat" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['format']" default="">
	<cfreturn variables["instance"]["format"]>
	
</cffunction>

<cffunction name="setFormat" access="public" returntype="void" output="No">
<cfargument name="format" required="Yes" type="any">
	
	<cfset variables["instance"]["format"]=arguments["format"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
