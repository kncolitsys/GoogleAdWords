<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="NetworkSetting" hint="Network settings for a Campaign." extends="utils">

<cfproperty name="targetGoogleSearch" required="no" type="boolean" hint="Ads will be served with Google.com search results. This field can be selected using the value 'TargetGoogleSearch'.This field can be filtered on." seq="1">
<cfproperty name="targetSearchNetwork" required="no" type="boolean" hint="Ads will be served on partner sites in the Google Search Network (requires GOOGLE_SEARCH). This field can be selected using the value 'TargetSearchNetwork'.This field can be filtered on." seq="2">
<cfproperty name="targetContentNetwork" required="no" type="boolean" hint="Ads will be served on specified placements in the Google Display Network. Placements are specified using Placement criteria. This field can be selected using the value 'TargetContentNetwork'.This field can be filtered on." seq="3">
<cfproperty name="targetContentContextual" required="no" type="boolean" hint="Ads will be served on the Google Display Network based on Keyword criteria contextually matching the placement's content (requires CONTENT_NETWORK). This field can be selected using the value 'TargetContentContextual'.This field can be filtered on." seq="4">
<cfproperty name="targetPartnerSearchNetwork" required="no" type="boolean" hint="Ads will be served on the Google Partner Network. This is available to only some specific Google partner accounts. This field can be selected using the value 'TargetPartnerSearchNetwork'.This field can be filtered on." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getTargetGoogleSearch" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targetGoogleSearch']" default="">
	<cfreturn variables["instance"]["targetGoogleSearch"]>
	
</cffunction>

<cffunction name="setTargetGoogleSearch" access="public" returntype="void" output="No">
<cfargument name="targetGoogleSearch" required="Yes" type="any">
	
	<cfset variables["instance"]["targetGoogleSearch"]=arguments["targetGoogleSearch"]>
		
</cffunction>

<cffunction name="getTargetSearchNetwork" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targetSearchNetwork']" default="">
	<cfreturn variables["instance"]["targetSearchNetwork"]>
	
</cffunction>

<cffunction name="setTargetSearchNetwork" access="public" returntype="void" output="No">
<cfargument name="targetSearchNetwork" required="Yes" type="any">
	
	<cfset variables["instance"]["targetSearchNetwork"]=arguments["targetSearchNetwork"]>
		
</cffunction>

<cffunction name="getTargetContentNetwork" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targetContentNetwork']" default="">
	<cfreturn variables["instance"]["targetContentNetwork"]>
	
</cffunction>

<cffunction name="setTargetContentNetwork" access="public" returntype="void" output="No">
<cfargument name="targetContentNetwork" required="Yes" type="any">
	
	<cfset variables["instance"]["targetContentNetwork"]=arguments["targetContentNetwork"]>
		
</cffunction>

<cffunction name="getTargetContentContextual" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targetContentContextual']" default="">
	<cfreturn variables["instance"]["targetContentContextual"]>
	
</cffunction>

<cffunction name="setTargetContentContextual" access="public" returntype="void" output="No">
<cfargument name="targetContentContextual" required="Yes" type="any">
	
	<cfset variables["instance"]["targetContentContextual"]=arguments["targetContentContextual"]>
		
</cffunction>

<cffunction name="getTargetPartnerSearchNetwork" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targetPartnerSearchNetwork']" default="">
	<cfreturn variables["instance"]["targetPartnerSearchNetwork"]>
	
</cffunction>

<cffunction name="setTargetPartnerSearchNetwork" access="public" returntype="void" output="No">
<cfargument name="targetPartnerSearchNetwork" required="Yes" type="any">
	
	<cfset variables["instance"]["targetPartnerSearchNetwork"]=arguments["targetPartnerSearchNetwork"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
