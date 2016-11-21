<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="UserInterest" hint="Represents a particular interest based vertical to be targeted. User interest may be used for defining logical user lists." extends="utils">

<cfproperty name="id" required="no" type="long" hint="Id of this user interest. This field is required and should not be null when it is contained within Operators : SET." seq="1">
<cfproperty name="name" required="no" type="string" hint="The name of this user interest." seq="2">
<cfproperty name="sizeRange" required="no" type="string" hint="Size range in terms of number of users of the user interest." seq="3">

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

<cffunction name="getSizeRange" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sizeRange']" default="">
	<cfreturn variables["instance"]["sizeRange"]>
	
</cffunction>

<cffunction name="setSizeRange" access="public" returntype="void" output="No">
<cfargument name="sizeRange" required="Yes" type="any">
	
	<cfset variables["instance"]["sizeRange"]=arguments["sizeRange"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
