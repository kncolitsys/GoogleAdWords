<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Opportunity" extends="utils">

<cfproperty name="opportunityIdeas" required="no" type="OpportunityIdea[]" seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getOpportunityIdeas" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['opportunityIdeas']" default="">
	<cfreturn variables["instance"]["opportunityIdeas"]>
	
</cffunction>

<cffunction name="setOpportunityIdeas" access="public" returntype="void" output="No">
<cfargument name="opportunityIdeas" required="Yes" type="any">
	
	<cfset variables["instance"]["opportunityIdeas"]=arguments["opportunityIdeas"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
