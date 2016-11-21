<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignCriterionLimitExceeded" hint="Error to indicate that too many negative criteria added to some campaign." extends="EntityCountLimitExceeded">

<cfproperty name="limitType" required="no" type="string" seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setApiErrorType("EntityCountLimitExceeded")>

<cffunction name="getLimitType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['limitType']" default="">
	<cfreturn variables["instance"]["limitType"]>
	
</cffunction>

<cffunction name="setLimitType" access="public" returntype="void" output="No">
<cfargument name="limitType" required="Yes" type="any">
	
	<cfset variables["instance"]["limitType"]=arguments["limitType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
