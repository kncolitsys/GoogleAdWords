<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BidLandscape.LandscapePoint" hint="A set of estimates for a criterion's performance for a specific bid amount." extends="utils">

<cfproperty name="bid" required="no" type="Money" hint="The bid amount used to estimate this landscape point's data. This field can be selected using the value 'Bid'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="clicks" required="no" type="long" hint="Estimated number of clicks at this bid. This field can be selected using the value 'LocalClicks'.This field can be filtered on." seq="2">
<cfproperty name="cost" required="no" type="Money" hint="Estimated cost at this bid. This field can be selected using the value 'LocalCost'.This field can be filtered on." seq="3">
<cfproperty name="marginalCpc" required="no" type="Money" hint="Estimated marginal cost per click. This field can be selected using the value 'MarginalCpc'.This field can be filtered on." seq="4">
<cfproperty name="impressions" required="no" type="long" hint="Estimated number of impressions at this bid. This field can be selected using the value 'LocalImpressions'.This field can be filtered on." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getBid" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bid']" default="">
	<cfreturn variables["instance"]["bid"]>
	
</cffunction>

<cffunction name="setBid" access="public" returntype="void" output="No">
<cfargument name="bid" required="Yes" type="any">
	
	<cfset variables["instance"]["bid"]=arguments["bid"]>
		
</cffunction>

<cffunction name="getClicks" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clicks']" default="">
	<cfreturn variables["instance"]["clicks"]>
	
</cffunction>

<cffunction name="setClicks" access="public" returntype="void" output="No">
<cfargument name="clicks" required="Yes" type="any">
	
	<cfset variables["instance"]["clicks"]=arguments["clicks"]>
		
</cffunction>

<cffunction name="getCost" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['cost']" default="">
	<cfreturn variables["instance"]["cost"]>
	
</cffunction>

<cffunction name="setCost" access="public" returntype="void" output="No">
<cfargument name="cost" required="Yes" type="any">
	
	<cfset variables["instance"]["cost"]=arguments["cost"]>
		
</cffunction>

<cffunction name="getMarginalCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['marginalCpc']" default="">
	<cfreturn variables["instance"]["marginalCpc"]>
	
</cffunction>

<cffunction name="setMarginalCpc" access="public" returntype="void" output="No">
<cfargument name="marginalCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["marginalCpc"]=arguments["marginalCpc"]>
		
</cffunction>

<cffunction name="getImpressions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['impressions']" default="">
	<cfreturn variables["instance"]["impressions"]>
	
</cffunction>

<cffunction name="setImpressions" access="public" returntype="void" output="No">
<cfargument name="impressions" required="Yes" type="any">
	
	<cfset variables["instance"]["impressions"]=arguments["impressions"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
