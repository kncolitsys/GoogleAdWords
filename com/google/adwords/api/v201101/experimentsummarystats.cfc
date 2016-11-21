<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ExperimentSummaryStats" hint="Contains how many changes were made associated with an experiment at the adgroup, critieria and creative levels" extends="utils">

<cfproperty name="adGroupsCount" required="no" type="int" hint="Number of adgroups changed in this experiment This field can be selected using the value 'AdGroupsCount'." seq="1">
<cfproperty name="adGroupCriteriaCount" required="no" type="int" hint="Number of criteria changed in this experiment This field can be selected using the value 'AdGroupCriteriaCount'." seq="2">
<cfproperty name="adGroupAdsCount" required="no" type="int" hint="Number of creatives changed in this experiment This field can be selected using the value 'AdGroupAdsCount'." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupsCount" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupsCount']" default="">
	<cfreturn variables["instance"]["adGroupsCount"]>
	
</cffunction>

<cffunction name="setAdGroupsCount" access="public" returntype="void" output="No">
<cfargument name="adGroupsCount" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupsCount"]=arguments["adGroupsCount"]>
		
</cffunction>

<cffunction name="getAdGroupCriteriaCount" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupCriteriaCount']" default="">
	<cfreturn variables["instance"]["adGroupCriteriaCount"]>
	
</cffunction>

<cffunction name="setAdGroupCriteriaCount" access="public" returntype="void" output="No">
<cfargument name="adGroupCriteriaCount" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupCriteriaCount"]=arguments["adGroupCriteriaCount"]>
		
</cffunction>

<cffunction name="getAdGroupAdsCount" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupAdsCount']" default="">
	<cfreturn variables["instance"]["adGroupAdsCount"]>
	
</cffunction>

<cffunction name="setAdGroupAdsCount" access="public" returntype="void" output="No">
<cfargument name="adGroupAdsCount" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupAdsCount"]=arguments["adGroupAdsCount"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
