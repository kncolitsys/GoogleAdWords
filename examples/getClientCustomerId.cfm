<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
Keep in touch with latest development news and become a Facebook Fan
http://http://www.facebook.com/pages/ColdFusion-Adwords-API-Client-Library/405372629479704
--->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>ColdFusion Google Adwords Api Example for Method infoservice.get()</title>
</head>

<body>
	
<!--- This example illustrates how to find a client customer ID for a client email.
We recommend to use this script as a one off to convert your identifiers to
IDs and store them for future use. Note: this example must be run using the
credentials of an MCC account. --->

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

<!--- create instance of the class getinfoservice --->
<cfset oInfoService=createObject("component","#packagepath#infoservice")>

<!--- setting the adwordsUser --->
<cfset oInfoService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oInfoService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oInfoService.setUseDefaultLogging(bUseLogging)>

<!--- create instance of the class infoselector --->
<cfset oInfoSelector=createObject("component","#packagepath#infoselector")>

<cfset aTemp=ArrayNew(1)>
<cfset ArrayAppend(aTemp,"INSERT_CLIENT_EMAIL_ADDRESS_HERE")>

<cfset oInfoSelector.setClientEmails(aTemp)>
<cfset oInfoSelector.setIncludeSubAccounts(1)>
<cfset oInfoSelector.setApiUsageType("UNIT_COUNT_FOR_CLIENTS")>

<!--- The date used doesn't matter, so use today.
create an instance of the class datetimerange --->
<cfset oDateRange=createObject("component","#packagepath#daterange")>
	
<!--- prepare min and max date values --->
<cfset date=now()>	

<!--- setting min and max date values --->
<cfset oDateRange.setMin(dateFormat(date,"yyyymmdd"))>
<cfset oDateRange.setMax(dateFormat(date,"yyyymmdd"))>

<!--- setting the dateRange to oDateRange --->
<cfset oInfoSelector.setDateRange(oDateRange)>

<cftry>

<!--- get the ApiUsageInfo object through the google adwords api --->
<cfset oApiUsageInfo=oInfoService.get(oInfoSelector)>

	<!--- dump the returned data as a struct --->
	<cfdump var="#oApiUsageInfo.getObjectData(true)#" label="oApiUsageInfo">
	
	<!--- Is it an error raised through the api usage? --->
	<cfcatch type="adwordsapi">
		<!--- the method getError() returns the google api error messag as a coldfusion structure --->
		<cfdump var="#oInfoService.getError()#" label="API Error Message">
	</cfcatch>
	
	<!--- Okay, it's a general error. --->
	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="general cfcatch">
	</cfcatch>
	
</cftry>

</body>
</html>


