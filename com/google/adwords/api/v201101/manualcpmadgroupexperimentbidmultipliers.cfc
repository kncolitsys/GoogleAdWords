<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPMAdGroupExperimentBidMultipliers" hint="Adgroup level bid multipliers used in manual CPM bidding strategy." extends="AdGroupExperimentBidMultipliers">

<cfproperty name="maxCpmMultiplier" required="no" type="BidMultiplier" hint="This field can be selected using the value 'MaxCpmMultiplier'.This field can be filtered on." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupExperimentBidMultipliersType("ManualCPMAdGroupExperimentBidMultipliers")>

<cffunction name="getMaxCpmMultiplier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxCpmMultiplier']" default="">
	<cfreturn variables["instance"]["maxCpmMultiplier"]>
	
</cffunction>

<cffunction name="setMaxCpmMultiplier" access="public" returntype="void" output="No">
<cfargument name="maxCpmMultiplier" required="Yes" type="any">
	
	<cfset variables["instance"]["maxCpmMultiplier"]=arguments["maxCpmMultiplier"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
