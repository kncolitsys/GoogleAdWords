<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
Keep in touch with latest development news and become a Facebook Fan
http://www.facebook.com/pages/ColdFusion-Adwords-API-Client-Library/405372629479704
--->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>ColdFusion Google Adwords Api Example for Method get()</title>
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

<!--- create instance of the class TrafficEstimatorService --->
<cfset oTrafficEstimatorService=createObject("component","#packagepath#trafficestimatorservice")>

<!--- setting the adwordsUser --->
<cfset oTrafficEstimatorService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oTrafficEstimatorService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oTrafficEstimatorService.setUseDefaultLogging(bUseLogging)>

<!--- create keywords - up to 2000 keywords can be passed in a single request --->
<cfset aKeywords=arrayNew(1)>

<cfset oKeyword_01=createObject("component","#packagepath#keyword")>
<cfset oKeyword_01.setText("mars cruise")>
<cfset oKeyword_01.setMatchType("BROAD")>
<cfset arrayAppend(aKeywords,oKeyword_01)>

<cfset oKeyword_02=createObject("component","#packagepath#keyword")>
<cfset oKeyword_02.setText("cheap cruise")>
<cfset oKeyword_02.setMatchType("PHRASE")>
<cfset arrayAppend(aKeywords,oKeyword_02)>

<cfset oKeyword_03=createObject("component","#packagepath#keyword")>
<cfset oKeyword_03.setText("cruise")>
<cfset oKeyword_03.setMatchType("EXACT")>
<cfset arrayAppend(aKeywords,oKeyword_03)>

<!--- create a keyword estimate request for each keyword --->
<cfset aKeywordEstimateRequests=arrayNew(1)>
<cfloop from="1" to="#arrayLen(aKeywords)#" index="i">
	<cfset oKeywordEstimateRequest=createObject("component","#packagepath#keywordestimaterequest")>
	<cfset oKeywordEstimateRequest.setKeyword(aKeywords[i])>
	<cfset arrayAppend(aKeywordEstimateRequests,oKeywordEstimateRequest)>
</cfloop>

<!--- create ad group estimate requests --->
<cfset oAdGroupEstimateRequest=createObject("component","#packagepath#adgroupestimaterequest")>
<cfset oAdGroupEstimateRequest.setKeywordEstimateRequests(aKeywordEstimateRequests)>
<cfset oMoney=createObject("component","#packagepath#money")>
<cfset oMoney.setMicroAmount(1000000)>
<cfset oAdGroupEstimateRequest.setMaxCpc(oMoney)>
<cfset aAdGroupEstimateRequests=arrayNew(1)>
<cfset arrayAppend(aAdGroupEstimateRequests,oAdGroupEstimateRequest)>


<!--- create campaign estimate requests --->
<cfset oCampaignEstimateRequest=createObject("component","#packagepath#campaignestimaterequest")>
<cfset oCampaignEstimateRequest.setAdGroupEstimateRequests(aAdGroupEstimateRequests)>

<cfset aCriteria=arrayNew(1)>

<cfset unitedStates=createObject("component","#packagepath#location")>
<cfset unitedStates.setId(2840)>
<cfset arrayAppend(aCriteria,unitedStates)>

<cfset english=createObject("component","#packagepath#language")>
<cfset english.setId(1000)>
<cfset arrayAppend(aCriteria,english)>

<cfset oCampaignEstimateRequest.setCriteria(aCriteria)>

<cfset aCampaignEstimateRequests=arrayNew(1)>
<cfset arrayAppend(aCampaignEstimateRequests,oCampaignEstimateRequest)>

<!--- create selector --->
<cfset oTrafficEstimatorSelector=createObject("component","#packagepath#trafficestimatorselector")>
<cfset oTrafficEstimatorSelector.setCampaignEstimateRequests(aCampaignEstimateRequests)>

<cftry>

<!--- get TrafficEstimatorResult through the google adwords api --->
<cfset oTrafficEstimatorResult=oTrafficEstimatorService.get(oTrafficEstimatorSelector)>

	<!--- dump the returned data as a struct --->
	<cfdump var="#oTrafficEstimatorResult.getObjectData(true)#" label="oTrafficEstimatorResult">
	
	
	<!--- Is it an error raised through the api usage? --->
	<cfcatch type="adwordsapi">
		<!--- the method getError() returns the google api error messag as a coldfusion structure --->
		<cfdump var="#oTrafficEstimatorService.getError()#" label="API Error Message">
	</cfcatch>
	
	<!--- Okay, it's a general error. --->
	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="general cfcatch">
	</cfcatch>
	
</cftry>

</body>
</html>
