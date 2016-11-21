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
	<p>An Ad belongs to an AdGroup. You have to specify the adGroupID to add an Ad to an AdGroup.</p>
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
<cfset oAdGroupAdService=createObject("component","#packagepath#adgroupadservice")>

<!--- setting the adwordsUser --->
<cfset oAdGroupAdService.setAdwordsUser(oAdwordsUser)>

<!--- switch to sandbox mode --->
<cfset oAdGroupAdService.setUseSandbox(bUseSandBox)>

<!--- use defaultLogging and log request and response to logs directory --->
<cfset oAdGroupAdService.setUseDefaultLogging(bUseLogging)>

<!--- create a textad instance --->
<cfset oTextAd=createObject("component","#packagepath#textad")>

<!--- setting the AdType --->
<cfset oTextAd.setAdType("TextAd")>

<!--- setting the url --->
<cfset oTextAd.setUrl("http://www.cfsolutions.de")>

<!--- setting the displayurl --->
<cfset oTextAd.setDisplayUrl("www.cfsolutions.de")>

<!--- setting the headline --->
<cfset oTextAd.setHeadline("Adwords API Consulting")>

<!--- setting description1 (line no 1) --->
<cfset oTextAd.setDescription1("We help you to access")>

<!--- setting description2 (line no 2) --->
<cfset oTextAd.setDescription2("the google adwords api.")>

<!--- create an adgroupad instance --->
<cfset oAdGroupAd=createObject("component","#packagepath#adgroupad")>

<!--- setting the adGroupId --->
<cfset oAdGroupAd.setAdGroupId(url.adgroupid)>

<!--- setting the a textad inside oAdGroup --->
<cfset oAdGroupAd.setAd(oTextAd)>

<!--- create a adgroupadadoperation instance --->
<cfset oAdGroupAdOperation=createObject("component","#packagepath#adgroupadoperation")>

<!--- set operator to ADD --->
<cfset oAdGroupAdOperation.setOperator("ADD")>

<!--- set operand to the new adgroupad --->
<cfset oAdGroupAdOperation.setOperand(oAdGroupAd)>

<cftry>
	<!--- add the new TextAd --->
	<cfset oAdGroupAdReturnValue=oAdGroupAdService.mutate(oAdGroupAdOperation)>
	
	<cfdump var="#oAdGroupAdReturnValue.getObjectData(true)#">
	
	<cfoutput>
		<p>
			<a href="addKeyword.cfm?adGroupID=#val(oAdGroupAdReturnValue.getObjectData(true).value[1].adGroupId)#">Click here to add a new Keyword to the current AdGroup.</a>
		</p>
	</cfoutput>
	
	<!--- Is it an error raised through the api usage? --->
	<cfcatch type="adwordsapi">
		<!--- the method getError() returns the google api error messag as a coldfusion structure --->
		<cfdump var="#oAdGroupAdService.getError()#" label="API Error Message">
	</cfcatch>
	
	<!--- Okay, it's a general error. --->
	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="general cfcatch">
	</cfcatch>
	
</cftry>

</body>
</html>
