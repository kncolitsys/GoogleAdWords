<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
Keep in touch with latest development news and become a Facebook Fan
http://www.facebook.com/pages/ColdFusion-Adwords-API-Client-Library/405372629479704
--->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
			ColdFusion Google Adwords Api Example for Method get() from targetIdeaService
		</title>
	</head>
	
	<body>
	
		<!--- include configuration --->
		<cfinclude template="config.cfm">
	
		<!--- setting a packagepath --->
		<cfset packagepath = "adwords_api.com.google.adwords.api.v201109.">
	
		<!--- create instance of the class clientloginservice and login to get a valid authToken --->
		<cfset oClientLoginService = createObject("component", "#packagepath#clientloginservice")>
	
		<cfset oClientLoginService.setEmail(adwords_api_email_account)>
		<cfset oClientLoginService.setPasswd(adwords_api_password)>
		<cfset authToken = oClientLoginService.getAuthTokenFromGoogle()>
	
		<!--- create instance of the class adwordsuser and setting values based on variables inside 
		config.cfm --->
		<cfset oAdwordsUser = createObject("component", "#packagepath#adwordsuser")>
	
		<cfset oAdwordsUser.setAuthToken(authToken)>
		<cfset oAdwordsUser.setUseragent(adwords_api_useragent)>
		<cfset oAdwordsUser.setDeveloperToken(developer_token)>
		<cfset oAdwordsUser.setClientCustomerId(customerId)>
	
		<!--- create instance of the class targetingideaservice --->
		<cfset oTargetingIdeaService = createObject("component", "#packagepath#targetingideaservice")>
	
		<!--- setting the adwordsUser --->
		<cfset oTargetingIdeaService.setAdwordsUser(oAdwordsUser)>
	
		<!--- switch to sandbox mode --->
		<cfset oTargetingIdeaService.setUseSandbox(bUseSandBox)>
	
		<!--- use defaultLogging and log request and response to logs directory --->
		<cfset oTargetingIdeaService.setUseDefaultLogging(bUseLogging)>
	
		<!---create seed keyword --->
		<cfset oKeyword = createObject("component", "#packagepath#keyword")>
		<cfset oKeyword.setText("costumes")>
		<cfset oKeyword.setMatchType("BROAD")>
	
		<!--- create selector --->
		<cfset oSelector = createObject("component", "#packagepath#targetingideaselector")>
		<cfset oSelector.setRequestType("IDEAS")>
		<cfset oSelector.setIdeaType("KEYWORD")>
		<cfset aTypes = arrayNew(1)>
		<cfset arrayAppend(aTypes, "CRITERION")>
		<cfset arrayAppend(aTypes, "AVERAGE_TARGETED_MONTHLY_SEARCHES")>
		<cfset oSelector.setRequestedAttributeTypes(aTypes)>
	
		<!--- set selector paging (required for targeting idea service) --->
		<cfset oPaging = createObject("component", "#packagepath#paging")>
		<cfset oPaging.setStartIndex(0)>
		<cfset oPaging.setNumberResults(10)>
		<cfset oSelector.setPaging(oPaging)>
	
		<!--- create related to keyword search parameter --->
		<cfset oRelatedToKeywordSearchParameter = createObject("component", 
		                                                       "#packagepath#relatedtokeywordsearchparameter")>
		<cfset aKeywords = arrayNew(1)>
		<cfset arrayAppend(aKeywords, oKeyword)>
		<cfset oRelatedToKeywordSearchParameter.setKeywords(aKeywords)>
		<!---<cfset 
		oRelatedToKeywordSearchParameter.setSearchParameterType("RelatedToKeywordSearchParameter")>--->
		<!--- create keyword match type search parameter to ensure unique results --->
		<cfset oKeywordMatchTypeSearchParameter = createObject("component", 
		                                                       "#packagepath#keywordmatchtypesearchparameter")>
		<cfset aTypes = arrayNew(1)>
		<cfset arrayAppend(aTypes, "BROAD")>
		<cfset oKeywordMatchTypeSearchParameter.setKeywordMatchTypes(aTypes)>
		<!---<cfset 
		oKeywordMatchTypeSearchParameter.setSearchParameterType("KeywordMatchTypeSearchParameter")>--->
		<cfset aSearchParams = arrayNew(1)>
		<cfset arrayAppend(aSearchParams, oRelatedToKeywordSearchParameter)>
		<cfset arrayAppend(aSearchParams, oKeywordMatchTypeSearchParameter)>
		<cfset oSelector.setSearchParameters(aSearchParams)>
	
		<cftry>
		
			<!--- get related keywords --->
			<cfset oTargetingIdeaPage = oTargetingIdeaService.get(oSelector)>
		
			<!--- dump the returned data as a struct --->
			<cfdump var="#oTargetingIdeaPage.getObjectData(true)#" label="oTargetingIdeaPage">
		
			<!--- Is it an error raised through the api usage? --->
		<cfcatch type="adwordsapi">
			<!--- the method getError() returns the google api error messag as a coldfusion structure --->
			<cfdump var="#oTargetingIdeaService.getError()#" label="API Error Message">
		</cfcatch>
		
			<!--- Okay, it's a general error. --->
		<cfcatch type="any">
			<cfdump var="#cfcatch#" label="general cfcatch">
		</cfcatch>
		
		</cftry>
	</body>
</html>