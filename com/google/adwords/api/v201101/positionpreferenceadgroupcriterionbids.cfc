<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PositionPreferenceAdGroupCriterionBids" hint="AdGroupCriterion level bids used in manual cpc bidding strategy when position preference is turned on." extends="utils">

<cfproperty name="proxyMaxCpc" required="no" type="Bid" hint="The proxy bid placed for the position preference. This will always be less than or equal to maxCpc bid placed by the user in ManualCPCAdGroupCriterionBids This field can be selected using the value 'ProxyMaxCpc'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="preferredPosition" required="no" type="int" hint="The auction position in which the advertiser would prefer to see the keyword's creatives placed. This field can be selected using the value 'PreferredPosition'.This field can be filtered on." seq="2">
<cfproperty name="bottomPosition" required="no" type="int" hint="The lowest auction position in which the advertiser is willing to have the keywords's creatives placed This field can be selected using the value 'BottomPosition'.This field can be filtered on." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getProxyMaxCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['proxyMaxCpc']" default="">
	<cfreturn variables["instance"]["proxyMaxCpc"]>
	
</cffunction>

<cffunction name="setProxyMaxCpc" access="public" returntype="void" output="No">
<cfargument name="proxyMaxCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["proxyMaxCpc"]=arguments["proxyMaxCpc"]>
		
</cffunction>

<cffunction name="getPreferredPosition" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['preferredPosition']" default="">
	<cfreturn variables["instance"]["preferredPosition"]>
	
</cffunction>

<cffunction name="setPreferredPosition" access="public" returntype="void" output="No">
<cfargument name="preferredPosition" required="Yes" type="any">
	
	<cfset variables["instance"]["preferredPosition"]=arguments["preferredPosition"]>
		
</cffunction>

<cffunction name="getBottomPosition" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bottomPosition']" default="">
	<cfreturn variables["instance"]["bottomPosition"]>
	
</cffunction>

<cffunction name="setBottomPosition" access="public" returntype="void" output="No">
<cfargument name="bottomPosition" required="Yes" type="any">
	
	<cfset variables["instance"]["bottomPosition"]=arguments["bottomPosition"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
