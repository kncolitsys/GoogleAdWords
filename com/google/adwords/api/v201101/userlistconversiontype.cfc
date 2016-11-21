<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="UserListConversionType" hint="Represents a conversion type used for building remarketing user lists." extends="utils">

<cfproperty name="id" required="no" type="long" hint="Conversion type id" seq="1">
<cfproperty name="name" required="no" type="string" hint="Name of this conversion type" seq="2">
<cfproperty name="category" required="no" type="string" hint="The category of the ConversionType based on the location where the conversion event was generated (from a user's perspective). This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getCategory" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['category']" default="">
	<cfreturn variables["instance"]["category"]>
	
</cffunction>

<cffunction name="setCategory" access="public" returntype="void" output="No">
<cfargument name="category" required="Yes" type="any">
	
	<cfset variables["instance"]["category"]=arguments["category"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
