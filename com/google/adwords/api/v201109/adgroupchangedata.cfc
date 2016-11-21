<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupChangeData" hint="Holds information about a changed adgroup" extends="utils">

<cfproperty name="adGroupId" required="no" type="long" hint="The adgroup Id." seq="1">
<cfproperty name="adGroupChangeStatus" required="no" type="string" hint="Whether or not the fields of this adgroup have changed, for example the AdGroup name. Changes to the Ads and Criteria are enumerated in their respective lists and will not be reflected in this status." seq="2">
<cfproperty name="changedAds" required="no" type="long[]" hint="The IDs of any changed ads of this adgroup. This includes ads that have been deleted." seq="3">
<cfproperty name="changedCriteria" required="no" type="long[]" hint="The IDs of any changed criterion of this adgroup." seq="4">
<cfproperty name="deletedCriteria" required="no" type="long[]" hint="The IDs of any deleted criterion of this adgroup." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupId']" default="">
	<cfreturn variables["instance"]["adGroupId"]>
	
</cffunction>

<cffunction name="setAdGroupId" access="public" returntype="void" output="No">
<cfargument name="adGroupId" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupId"]=arguments["adGroupId"]>
		
</cffunction>

<cffunction name="getAdGroupChangeStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupChangeStatus']" default="">
	<cfreturn variables["instance"]["adGroupChangeStatus"]>
	
</cffunction>

<cffunction name="setAdGroupChangeStatus" access="public" returntype="void" output="No">
<cfargument name="adGroupChangeStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupChangeStatus"]=arguments["adGroupChangeStatus"]>
		
</cffunction>

<cffunction name="getChangedAds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['changedAds']" default="">
	<cfreturn variables["instance"]["changedAds"]>
	
</cffunction>

<cffunction name="setChangedAds" access="public" returntype="void" output="No">
<cfargument name="changedAds" required="Yes" type="any">
	
	<cfset variables["instance"]["changedAds"]=arguments["changedAds"]>
		
</cffunction>

<cffunction name="getChangedCriteria" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['changedCriteria']" default="">
	<cfreturn variables["instance"]["changedCriteria"]>
	
</cffunction>

<cffunction name="setChangedCriteria" access="public" returntype="void" output="No">
<cfargument name="changedCriteria" required="Yes" type="any">
	
	<cfset variables["instance"]["changedCriteria"]=arguments["changedCriteria"]>
		
</cffunction>

<cffunction name="getDeletedCriteria" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['deletedCriteria']" default="">
	<cfreturn variables["instance"]["deletedCriteria"]>
	
</cffunction>

<cffunction name="setDeletedCriteria" access="public" returntype="void" output="No">
<cfargument name="deletedCriteria" required="Yes" type="any">
	
	<cfset variables["instance"]["deletedCriteria"]=arguments["deletedCriteria"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/ch/v201109">
	
</cffunction>	

</cfcomponent>
