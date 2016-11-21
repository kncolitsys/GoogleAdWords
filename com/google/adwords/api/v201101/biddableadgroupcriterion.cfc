<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BiddableAdGroupCriterion" hint="A biddable (positive) criterion in an adgroup." extends="AdGroupCriterion">

<cfproperty name="userStatus" required="no" type="string" hint="Current user set state of criterion. During an ADD operation: It may not be set to DELETED. Defaults to UserStatus.Active if unspecified. This field can be selected using the value 'Status'.This field can be filtered on." seq="5">
<cfproperty name="systemServingStatus" required="no" type="string" hint="Serving status. This field can be selected using the value 'SystemServingStatus'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="6">
<cfproperty name="approvalStatus" required="no" type="string" hint="Approval status. This field can be selected using the value 'ApprovalStatus'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="7">
<cfproperty name="destinationUrl" required="no" type="string" hint="Destination URL override when Ad is triggered by this criterion. Some sample valid URLs are: 'http://www.website.com', 'http://www.domain.com/somepath'. This field can be selected using the value 'DestinationUrl'.This field can be filtered on." seq="8">
<cfproperty name="bids" required="no" type="AdGroupCriterionBids" hint="The campaign bidding strategy specific bids placed for this criterion." seq="9">
<cfproperty name="experimentData" required="no" type="BiddableAdGroupCriterionExperimentData" hint="The campaign bidding strategy specific experiment data for this criterion." seq="10">
<cfproperty name="firstPageCpc" required="no" type="Bid" hint="First page Cpc for this criterion. This field can be selected using the value 'FirstPageCpc'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="11">
<cfproperty name="qualityInfo" required="no" type="QualityInfo" hint="Contains quality information about the criterion. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="12">
<cfproperty name="stats" required="no" type="Stats" hint="Contains statistics about the criterion. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="13">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdGroupCriterionType("BiddableAdGroupCriterion")>

<cffunction name="getUserStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['userStatus']" default="">
	<cfreturn variables["instance"]["userStatus"]>
	
</cffunction>

<cffunction name="setUserStatus" access="public" returntype="void" output="No">
<cfargument name="userStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["userStatus"]=arguments["userStatus"]>
		
</cffunction>

<cffunction name="getSystemServingStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['systemServingStatus']" default="">
	<cfreturn variables["instance"]["systemServingStatus"]>
	
</cffunction>

<cffunction name="setSystemServingStatus" access="public" returntype="void" output="No">
<cfargument name="systemServingStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["systemServingStatus"]=arguments["systemServingStatus"]>
		
</cffunction>

<cffunction name="getApprovalStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['approvalStatus']" default="">
	<cfreturn variables["instance"]["approvalStatus"]>
	
</cffunction>

<cffunction name="setApprovalStatus" access="public" returntype="void" output="No">
<cfargument name="approvalStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["approvalStatus"]=arguments["approvalStatus"]>
		
</cffunction>

<cffunction name="getDestinationUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['destinationUrl']" default="">
	<cfreturn variables["instance"]["destinationUrl"]>
	
</cffunction>

<cffunction name="setDestinationUrl" access="public" returntype="void" output="No">
<cfargument name="destinationUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["destinationUrl"]=arguments["destinationUrl"]>
		
</cffunction>

<cffunction name="getBids" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bids']" default="">
	<cfreturn variables["instance"]["bids"]>
	
</cffunction>

<cffunction name="setBids" access="public" returntype="void" output="No">
<cfargument name="bids" required="Yes" type="any">
	
	<cfset variables["instance"]["bids"]=arguments["bids"]>
		
</cffunction>

<cffunction name="getExperimentData" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['experimentData']" default="">
	<cfreturn variables["instance"]["experimentData"]>
	
</cffunction>

<cffunction name="setExperimentData" access="public" returntype="void" output="No">
<cfargument name="experimentData" required="Yes" type="any">
	
	<cfset variables["instance"]["experimentData"]=arguments["experimentData"]>
		
</cffunction>

<cffunction name="getFirstPageCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['firstPageCpc']" default="">
	<cfreturn variables["instance"]["firstPageCpc"]>
	
</cffunction>

<cffunction name="setFirstPageCpc" access="public" returntype="void" output="No">
<cfargument name="firstPageCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["firstPageCpc"]=arguments["firstPageCpc"]>
		
</cffunction>

<cffunction name="getQualityInfo" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['qualityInfo']" default="">
	<cfreturn variables["instance"]["qualityInfo"]>
	
</cffunction>

<cffunction name="setQualityInfo" access="public" returntype="void" output="No">
<cfargument name="qualityInfo" required="Yes" type="any">
	
	<cfset variables["instance"]["qualityInfo"]=arguments["qualityInfo"]>
		
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
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
