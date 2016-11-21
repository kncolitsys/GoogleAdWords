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

<cfparam name="url.adgroupid" default="">

<cfif url.adgroupid eq "">
	<p>A Keyword belongs to an AdGroup. You have to specify the adGroupID to add a Keyword to an AdGroup.</p>
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

<!--- create instance of the class AdGroupCriterionService and call method init(oService) --->
<cfset oAdGroupCriterionService=createObject("component","#packagepath#adgroupcriterionservice")>

<!--- setting the adwordsUser --->
<cfset oAdGroupCriterionService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oAdGroupCriterionService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oAdGroupCriterionService.setUseDefaultLogging(bUseLogging)>

<!--- create a keyword instance --->
<cfset oKeyword=createObject("component","#packagepath#keyword")>

<!--- setting the keyword text --->
<cfset oKeyword.setText("adwords api #createUUID()#")>

<!--- setting the matchType --->
<cfset oKeyword.setMatchType("EXACT")>

<!--- setting the criterion.type to keyword --->
<cfset oKeyword.setCriterionType("Keyword")>

<!--- create an BiddableAdGroupCriterion instance --->
<cfset oBiddableAdGroupCriterion=createObject("component","#packagepath#biddableadgroupcriterion")>

<!--- setting the adGroupId --->
<cfset oBiddableAdGroupCriterion.setAdGroupId(url.adgroupid)>

<!--- setting criterion to oCriterion --->
<cfset oBiddableAdGroupCriterion.setCriterion(oKeyword)>

<!--- create a adgroupcriterionoperation instance --->
<cfset oAdGroupCriterionOperation=createObject("component","#packagepath#adgroupcriterionoperation")>

<!--- set operator to ADD --->
<cfset oAdGroupCriterionOperation.setOperator("ADD")>

<!--- set operand to the new adgroupcriterion --->
<cfset oAdGroupCriterionOperation.setOperand(oBiddableAdGroupCriterion)>

<cftry>
	<!--- add the new keyword --->
	<cfset oAdGroupCriterionReturnValue=oAdGroupCriterionService.mutate(oAdGroupCriterionOperation)>
	
	<cfdump var="#oAdGroupCriterionReturnValue.getObjectData(true)#">
	
	<!--- Is it an error raised through the api usage? --->
	<cfcatch type="adwordsapi">
		<!--- the method getError() returns the google api error messag as a coldfusion structure --->
		<cfdump var="#oAdGroupCriterionService.getError()#" label="API Error Message">
	</cfcatch>
	
	<!--- Okay, it's a general error. --->
	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="general cfcatch">
	</cfcatch>
	
</cftry>

</body>
</html>
