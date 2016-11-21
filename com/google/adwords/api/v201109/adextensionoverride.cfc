<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdExtensionOverride" hint="Represents an ad level ad extension override. An ad extension override specifies the ad extension that must be used if the ad is served with any ad extension data." extends="utils">

<cfproperty name="adId" required="no" type="long" hint="ID of the ad being overridden by adExtension This field is required and should not be null." seq="1">
<cfproperty name="adExtension" required="no" type="AdExtension" hint="The override ad extension This field is required and should not be null." seq="2">
<cfproperty name="overrideInfo" required="no" type="OverrideInfo" hint="Additional extension override info to augment the ad extension override. If none is specified, default settings will be used." seq="3">
<cfproperty name="status" required="no" type="string" hint="Status of ad extension override at the ad level. The status will start ACTIVE on add and will become DELETED on remove (ie. cannot modify status) This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="approvalStatus" required="no" type="string" hint="Approval status This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">
<cfproperty name="stats" required="no" type="AdExtensionOverrideStats" hint="Stats for the ad extension override This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adId']" default="">
	<cfreturn variables["instance"]["adId"]>
	
</cffunction>

<cffunction name="setAdId" access="public" returntype="void" output="No">
<cfargument name="adId" required="Yes" type="any">
	
	<cfset variables["instance"]["adId"]=arguments["adId"]>
		
</cffunction>

<cffunction name="getAdExtension" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adExtension']" default="">
	<cfreturn variables["instance"]["adExtension"]>
	
</cffunction>

<cffunction name="setAdExtension" access="public" returntype="void" output="No">
<cfargument name="adExtension" required="Yes" type="any">
	
	<cfset variables["instance"]["adExtension"]=arguments["adExtension"]>
		
</cffunction>

<cffunction name="getOverrideInfo" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['overrideInfo']" default="">
	<cfreturn variables["instance"]["overrideInfo"]>
	
</cffunction>

<cffunction name="setOverrideInfo" access="public" returntype="void" output="No">
<cfargument name="overrideInfo" required="Yes" type="any">
	
	<cfset variables["instance"]["overrideInfo"]=arguments["overrideInfo"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getApprovalStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['approvalStatus']" default="">
	<cfreturn variables["instance"]["approvalStatus"]>
	
</cffunction>

<cffunction name="setApprovalStatus" access="public" returntype="void" output="No">
<cfargument name="approvalStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["approvalStatus"]=arguments["approvalStatus"]>
		
</cffunction>

<cffunction name="getStats" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['stats']" default="">
	<cfreturn variables["instance"]["stats"]>
	
</cffunction>

<cffunction name="setStats" access="public" returntype="void" output="No">
<cfargument name="stats" required="Yes" type="any">
	
	<cfset variables["instance"]["stats"]=arguments["stats"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
