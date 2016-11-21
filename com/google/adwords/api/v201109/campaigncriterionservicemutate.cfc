<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="campaigncriterionservicemutate" extends="utils">

<cfproperty name="operations" required="no" type="CampaignCriterionOperation[]" hint="This field must not contain null elements. This field must contain at least one element. This field is required and should not be null. The following Operators are supported: ADD, REMOVE." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getOperations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operations']" default="">
	<cfreturn variables["instance"]["operations"]>
	
</cffunction>

<cffunction name="setOperations" access="public" returntype="void" output="No">
<cfargument name="operations" required="Yes" type="any">
	
	<cfset variables["instance"]["operations"]=arguments["operations"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
