<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CriterionBidLandscape" hint="The bid landscape for a criterion. A bid landscape estimates how a a criterion will perform based on different bid amounts." extends="BidLandscape">

<cfproperty name="criterionId" required="no" type="long" hint="ID of the criterion associated with this landscape. This field can be selected using the value 'CriterionId'.This field can be filtered on." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setDataEntryType("BidLandscape")>

<cffunction name="getCriterionId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criterionId']" default="">
	<cfreturn variables["instance"]["criterionId"]>
	
</cffunction>

<cffunction name="setCriterionId" access="public" returntype="void" output="No">
<cfargument name="criterionId" required="Yes" type="any">
	
	<cfset variables["instance"]["criterionId"]=arguments["criterionId"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
