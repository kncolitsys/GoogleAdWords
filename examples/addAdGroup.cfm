<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
Keep in touch with latest development news and become a Facebook Fan
http://www.facebook.com/pages/ColdFusion-Adwords-API-Client-Library/405372629479704
--->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>ColdFusion Google Adwords Api Example for Method mutate() with operator add</title>
</head>

<body>

<cfparam name="url.campaignID" default="">

<cfif url.campaignID eq "">
	<p>An AdGroup belongs to a Campaign. You have to specify the campaignID to add an AdGroup to a Campaign.</p>
	<cfabort>
</cfif>

<!--- include configuration --->
<cfinclude template="config.cfm">

<!--- setting a packagepath --->
<cfset packagepath="adwords_api.com.google.adwords.api.v201109.">

<!--- create instance of the class clientloginservice and login to get a valid authToken --->
<cfset oClientLoginService=createObject("component","#packagepath#clientloginservice")>

<cfset oClientLoginService.setEmail(adwords_api_email_account)>
<cfset oClientLoginService.setPasswd(adwords_api_password)>
<cfset authToken=oClientLoginService.getAuthTokenFromGoogle()>

<!--- create instance of the class adwordsuser and setting values based on variables inside config.cfm --->
<cfset oAdwordsUser=createObject("component","#packagepath#adwordsuser")>

<cfset oAdwordsUser.setAuthToken(authToken)>
<cfset oAdwordsUser.setUseragent(adwords_api_useragent)>
<cfset oAdwordsUser.setDeveloperToken(developer_token)>
<cfset oAdwordsUser.setClientCustomerId(customerId)>

<!--- create instance of the class adgroupservice --->
<cfset oAdGroupService=createObject("component","#packagepath#adgroupservice")>

<!--- setting the adwordsUser --->
<cfset oAdGroupService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oAdGroupService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oAdGroupService.setUseDefaultLogging(bUseLogging)>

<!--- create an adgroup instance --->
<cfset oAdGroup=createObject("component","#packagepath#adgroup")>

<!--- giving the adgroup a random name --->
<cfset oAdGroup.setName("AdGroup #createUUID()#")>

<!--- setting the adGroups campaignID --->
<cfset oAdGroup.setCampaignID(url.campaignID)>

<!--- create a adgroupoperation instance --->
<cfset oAdGroupOperation=createObject("component","#packagepath#adgroupoperation")>

<!--- set operator to ADD --->
<cfset oAdGroupOperation.setOperator("ADD")>

<!--- set operand to the new campaign --->
<cfset oAdGroupOperation.setOperand(oAdGroup)>

<cftry>
	<!--- add the new campaign --->
	<cfset oAdgroupReturnValue=oAdGroupService.mutate(oAdGroupOperation)>
	
	<cfdump var="#oAdgroupReturnValue.getObjectData(true)#">
	
	<cfoutput>
		<p>
			<a href="addAdGroupAd.cfm?adGroupID=#val(oAdgroupReturnValue.getObjectData(true).value[1].id)#">Click here to add a new TextAd to this AdGroup.</a>
		</p>
	</cfoutput>
	
	<!--- Is it an error raised through the api usage? --->
	<cfcatch type="adwordsapi">
		<!--- the method getError() returns the google api error messag as a coldfusion structure --->
		<cfdump var="#oAdGroupService.getError()#" label="API Error Message">
	</cfcatch>
	
	<!--- Okay, it's a general error. --->
	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="general cfcatch">
	</cfcatch>
	
</cftry>

</body>
</html>
