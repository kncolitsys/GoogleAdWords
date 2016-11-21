<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdUnionId" hint="Represents an id indicating a grouping of Ads under some heuristic." extends="utils">

<cfproperty name="id" required="no" type="long" hint="The ID of the ad union This field must be greater than or equal to 1." seq="1">
<cfproperty name="AdUnionId_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of AdUnionId. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="2">

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

<cffunction name="getAdUnionIdType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['AdUnionId_Type']" default="">
	<cfreturn variables["instance"]["AdUnionId_Type"]>
	
</cffunction>

<cffunction name="setAdUnionIdType" access="public" returntype="void" output="No">
<cfargument name="AdUnionId_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["AdUnionId_Type"]=arguments["AdUnionId_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
