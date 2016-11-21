<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPMAdGroupBids" hint="Adgroup level bids used in manual CPM bidding strategy." extends="AdGroupBids">

<cfproperty name="maxCpm" required="no" type="Bid" hint="Max CPM (cost per thousand impressions) bid. This field can be selected using the value 'MaxCpm'.This field can be filtered on." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupBidsType("ManualCPMAdGroupBids")>

<cffunction name="getMaxCpm" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxCpm']" default="">
	<cfreturn variables["instance"]["maxCpm"]>
	
</cffunction>

<cffunction name="setMaxCpm" access="public" returntype="void" output="No">
<cfargument name="maxCpm" required="Yes" type="any">
	
	<cfset variables["instance"]["maxCpm"]=arguments["maxCpm"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
