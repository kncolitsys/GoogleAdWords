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
		<cfset oAdwordsUser.setClientCustomerId(customerId)>
	
		<!--- create instance of the class servicedaccountservice --->
		<cfset oReportDefinitionService=createObject("component","#packagepath#reportdefinitionservice")>
	
		<!--- setting the adwordsUser --->
		<cfset oReportDefinitionService.setAdwordsUser(oAdwordsUser)>
	
		<!--- switch to sandbox mode --->
		<cfset oReportDefinitionService.setUseSandbox(bUseSandBox)>
	
		<!--- use defaultLogging and log request and response to logs directory --->
		<cfset oReportDefinitionService.setUseDefaultLogging(bUseLogging)>
	
		<!--- create selector of type reportdefinitionselector --->
		<cfset oSelector=createObject("component","#packagepath#reportdefinitionselector")>
	
		<cftry>
		
			<!--- get all report definitions --->
			<cfset oReportDefinitionPage = oReportDefinitionService.get(oSelector)>
		
			<!--- dump the returned data as a struct --->
			<cfdump var="#oReportDefinitionPage.getObjectData(true)#" label="oReportDefinitionPage">
		
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