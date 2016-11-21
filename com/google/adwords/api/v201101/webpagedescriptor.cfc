<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="WebpageDescriptor" hint="Basic information about a webpage." extends="utils">

<cfproperty name="url" required="no" type="string" hint="The URL of the webpage." seq="1">
<cfproperty name="title" required="no" type="string" hint="The title of the webpage." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['url']" default="">
	<cfreturn variables["instance"]["url"]>
	
</cffunction>

<cffunction name="setUrl" access="public" returntype="void" output="No">
<cfargument name="url" required="Yes" type="any">
	
	<cfset variables["instance"]["url"]=arguments["url"]>
		
</cffunction>

<cffunction name="getTitle" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['title']" default="">
	<cfreturn variables["instance"]["title"]>
	
</cffunction>

<cffunction name="setTitle" access="public" returntype="void" output="No">
<cfargument name="title" required="Yes" type="any">
	
	<cfset variables["instance"]["title"]=arguments["title"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
