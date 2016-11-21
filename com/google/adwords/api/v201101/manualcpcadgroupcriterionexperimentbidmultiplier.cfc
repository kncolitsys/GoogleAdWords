<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPCAdGroupCriterionExperimentBidMultiplier" hint="AdGroupCriterion level bid multiplier used in manual cpc bidding strategy" extends="AdGroupCriterionExperimentBidMultiplier">

<cfproperty name="maxCpcMultiplier" required="no" type="BidMultiplier" hint="This field can be selected using the value 'MaxCpcMultiplier'.This field can be filtered on." seq="2">
<cfproperty name="multiplierSource" required="no" type="string" hint="This field can be selected using the value 'MultiplierSource'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupCriterionExperimentBidMultiplierType("ManualCPCAdGroupCriterionExperimentBidMultiplier")>

<cffunction name="getMaxCpcMultiplier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxCpcMultiplier']" default="">
	<cfreturn variables["instance"]["maxCpcMultiplier"]>
	
</cffunction>

<cffunction name="setMaxCpcMultiplier" access="public" returntype="void" output="No">
<cfargument name="maxCpcMultiplier" required="Yes" type="any">
	
	<cfset variables["instance"]["maxCpcMultiplier"]=arguments["maxCpcMultiplier"]>
		
</cffunction>

<cffunction name="getMultiplierSource" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['multiplierSource']" default="">
	<cfreturn variables["instance"]["multiplierSource"]>
	
</cffunction>

<cffunction name="setMultiplierSource" access="public" returntype="void" output="No">
<cfargument name="multiplierSource" required="Yes" type="any">
	
	<cfset variables["instance"]["multiplierSource"]=arguments["multiplierSource"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
