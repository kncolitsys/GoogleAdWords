<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
--->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>
			ColdFusion Google Adwords Api Example for Method getReportField() of the reportDefinitionService
		</title>
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
		<cfset authToken = oClientLoginService.getAuthTokenFromGoogle()>
	
		<!--- create instance of the class adwordsuser and setting values based on variables inside config.cfm --->
		<cfset oAdwordsUser=createObject("component","#packagepath#adwordsuser")>
	
		<cfset oAdwordsUser.setAuthToken(authToken)>
		<cfset oAdwordsUser.setUseragent(adwords_api_useragent)>
		<cfset oAdwordsUser.setDeveloperToken(developer_token)>
		<cfset oAdwordsUser.setClientEmail(client_email)>
	
		<!--- create instance of the class servicedaccountservice --->
		<cfset oReportDefinitionService=createObject("component","#packagepath#reportdefinitionservice")>
	
		<!--- setting the adwordsUser --->
		<cfset oReportDefinitionService.setAdwordsUser(oAdwordsUser)>
	
		<!--- switch to sandbox mode --->
		<cfset oReportDefinitionService.setUseSandbox(bUseSandBox)>
	
		<!--- use defaultLogging and log request and response to logs directory --->
		<cfset oReportDefinitionService.setUseDefaultLogging(bUseLogging)>

		<cfset adGroupId=INSERT_AD_GROUP_ID_HERE>
		
		<!--- create selector --->
		<cfset oSelector=createObject("component","#packagepath#selector")>
		<cfset oSelector.setFields(listToArray("AdGroupId,Id,KeywordText,KeywordMatchType,Impressions,Clicks,Cost"))>

		<!--- create predicates --->
		<cfset oAdGroupIdPredicate=createObject("component","#packagepath#predicate")>
		<cfset oAdGroupIdPredicate.setField("AdGroupId")>
		<cfset oAdGroupIdPredicate.setOperator("EQUALS")>
		<cfset aAdGroupId=arrayNew(1)>
		<cfset arrayAppend(aAdGroupId,adGroupId)>
		<cfset oAdGroupIdPredicate.setValues(aAdGroupId)>
		<cfset aPredicates=arrayNew(1)>
		<cfset arrayAppend(aPredicates,oAdGroupIdPredicate)>
		<cfset oSelector.setPredicates(aPredicates)>

		<!--- create report definition --->
		<cfset oReportDefinition=createObject("component","#packagepath#reportdefinition")>
		<cfset oReportDefinition.setReportName("Keywords performance report ###dateFormat(now(),"dd.mm.yyyy")#")>
		<cfset oReportDefinition.setDateRangeType("LAST_14_DAYS")>
		<cfset oReportDefinition.setReportType("KEYWORDS_PERFORMANCE_REPORT")>
		<cfset oReportDefinition.setDownloadFormat("XML")>
		<cfset oReportDefinition.setSelector(oSelector)>

		<!--- create operations --->
		<cfset oOperation=createObject("component","#packagepath#reportdefinitionoperation")>
		<cfset oOperation.setOperand(oReportDefinition)>
		<cfset oOperation.setOperator("ADD")>
		<cfset aOperations=arrayNew(1)>
		<cfset arrayAppend(aOperations,oOperation)>

	<cftry>
		
			<!--- add report definition --->
			<cfset oResult = oReportDefinitionService.mutate(aOperations)>
		
			<!--- dump the returned data as a struct --->
			<cfdump var="#oResult.getObjectData(true)#" label="oReportDefinitionPage">
		
		<!--- Is it an error raised through the api usage? --->
		<cfcatch type="adwordsapi">
			<!--- the method getError() returns the google api error messag as a coldfusion structure --->
			<cfdump var="#oReportDefinitionService.getError()#" label="API Error Message">
		</cfcatch>
		
		<!--- Okay, it's a general error. --->
		<cfcatch type="any">
			<cfdump var="#cfcatch#" label="general cfcatch">
		</cfcatch>
		
		</cftry>
	</body>
</html>