<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPMAdGroupCriterionBids" hint="Data representing a criterion-level CPM bid." extends="AdGroupCriterionBids">

<cfproperty name="maxCpm" required="no" type="Bid" hint="Bid placed for this criterion. To disable this criterion-level bid and use the ad group's bid, set this to 0. This field can be selected using the value 'MaxCpm'.This field can be filtered on." seq="2">
<cfproperty name="bidSource" required="no" type="string" hint="The level (ad group or criterion) at which this bid was set. This field can be selected using the value 'CpmBidSource'.This field can be filtered on." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupCriterionBidsType("ManualCPMAdGroupCriterionBids")>

<cffunction name="getMaxCpm" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxCpm']" default="">
	<cfreturn variables["instance"]["maxCpm"]>
	
</cffunction>

<cffunction name="setMaxCpm" access="public" returntype="void" output="No">
<cfargument name="maxCpm" required="Yes" type="any">
	
	<cfset variables["instance"]["maxCpm"]=arguments["maxCpm"]>
		
</cffunction>

<cffunction name="getBidSource" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bidSource']" default="">
	<cfreturn variables["instance"]["bidSource"]>
	
</cffunction>

<cffunction name="setBidSource" access="public" returntype="void" output="No">
<cfargument name="bidSource" required="Yes" type="any">
	
	<cfset variables["instance"]["bidSource"]=arguments["bidSource"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
