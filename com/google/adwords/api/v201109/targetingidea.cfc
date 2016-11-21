<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TargetingIdea" hint="Represents a TargetingIdea returned by search criteria specified in the TargetingIdeaSelector. Targeting ideas are keywords or placements that are similar to those the user inputs." extends="utils">

<cfproperty name="data" required="no" type="Type_AttributeMapEntry[]" hint="Map of com.google.ads.api.services.targetingideas.external.AttributeType to Attribute. Stores all data retrieved for each key AttributeType. This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getData" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['data']" default="">
	<cfreturn variables["instance"]["data"]>
	
</cffunction>

<cffunction name="setData" access="public" returntype="void" output="No">
<cfargument name="data" required="Yes" type="any">
	
	<cfset variables["instance"]["data"]=arguments["data"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
