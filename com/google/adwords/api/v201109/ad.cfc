<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Ad" hint="The base class of all ad types. To update basic ad fields, you can construct an Ad object (instead of the ad's concrete type) with the appropriate fields set." extends="utils">

<cfproperty name="id" required="no" type="long" hint="ID of this ad. This field is ignored when creating ads using AdGroupAdService. This field can be selected using the value 'Id'.This field can be filtered on." seq="1">
<cfproperty name="url" required="no" type="string" hint="Destination URL. This field can be selected using the value 'Url'.This field can be filtered on." seq="2">
<cfproperty name="displayUrl" required="no" type="string" hint="Visible URL. This field can be selected using the value 'DisplayUrl'.This field can be filtered on." seq="3">
<cfproperty name="approvalStatus" required="no" type="string" hint="Approval status. This field can be selected using the value 'CreativeApprovalStatus'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="disapprovalReasons" required="no" type="string[]" hint="List of disapproval reasons. This field can be selected using the value 'DisapprovalReasons'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">
<cfproperty name="trademarkDisapproved" required="no" type="boolean" hint="True if and only if this ad is not serving because it does not meet trademark policy. This field is only useful when approvalStatus is an approved status. This field can be selected using the value 'TrademarkDisapproved'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="6">
<cfproperty name="Ad_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201109'" hint="Indicates that this instance is a subtype of Ad. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['url']" default="">
	<cfreturn variables["instance"]["url"]>
	
</cffunction>

<cffunction name="setUrl" access="public" returntype="void" output="No">
<cfargument name="url" required="Yes" type="any">
	
	<cfset variables["instance"]["url"]=arguments["url"]>
		
</cffunction>

<cffunction name="getDisplayUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['displayUrl']" default="">
	<cfreturn variables["instance"]["displayUrl"]>
	
</cffunction>

<cffunction name="setDisplayUrl" access="public" returntype="void" output="No">
<cfargument name="displayUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["displayUrl"]=arguments["displayUrl"]>
		
</cffunction>

<cffunction name="getApprovalStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['approvalStatus']" default="">
	<cfreturn variables["instance"]["approvalStatus"]>
	
</cffunction>

<cffunction name="setApprovalStatus" access="public" returntype="void" output="No">
<cfargument name="approvalStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["approvalStatus"]=arguments["approvalStatus"]>
		
</cffunction>

<cffunction name="getDisapprovalReasons" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['disapprovalReasons']" default="">
	<cfreturn variables["instance"]["disapprovalReasons"]>
	
</cffunction>

<cffunction name="setDisapprovalReasons" access="public" returntype="void" output="No">
<cfargument name="disapprovalReasons" required="Yes" type="any">
	
	<cfset variables["instance"]["disapprovalReasons"]=arguments["disapprovalReasons"]>
		
</cffunction>

<cffunction name="getTrademarkDisapproved" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['trademarkDisapproved']" default="">
	<cfreturn variables["instance"]["trademarkDisapproved"]>
	
</cffunction>

<cffunction name="setTrademarkDisapproved" access="public" returntype="void" output="No">
<cfargument name="trademarkDisapproved" required="Yes" type="any">
	
	<cfset variables["instance"]["trademarkDisapproved"]=arguments["trademarkDisapproved"]>
		
</cffunction>

<cffunction name="getAdType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Ad_Type']" default="">
	<cfreturn variables["instance"]["Ad_Type"]>
	
</cffunction>

<cffunction name="setAdType" access="public" returntype="void" output="No">
<cfargument name="Ad_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Ad_Type"]=arguments["Ad_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
