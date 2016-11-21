<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ManualCPC" hint="Manual click based bidding where user pays per click." extends="BiddingStrategy">

<cfproperty name="enhancedCpcEnabled" required="no" type="boolean" hint="The enhanced CPC bidding option for the campaign, which enables bids to be enhanced based on conversion optimizer data This field can be selected using the value 'EnhancedCpcEnabled'.This field can be filtered on." seq="2">
<cfproperty name="positionPreference" required="no" type="string" hint="Position preference settings for the Campaign, if turned on allows the advertiser to specify preferred auction position in which the advertiser would prefer to see the keyword's ads placed. This field can be selected using the value 'PositionPreference'." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setBiddingStrategyType("ManualCPC")>

<cffunction name="getEnhancedCpcEnabled" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enhancedCpcEnabled']" default="">
	<cfreturn variables["instance"]["enhancedCpcEnabled"]>
	
</cffunction>

<cffunction name="setEnhancedCpcEnabled" access="public" returntype="void" output="No">
<cfargument name="enhancedCpcEnabled" required="Yes" type="any">
	
	<cfset variables["instance"]["enhancedCpcEnabled"]=arguments["enhancedCpcEnabled"]>
		
</cffunction>

<cffunction name="getPositionPreference" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['positionPreference']" default="">
	<cfreturn variables["instance"]["positionPreference"]>
	
</cffunction>

<cffunction name="setPositionPreference" access="public" returntype="void" output="No">
<cfargument name="positionPreference" required="Yes" type="any">
	
	<cfset variables["instance"]["positionPreference"]=arguments["positionPreference"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
