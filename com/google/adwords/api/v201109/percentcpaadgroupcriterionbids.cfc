<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PercentCPAAdGroupCriterionBids" hint="Criterion-level Percent cost-per-conversion(acquisition) bid for Product criteria type. PercentCPA bidding strategy and bids are available only to some advertisers." extends="AdGroupCriterionBids">

<cfproperty name="percentCpa" required="no" type="int" hint="Percent CPA set for this criterion, used for calculating the bid value. To disable this criterion-level parameter and use the ad group's percentCPA, set this to 0. This field can be selected using the value 'PercentCpa'.This field can be filtered on. This field must be greater than or equal to 0." seq="2">
<cfproperty name="source" required="no" type="string" hint="The level (ad group or criterion) at which this parameter was set. This field can be selected using the value 'PercentCpaBidSource'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupCriterionBidsType("PercentCPAAdGroupCriterionBids")>

<cffunction name="getPercentCpa" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['percentCpa']" default="">
	<cfreturn variables["instance"]["percentCpa"]>
	
</cffunction>

<cffunction name="setPercentCpa" access="public" returntype="void" output="No">
<cfargument name="percentCpa" required="Yes" type="any">
	
	<cfset variables["instance"]["percentCpa"]=arguments["percentCpa"]>
		
</cffunction>

<cffunction name="getSource" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['source']" default="">
	<cfreturn variables["instance"]["source"]>
	
</cffunction>

<cffunction name="setSource" access="public" returntype="void" output="No">
<cfargument name="source" required="Yes" type="any">
	
	<cfset variables["instance"]["source"]=arguments["source"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
