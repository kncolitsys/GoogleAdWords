<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BiddableAdGroupCriterionExperimentData" hint="Data associated with an advertiser experiment for this BiddableAdGroupCriterion." extends="utils">

<cfproperty name="experimentId" required="no" type="long" hint="This field can be selected using the value 'ExperimentId'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="experimentDeltaStatus" required="no" type="string" hint="Status of this adgroup in the experiment. It must be specified while adding experiment data, which could come as a SET as well This field can be selected using the value 'ExperimentDeltaStatus'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : ADD." seq="2">
<cfproperty name="experimentDataStatus" required="no" type="string" hint="Status of the experiment row This field can be selected using the value 'ExperimentRowStatus'. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="experimentBidMultiplier" required="no" type="AdGroupCriterionExperimentBidMultiplier" hint="Bid multipliers, if any This field can be selected using the value 'ExperimentBidMultiplier'.This field can be filtered on." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getExperimentId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentId']" default="">
	<cfreturn variables["instance"]["experimentId"]>
	
</cffunction>

<cffunction name="setExperimentId" access="public" returntype="void" output="No">
<cfargument name="experimentId" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentId"]=arguments["experimentId"]>
		
</cffunction>

<cffunction name="getExperimentDeltaStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentDeltaStatus']" default="">
	<cfreturn variables["instance"]["experimentDeltaStatus"]>
	
</cffunction>

<cffunction name="setExperimentDeltaStatus" access="public" returntype="void" output="No">
<cfargument name="experimentDeltaStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentDeltaStatus"]=arguments["experimentDeltaStatus"]>
		
</cffunction>

<cffunction name="getExperimentDataStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentDataStatus']" default="">
	<cfreturn variables["instance"]["experimentDataStatus"]>
	
</cffunction>

<cffunction name="setExperimentDataStatus" access="public" returntype="void" output="No">
<cfargument name="experimentDataStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentDataStatus"]=arguments["experimentDataStatus"]>
		
</cffunction>

<cffunction name="getExperimentBidMultiplier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentBidMultiplier']" default="">
	<cfreturn variables["instance"]["experimentBidMultiplier"]>
	
</cffunction>

<cffunction name="setExperimentBidMultiplier" access="public" returntype="void" output="No">
<cfargument name="experimentBidMultiplier" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentBidMultiplier"]=arguments["experimentBidMultiplier"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
