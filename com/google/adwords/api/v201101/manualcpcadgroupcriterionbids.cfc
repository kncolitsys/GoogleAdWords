<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPCAdGroupCriterionBids" hint="Data representing a criterion level cost-per-click bid." extends="AdGroupCriterionBids">

<cfproperty name="maxCpc" required="no" type="Bid" hint="Bid placed for this criterion. If position preference is enabled, this value is used as the maximum proxy bid for the criterion. To disable this criterion-level bid and use the ad group's bid, set this to 0. This field can be selected using the value 'MaxCpc'.This field can be filtered on." seq="2">
<cfproperty name="bidSource" required="no" type="string" hint="The level (ad group or criterion) at which this bid was set. This field can be selected using the value 'CpcBidSource'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="positionPreferenceBids" required="no" type="PositionPreferenceAdGroupCriterionBids" hint="Position preference and the proxy criterion bid placed for the position preference." seq="4">
<cfproperty name="enhancedCpcEnabled" required="no" type="boolean" hint="If true, enhanced CPC bidding is enabled and criteria bids may be enhanced based on conversion optimizer data. This field can be selected using the value 'EnhancedCpcEnabled'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupCriterionBidsType("ManualCPCAdGroupCriterionBids")>

<cffunction name="getMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxCpc']" default="">
	<cfreturn variables["instance"]["maxCpc"]>
	
</cffunction>

<cffunction name="setMaxCpc" access="public" returntype="void" output="No">
<cfargument name="maxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["maxCpc"]=arguments["maxCpc"]>
		
</cffunction>

<cffunction name="getBidSource" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bidSource']" default="">
	<cfreturn variables["instance"]["bidSource"]>
	
</cffunction>

<cffunction name="setBidSource" access="public" returntype="void" output="No">
<cfargument name="bidSource" required="Yes" type="any">
	
	<cfset variables["instance"]["bidSource"]=arguments["bidSource"]>
		
</cffunction>

<cffunction name="getPositionPreferenceBids" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['positionPreferenceBids']" default="">
	<cfreturn variables["instance"]["positionPreferenceBids"]>
	
</cffunction>

<cffunction name="setPositionPreferenceBids" access="public" returntype="void" output="No">
<cfargument name="positionPreferenceBids" required="Yes" type="any">
	
	<cfset variables["instance"]["positionPreferenceBids"]=arguments["positionPreferenceBids"]>
		
</cffunction>

<cffunction name="getEnhancedCpcEnabled" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enhancedCpcEnabled']" default="">
	<cfreturn variables["instance"]["enhancedCpcEnabled"]>
	
</cffunction>

<cffunction name="setEnhancedCpcEnabled" access="public" returntype="void" output="No">
<cfargument name="enhancedCpcEnabled" required="Yes" type="any">
	
	<cfset variables["instance"]["enhancedCpcEnabled"]=arguments["enhancedCpcEnabled"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
