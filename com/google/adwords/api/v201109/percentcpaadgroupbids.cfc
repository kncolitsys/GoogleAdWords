<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PercentCPAAdGroupBids" hint="AdGroup level bids used in percent CPA bidding strategy. PercentCPA bidding strategy and bids are available only to some advertisers." extends="AdGroupBids">

<cfproperty name="percentCpa" required="no" type="int" hint="Percent CPA set for this ad group, used for calculating the bid value. This field can be selected using the value 'PercentCpa'.This field can be filtered on." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupBidsType("PercentCPAAdGroupBids")>

<cffunction name="getPercentCpa" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['percentCpa']" default="">
	<cfreturn variables["instance"]["percentCpa"]>
	
</cffunction>

<cffunction name="setPercentCpa" access="public" returntype="void" output="No">
<cfargument name="percentCpa" required="Yes" type="any">
	
	<cfset variables["instance"]["percentCpa"]=arguments["percentCpa"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
