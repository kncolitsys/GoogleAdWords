<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPCAdGroupExperimentBidMultipliers" hint="Adgroup level bid multipliers used in manual CPC bidding strategy." extends="AdGroupExperimentBidMultipliers">

<cfproperty name="maxCpcMultiplier" required="no" type="BidMultiplier" hint="This field can be selected using the value 'MaxCpcMultiplier'.This field can be filtered on." seq="2">
<cfproperty name="maxContentCpcMultiplier" required="no" type="BidMultiplier" hint="This field can be selected using the value 'MaxContentCpcMultiplier'.This field can be filtered on." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupExperimentBidMultipliersType("ManualCPCAdGroupExperimentBidMultipliers")>

<cffunction name="getMaxCpcMultiplier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxCpcMultiplier']" default="">
	<cfreturn variables["instance"]["maxCpcMultiplier"]>
	
</cffunction>

<cffunction name="setMaxCpcMultiplier" access="public" returntype="void" output="No">
<cfargument name="maxCpcMultiplier" required="Yes" type="any">
	
	<cfset variables["instance"]["maxCpcMultiplier"]=arguments["maxCpcMultiplier"]>
		
</cffunction>

<cffunction name="getMaxContentCpcMultiplier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxContentCpcMultiplier']" default="">
	<cfreturn variables["instance"]["maxContentCpcMultiplier"]>
	
</cffunction>

<cffunction name="setMaxContentCpcMultiplier" access="public" returntype="void" output="No">
<cfargument name="maxContentCpcMultiplier" required="Yes" type="any">
	
	<cfset variables["instance"]["maxContentCpcMultiplier"]=arguments["maxContentCpcMultiplier"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
