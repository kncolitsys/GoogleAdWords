<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TextAd" hint="Represents a TextAd." extends="Ad">

<cfproperty name="headline" required="no" type="string" hint="The headline of the ad This field can be selected using the value 'Headline'.This field can be filtered on." seq="8">
<cfproperty name="description1" required="no" type="string" hint="The first description line This field can be selected using the value 'Description1'.This field can be filtered on." seq="9">
<cfproperty name="description2" required="no" type="string" hint="The second description line This field can be selected using the value 'Description2'.This field can be filtered on." seq="10">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("TextAd")>

<cffunction name="getHeadline" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['headline']" default="">
	<cfreturn variables["instance"]["headline"]>
	
</cffunction>

<cffunction name="setHeadline" access="public" returntype="void" output="No">
<cfargument name="headline" required="Yes" type="any">
	
	<cfset variables["instance"]["headline"]=arguments["headline"]>
		
</cffunction>

<cffunction name="getDescription1" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['description1']" default="">
	<cfreturn variables["instance"]["description1"]>
	
</cffunction>

<cffunction name="setDescription1" access="public" returntype="void" output="No">
<cfargument name="description1" required="Yes" type="any">
	
	<cfset variables["instance"]["description1"]=arguments["description1"]>
		
</cffunction>

<cffunction name="getDescription2" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['description2']" default="">
	<cfreturn variables["instance"]["description2"]>
	
</cffunction>

<cffunction name="setDescription2" access="public" returntype="void" output="No">
<cfargument name="description2" required="Yes" type="any">
	
	<cfset variables["instance"]["description2"]=arguments["description2"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
