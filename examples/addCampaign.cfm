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

<!--- create instance of the class campaignservice and call method init(oService) --->
<cfset oCampaignService=createObject("component","#packagepath#campaignservice")>

<!--- setting the adwordsUser --->
<cfset oCampaignService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oCampaignService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oCampaignService.setUseDefaultLogging(bUseLogging)>

<!--- create a money instance --->
<cfset oMoney=createObject("component","#packagepath#money")>

<!--- setting the amount in micros --->
<cfset oMoney.setMicroAmount(1000000000)>

<!--- create a budget instance --->
<cfset oBudget=createObject("component","#packagepath#budget")>

<!--- set amount to oMoney --->
<cfset oBudget.setAmount(oMoney)>

<!--- setting the period to a value of "Daily" --->
<cfset oBudget.setPeriod("DAILY")>

<!--- create a campaign instance --->
<cfset oCampaign=createObject("component","#packagepath#campaign")>

<!--- giving the campaign a random name --->
<cfset oCampaign.setName("Adword Campaign #createUUID()#")>

<!--- set budget to oBudget --->
<cfset oCampaign.setBudget(oBudget)>

<!--- create instance of manualcpc (a biddingStrategy) --->
<cfset oManualCPC=createObject("component","#packagepath#manualcpc")>

<!--- set the biddingStrategy to manualCPC --->
<cfset oCampaign.setBiddingStrategy(oManualCPC)>

<!--- create a campaignoperation instance --->
<cfset oCampaignOperation=createObject("component","#packagepath#campaignoperation")>

<!--- set operator to ADD --->
<cfset oCampaignOperation.setOperator("ADD")>

<!--- set operand to the new campaign --->
<cfset oCampaignOperation.setOperand(oCampaign)>

<cftry>
	<!--- add the new campaign --->
	<cfset oCampaignReturnValue=oCampaignService.mutate(oCampaignOperation)>
	
	<cfdump var="#oCampaignReturnValue.getObjectData(true)#">
	
	<cfoutput>
		<p>
			<a href="addAdGroup.cfm?campaignID=#val(oCampaignReturnValue.getObjectData(true).value[1].id)#">Click here to add a new AdGroup to this Campaign.</a>
		</p>
	</cfoutput>
	
	<!--- Is it an error raised through the api usage? --->
	<cfcatch type="adwordsapi">
		<!--- the method getError() returns the google api error messag as a coldfusion structure --->
		<cfdump var="#oCampaignService.getError()#" label="API Error Message">
	</cfcatch>
	
	<!--- Okay, it's a general error. --->
	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="general cfcatch">
	</cfcatch>
	
</cftry>

</body>
</html>
