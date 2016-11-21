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
<cfset oAdwordsUser.setClientCustomerId(customerId)>

<!--- create instance of the class campaignservice  --->
<cfset oCampaignService=createObject("component","#packagepath#campaignservice")>

<!--- setting the adwordsUser --->
<cfset oCampaignService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oCampaignService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oCampaignService.setUseDefaultLogging(bUseLogging)>

<!--- create instance of the class selector --->
<cfset oServiceSelector=createObject("component","#packagepath#selector")>

<!--- setting the return fields --->
<cfset oServiceSelector.setFields("Id,Name,Status,StartDate,EndDate,ServingStatus")>

<!--- create instance of the class customersyncservice  --->
<cfset oCustomerSyncService=createObject("component","#packagepath#customersyncservice")>

<!--- setting the adwordsUser --->
<cfset oCustomerSyncService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oCustomerSyncService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oCustomerSyncService.setUseDefaultLogging(bUseLogging)>

<!--- create instance of the class CustomerSyncSelector  --->
<cfset oCustomerSyncSelector=createObject("component","#packagepath#customersyncselector")>

<cftry>
	
	<!--- get the campaignPage object through the google adwords api --->
	<cfset oCampaignPage=oCampaignService.get(oServiceSelector)>
	<cfdump var="#oCampaignPage.getObjectData(true)#"><cfabort>
	<!--- deserialize object data into array aCampaigns --->
	<cfset aCampaigns=oCampaignPage.getObjectData(true).entries>
	
	<!--- create empty array aIds --->
	<cfset aIds=arrayNew(1)>
	
	<!--- loop through the campaign array and store campaign ids into aIds --->
	<cfloop from="1" to="#arrayLen(aCampaigns)#" index="i">
		<cfset arrayAppend(aIds,aCampaigns[i].id)>
	</cfloop>
	
	<!--- create an instance of the class datetimerange --->
	<cfset oDateTimeRange=createObject("component","#packagepath#datetimerange")>
	
	<!--- prepare min and max dateTime values --->
	<cfset date=now()>	
	<cfset min=dateFormat(dateAdd("d",-1,date),"yyyymmdd")&" "&timeFormat(date,"HHmmss")&" -02:00">
	<cfset max=dateFormat(date,"yyyymmdd")&" "&timeFormat(date,"HHmmss")&" -02:00">
	
	<!--- setting min and max dateTime values --->
	<cfset oDateTimeRange.setMin(min)>
	<cfset oDateTimeRange.setMax(max)>
		
	<!--- setting the campaignIDs --->
	<cfset oCustomerSyncSelector.setCampaignIds(aIds)>
	
	<!--- setting the dateTimeRange --->
	<cfset oCustomerSyncSelector.setDateTimeRange(oDateTimeRange)>

	<!--- get the CustomerChangeData object through the google adwords api --->
	<cfset oCustomerChangeData=oCustomerSyncService.get(oCustomerSyncSelector)>

	<!--- dump the returned data as a struct --->
	<cfdump var="#oCustomerChangeData.getObjectData(true)#" label="oCustomerChangeData">
	
	<!--- also dump the responseHeader --->
	<cfdump var="#oCustomerSyncService.getService().getResponseHeader().getObjectData(true)#" label="ResponseHeader">
	
	<!--- Is it an error raised through the api usage? --->
	<cfcatch type="adwordsapi">
		<!--- the method getError() returns the google api error messag as a coldfusion structure --->
		<cfdump var="#oCustomerSyncService.getError()#" label="API Error Message">
	</cfcatch>
	
	<!--- Okay, it's a general error. --->
	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="general cfcatch">
	</cfcatch>
	
</cftry>

</body>
</html>