<cfsetting enablecfoutputonly="true">
<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
Keep in touch with latest development news and become a Facebook Fan
http://www.facebook.com/pages/ColdFusion-Adwords-API-Client-Library/405372629479704
--->
<cfparam name="form.method" default="getCampaigns">
<cfparam name="form.campaignID" default="">
<cfparam name="form.adGroupID" default="">
<cfparam name="form.adID" default="">
<cfparam name="form.criterionID" default="">
<cfparam name="form.targetJSONFormat" default="properties">
<cfparam name="form.clientCustomerID" default="">
<cfparam name="form.status" default="ACTIVE">
<cfparam name="form.campaignName" default="">
<cfparam name="form.adGroupName" default="">
<cfparam name="form.keyword" default="">
<cfparam name="form.adId" default="">
<cfparam name="form.matchType" default="BROAD">
<cfparam name="form.headline" default="">
<cfparam name="form.desc1" default="">
<cfparam name="form.desc2" default="">
<cfparam name="form.url" default="">
<cfparam name="form.dspurl" default="">

<!--- setting a packagepath --->
<cfset packagepath = "adwords_api.com.google.adwords.api.v201109.">

<!--- include configuration eg. adwordsuser login details --->
<cfinclude template="config.cfm">

<!--- include function deffinitions --->
<cfinclude template="functions.cfm">

<cftry>

	<!--- we use caching --->
	<cfif not structKeyExists(application, "oCache")>
		<cfset application.oCache = createObject("component", "cache")>
	</cfif>

	<!--- check if oCampaignService is cached --->
	<cfif application.oCache.hasData("authToken") and not isDefined("url.refresh")>
	
		<!--- yes, get it from within the cache --->
		<cfset authToken = application.oCache.getData("authToken")>
	
	<cfelse>
	
		<!--- create instance of the class clientloginservice and login to get a valid authToken --->
		<cfset oClientLoginService = createObject("component", "#packagepath#clientloginservice")>
	
		<cfset oClientLoginService.setEmail(adwords_api_email_account)>
		<cfset oClientLoginService.setPasswd(adwords_api_password)>
		<cfset authToken = oClientLoginService.getAuthTokenFromGoogle()>
	
		<!--- 30 minutes cache timeout --->
		<cfset expirationDate = Now() + CreateTimeSpan(0, 0, 30, 0)>
		<!--- write authToken to the cache --->
		<cfset application.oCache.setData("authToken", authToken, expirationDate)>
	</cfif>

	<!--- create instance of the class adwordsuser and setting values based on variables inside 
	config.cfm --->
	<cfset oAdwordsUser = createObject("component", "#packagepath#adwordsuser")>

	<cfset oAdwordsUser.setAuthToken(authToken)>
	<cfset oAdwordsUser.setUseragent(adwords_api_useragent)>
	<cfset oAdwordsUser.setDeveloperToken(developer_token)>

	<cfswitch expression="#trim(form.method)#">
	
		<cfcase value="getCampaigns">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class campaignservice and call method init(oService) --->
			<cfset oCampaignService = createObject("component", "#packagepath#campaignservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oCampaignService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oCampaignService.setUseSandbox(bUseSandBox)>
		
			<!--- create instance of the class selector --->
			<cfset oServiceSelector = createObject("component", "#packagepath#selector")>
		
			<!--- setting the return fields --->
			<cfset oServiceSelector.setFields("Id,Name,Status,StartDate,EndDate,ServingStatus,AdServingOptimizationStatus,Settings,TargetGoogleSearch,TargetSearchNetwork,TargetContentNetwork,TargetContentContextual,TargetPartnerSearchNetwork,PositionPreference,EnhancedCpcEnabled,BidCeiling,PricingModel,ConversionOptimizerBidType,DeduplicationMode,Period,Amount,DeliveryMethod")>
		
			<!--- filter by campaignID --->
			<cfif val(form.campaignID) neq 0>
				<!--- create instance of the class predicate --->
				<cfset oPredicate = createObject("component", "#packagepath#predicate")>
				<!--- setting field by which to filter the returned data --->
				<cfset oPredicate.setField("Id")>
				<!--- setting the operator to use for filtering the data returned --->
				<cfset oPredicate.setOperator("EQUALS")>
				<!--- setting the campaignID --->
				<cfset oPredicate.setValues(val(form.campaignID))>
				<!--- add predicate to the serviceSelector --->
				<cfset oServiceSelector.setPredicates(oPredicate)>
			</cfif>
		
			<!--- detailed error handling for calling remote methods of oCampaignService --->
			<cftry>
			
				<!--- get the campaignPage object through the google adwords api --->
				<cfset oCampaignPage = oCampaignService.get(oServiceSelector)>
			
				<cfset stCampaignData = oCampaignPage.getObjectData(true)>
			
				<cfif trim(form.targetJSONFormat) eq "tree">
				
					<cfset aCampaigns = ArrayNew(1)>
				
					<cfloop from="1" to="#val(stCampaignData.totalNumEntries)#" index="i">
					
						<cfset stCampaign = structNew()>
						<cfset stCampaign['campaignID'] = stCampaignData.entries[i].id>
						<cfset stCampaign['text'] = jsStringFormat(stCampaignData.entries[i].name)>
						<cfset stCampaign['cls'] = "campaigns">
						<cfset stCampaign['leaf'] = false>
						<cfset stCampaign['iconCls'] = "campaign-icon">
						<cfset stCampaign['status'] = stCampaignData.entries[i].status>
						<cfset stCampaign['qtip'] = "Status:&nbsp;" & stCampaignData.entries[i].status>
						<cfset stCampaign['type'] = 'cmp'>
						<cfset stCampaign['id'] = 'campaign-' & stCampaignData.entries[i].id>
						<cfset stCampaign['children'] = arrayNew(1)>
						<cfset stCampaign['children'][1] = structNew()>
						<cfset stCampaign['children'][1]['text'] = "Ad Groups">
						<cfset stCampaign['children'][1]['iconCls'] = "adgroup-icon">
						<cfset stCampaign['children'][1]['cls'] = "campaigns">
						<cfset stCampaign['children'][1]['campaignID'] = stCampaignData.entries[i].id>
						<cfset stCampaign['children'][1]['id'] = "adgroups-" & stCampaignData.entries[i].id>
						<cfset stCampaign['children'][1]['type'] = "adg">
						<cfset stCampaign['children'][1]['qtip'] = "Right click to view context menu.">
						<cfset stCampaign['children'][2] = structNew()>
						<cfset stCampaign['children'][2]['text'] = "Targets">
						<cfset stCampaign['children'][2]['iconCls'] = "target-icon">
						<cfset stCampaign['children'][2]['cls'] = "campaigns">
						<cfset stCampaign['children'][2]['campaignID'] = stCampaignData.entries[i].id>
						<cfset stCampaign['children'][2]['type'] = "tar">
						<cfset stCampaign['children'][2]['leaf'] = true>
					
						<cfset arrayAppend(aCampaigns, duplicate(stCampaign))>
					</cfloop>
				
				<cfelseif trim(form.targetJSONFormat) eq "properties">
				
					<cfset aCampaigns = structToExtNodesStruct(stCampaignData['entries'][1])>
				</cfif>
			
				<cfoutput>#serializeJSON(aCampaigns)#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true , 'message':'The CampaignService raised an error. Try again later.','detail':'#cfcatch.detail#'}"/>
				<cfoutput>#serializeJSON(structToExtNodesStruct(oCampaignService.getError()))#</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="getAdGroups">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class adgroupservice --->
			<cfset oAdGroupService = createObject("component", "#packagepath#adgroupservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupService.setUseSandbox(bUseSandBox)>
		
			<!--- create instance of the class selector --->
			<cfset oServiceSelector = createObject("component", "#packagepath#selector")>
		
			<!--- setting the return fields --->
			<cfset oServiceSelector.setFields("Id,CampaignId,Status,CampaignName,Name,KeywordMaxCpc,KeywordContentMaxCpc,SiteMaxCpc,MaxCpm,TargetCpa,ConversionOptimizerBidType,DeduplicationMode,ProxyKeywordMaxCpc,ProxySiteMaxCpc,EnhancedCpcEnabled,PercentCpa")>
		
			<!--- filter by campaignID --->
			<cfif val(form.campaignID) neq 0>
			
				<!--- create instance of the class predicate --->
				<cfset oPredicate = createObject("component", "#packagepath#predicate")>
				<!--- setting field by which to filter the returned data --->
				<cfset oPredicate.setField("CampaignId")>
				<!--- setting the operator to use for filtering the data returned --->
				<cfset oPredicate.setOperator("EQUALS")>
				<!--- setting the value --->
				<cfset oPredicate.setValues(val(form.campaignID))>
				<!--- add predicate to the serviceSelector --->
				<cfset oServiceSelector.setPredicates(oPredicate)>
			
			<cfelseif val(form.adGroupID) neq 0>
				<!--- select a single adGroup by its id --->
				<!--- create instance of the class predicate --->
				<cfset oPredicate = createObject("component", "#packagepath#predicate")>
				<!--- setting field by which to filter the returned data --->
				<cfset oPredicate.setField("Id")>
				<!--- setting the operator to use for filtering the data returned --->
				<cfset oPredicate.setOperator("EQUALS")>
				<!--- setting the value --->
				<cfset oPredicate.setValues(val(form.adGroupID))>
				<!--- add predicate to the serviceSelector --->
				<cfset oServiceSelector.setPredicates(oPredicate)>
			</cfif>
		
			<!--- detailed error handling for calling remote methods of oAdGroupService --->
			<cftry>
			
				<!--- get the campaignPage object through the google adwords api --->
				<cfset oAdGroupPage = oAdGroupService.get(oServiceSelector)>
			
				<cfset stAdGroupData = oAdGroupPage.getObjectData(true)>
			
				<cfif trim(form.targetJSONFormat) eq "tree">
				
					<cfset aAdGroupData = ArrayNew(1)>
				
					<cfloop from="1" to="#val(stAdGroupData.totalNumEntries)#" index="i">
					
						<cfset stAdGroup = structNew()>
						<cfset stAdGroup['adGroupID'] = stAdGroupData.entries[i].id>
						<cfset stAdGroup['text'] = jsStringFormat(stAdGroupData.entries[i].name)>
						<cfset stAdGroup['iconCls'] = "adgroup-icon">
						<cfset stAdGroup['cls'] = "campaigns">
						<cfset stAdGroup['status'] = stAdGroupData.entries[i].status>
						<cfset stAdGroup['qtip'] = "Status:&nbsp;" & stAdGroupData.entries[i].status>
						<cfset stAdGroup['leaf'] = false>
						<cfset stAdGroup['type'] = 'adg'>
						<cfset stAdGroup['id'] = 'adgroup-' & stAdGroupData.entries[i].id>
						<cfset stAdGroup['children'] = arrayNew(1)>
						<cfset stAdGroup['children'][1] = structNew()>
						<cfset stAdGroup['children'][1]['text'] = "Ads">
						<cfset stAdGroup['children'][1]['id'] = "ads-" & stAdGroupData.entries[i].id>
						<cfset stAdGroup['children'][1]['adGroupID'] = stAdGroupData.entries[i].id>
						<cfset stAdGroup['children'][1]['iconCls'] = 'ads-icon'>
						<cfset stAdGroup['children'][1]['cls'] = "campaigns">
						<cfset stAdGroup['children'][1]['type'] = 'ads'>
						<cfset stAdGroup['children'][2] = structNew()>
						<cfset stAdGroup['children'][2]['cls'] = "campaigns">
						<cfset stAdGroup['children'][2]['text'] = "Criteria">
						<cfset stAdGroup['children'][2]['id'] = "criteria-" & stAdGroupData.entries[i].id>
						<cfset stAdGroup['children'][2]['iconCls'] = 'criteria-icon'>
						<cfset stAdGroup['children'][2]['adGroupID'] = stAdGroupData.entries[i].id>
						<cfset stAdGroup['children'][2]['type'] = 'crit'>
					
						<cfset arrayAppend(aAdGroupData, duplicate(stAdGroup))>
					</cfloop>
				
				<cfelseif trim(form.targetJSONFormat) eq "properties">
				
					<cfset aAdGroupData = structToExtNodesStruct(stAdGroupData['entries'][1])>
				</cfif>
			
				<cfoutput>#serializeJSON(aAdGroupData)#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true , 'message':'The AdGroupService raised an error. Try again later.'}"/>
				<cfoutput>#serializeJSON(structToExtNodesStruct(oAdGroupService.getError()))#</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="getAdGroupAds">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class adgroupservice and call method init(oService) --->
			<cfset oAdGroupAdService = createObject("component", "#packagepath#adgroupadservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupAdService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupAdService.setUseSandbox(bUseSandBox)>
		
			<!--- create instance of the class selector --->
			<cfset oServiceSelector = createObject("component", "#packagepath#selector")>
		
			<!--- setting the return fields --->
			<cfset oServiceSelector.setFields("Id,Headline")>
		
			<!--- filter by adGroupId --->
			<cfif val(form.adGroupId) neq 0>
			
				<!--- create instance of the class predicate --->
				<cfset oPredicate = createObject("component", "#packagepath#predicate")>
				<!--- setting field by which to filter the returned data --->
				<cfset oPredicate.setField("AdGroupId")>
				<!--- setting the operator to use for filtering the data returned --->
				<cfset oPredicate.setOperator("EQUALS")>
				<!--- setting the value --->
				<cfset oPredicate.setValues(val(form.AdGroupId))>
				<!--- add predicate to the serviceSelector --->
				<cfset oServiceSelector.setPredicates(oPredicate)>
			
			<cfelseif val(form.adID) neq 0>
				<!--- select a single Ad by its id --->
				<!--- create instance of the class predicate --->
				<cfset oPredicate = createObject("component", "#packagepath#predicate")>
				<!--- setting field by which to filter the returned data --->
				<cfset oPredicate.setField("Id")>
				<!--- setting the operator to use for filtering the data returned --->
				<cfset oPredicate.setOperator("EQUALS")>
				<!--- setting the value --->
				<cfset oPredicate.setValues(val(form.adID))>
				<!--- add predicate to the serviceSelector --->
				<cfset oServiceSelector.setPredicates(oPredicate)>
			</cfif>
		
			<!--- detailed error handling for calling remote methods of oAdGroupAdService --->
			<cftry>
			
				<!--- get the campaignPage object through the google adwords api --->
				<cfset oAdGroupAdPage = oAdGroupAdService.get(oServiceSelector)>
			
				<cfset stAdGroupAdData = oAdGroupAdPage.getObjectData(true)>
			
				<cfif trim(form.targetJSONFormat) eq "tree">
				
					<cfset aAdGroupAdData = ArrayNew(1)>
				
					<cfloop from="1" to="#val(stAdGroupAdData.totalNumEntries)#" index="i">
					
						<cfset stAdGroup = structNew()>
						<cfset stAdGroupAd['adID'] = stAdGroupAdData.entries[i].ad.id>
						<cfset stAdGroupAd['adGroupID'] = stAdGroupAdData.entries[i].adGroupId>
						<cfset stAdGroupAd['text'] = jsStringFormat(stAdGroupAdData.entries[i].ad.headline)>
						<cfset stAdGroupAd['iconCls'] = "ads-icon">
						<cfset stAdGroupAd['cls'] = "campaigns">
						<cfset stAdGroupAd['leaf'] = true>
						<cfset stAdGroupAd['status'] = stAdGroupAdData.entries[i].status>
						<cfset stAdGroupAd['type'] = 'ads'>
						<cfset stAdGroupAd['totalNumEntries'] = val(stAdGroupAdData.totalNumEntries)>
					
						<cfset arrayAppend(aAdGroupAdData, duplicate(stAdGroupAd))>
					</cfloop>
				
				<cfelseif trim(form.targetJSONFormat) eq "properties">
				
					<cfset aAdGroupAdData = structToExtNodesStruct(stAdGroupAdData['entries'][1])>
				</cfif>
			
				<cfoutput>#serializeJSON(aAdGroupAdData)#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true , 'message':'The AdGroupAdService raised an error. Try again later.'}"/>
				<cfoutput>#serializeJSON(structToExtNodesStruct(oAdGroupAdService.getError()))#</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="getAdGroupCriteria">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class adgroupservice and call method init(oService) --->
			<cfset oAdGroupCriterionService = createObject("component", 
			                                               "#packagepath#adgroupcriterionservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupCriterionService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupCriterionService.setUseSandbox(bUseSandBox)>
		
			<!--- create instance of the class selector --->
			<cfset oServiceSelector = createObject("component", "#packagepath#selector")>
		
			<!--- setting the return fields --->
			<cfset oServiceSelector.setFields("AdGroupId,KeywordText,PlacementUrl,UserInterestName,UserListName,Text")>
		
			<!--- filter by adGroupId --->
			<cfif val(form.adGroupId) neq 0>
			
				<!--- create instance of the class predicate --->
				<cfset oPredicate = createObject("component", "#packagepath#predicate")>
				<!--- setting field by which to filter the returned data --->
				<cfset oPredicate.setField("AdGroupId")>
				<!--- setting the operator to use for filtering the data returned --->
				<cfset oPredicate.setOperator("EQUALS")>
				<!--- setting the value --->
				<cfset oPredicate.setValues(val(form.AdGroupId))>
				<!--- add predicate to the serviceSelector --->
				<cfset oServiceSelector.setPredicates(oPredicate)>
			
			<cfelseif val(form.criterionID) neq 0>
				<!--- select a single criterion by its id --->
				<!--- create instance of the class predicate --->
				<cfset oPredicate = createObject("component", "#packagepath#predicate")>
				<!--- setting field by which to filter the returned data --->
				<cfset oPredicate.setField("Id")>
				<!--- setting the operator to use for filtering the data returned --->
				<cfset oPredicate.setOperator("EQUALS")>
				<!--- setting the value --->
				<cfset oPredicate.setValues(val(form.criterionID))>
				<!--- add predicate to the serviceSelector --->
				<cfset oServiceSelector.setPredicates(oPredicate)>
			</cfif>
		
			<!--- detailed error handling for calling remote methods of oAdGroupCriterionService --->
			<cftry>
			
				<!--- get the campaignPage object through the google adwords api --->
				<cfset oAdGroupCriterionPage = oAdGroupCriterionService.get(oServiceSelector)>
			
				<cfset stAdGroupCriterionData = oAdGroupCriterionPage.getObjectData(true)>
			
				<cfif trim(form.targetJSONFormat) eq "tree">
				
					<cfset aAdGroupCriterionData = ArrayNew(1)>
				
					<cfloop from="1" to="#val(stAdGroupCriterionData.totalNumEntries)#" index="i">
					
						<cfset stAdGroupCriterion = structNew()>
						<cfset stAdGroupCriterion['criterionID'] = stAdGroupCriterionData.entries[i].criterion.id>
					
						<!--- check the different criterion types --->
						<cfif stAdGroupCriterionData.entries[i].criterion["Criterion.Type"] eq "Keyword">
							<cfset stAdGroupCriterion['text'] = jsStringFormat("Keyword: " & stAdGroupCriterionData.entries[i].criterion.text)>
						<cfelseif stAdGroupCriterionData.entries[i].criterion["Criterion.Type"] eq "Placement">
							<cfset stAdGroupCriterion['text'] = jsStringFormat("Placement: " & stAdGroupCriterionData.entries[i].criterion.url)>
						<cfelseif stAdGroupCriterionData.entries[i].criterion["Criterion.Type"] eq "Product">
							<cfset stAdGroupCriterion['text'] = jsStringFormat("Product: " & stAdGroupCriterionData.entries[i].criterion.text)>
						<cfelseif stAdGroupCriterionData.entries[i].criterion["Criterion.Type"] eq "CriterionUserInterest">
							<cfset stAdGroupCriterion['text'] = jsStringFormat("UserInterestName: " & stAdGroupCriterionData.entries[i].criterion.userInterestName)>
						<cfelseif stAdGroupCriterionData.entries[i].criterion["Criterion.Type"] eq "CriterionUserList">
							<cfset stAdGroupCriterion['text'] = jsStringFormat("Userlistname: " & stAdGroupCriterionData.entries[i].criterion.userListName)>
						<cfelseif stAdGroupCriterionData.entries[i].criterion["Criterion.Type"] eq "Vertical">
							<cfset stAdGroupCriterion['text'] = jsStringFormat("VerticalPath: " & arrayToList(stAdGroupCriterionData.entries[i].criterion.path))>
						</cfif>
					
						<cfset stAdGroupCriterion['adGroupID'] = stAdGroupCriterionData.entries[i].adGroupId>
						<cfset stAdGroupCriterion['iconCls'] = "criteria-icon">
						<cfset stAdGroupCriterion['cls'] = "campaigns">
						<cfset stAdGroupCriterion['leaf'] = true>
						<cfset stAdGroupCriterion['type'] = 'crit'>
					
						<cfset arrayAppend(aAdGroupCriterionData, stAdGroupCriterion)>
					</cfloop>
				
				<cfelseif trim(form.targetJSONFormat) eq "properties">
				
					<cfset aAdGroupCriterionData = structToExtNodesStruct(stAdGroupCriterionData['entries'][1])>
				</cfif>
			
				<cfoutput>#serializeJSON(aAdGroupCriterionData)#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true , 'message':'The AdGroupCriterionService raised an error. Try again later.'}"/>
				<cfoutput>#serializeJSON(structToExtNodesStruct(oAdGroupCriterionService.getError()))#</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="getClientData">
		
			<!--- create instance of the class servicedaccountservice and call method init(oService) --->
			<cfset oServicedAccountService = createObject("component", "#packagepath#servicedaccountservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oServicedAccountService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oServicedAccountService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oServicedAccountService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create instance of the class selector --->
			<cfset oServicedAccountSelector = createObject("component", 
			                                               "#packagepath#servicedaccountselector")>
		
			<!--- setting the return fields --->
			<cfset oServicedAccountSelector.setEnablePaging(false)>
		
			<!--- detailed error handling for calling remote methods of oServicedAccountService --->
			<cftry>
			
				<!--- get the client daccount ata through the google adwords api --->
				<cfset oServicedAccountGraph = oServicedAccountService.get(oServicedAccountSelector)>
			
				<cfset stClientData = oServicedAccountGraph.getObjectData(true)>
			
				<cfoutput>#serializeJSON(stClientData.accounts)#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true , 'message':'The ServicedAccountService raised an error. Try again later.'}"/>
				<cfoutput>#serializeJSON(structToExtNodesStruct(oServicedAccountService.getError()))#</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="setCampaignStatus">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class campaignservice  --->
			<cfset oCampaignService = createObject("component", "#packagepath#campaignservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oCampaignService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oCampaignService.setUseSandbox(bUseSandBox)>
		
			<!--- create a campaign instance --->
			<cfset oCampaign = createObject("component", "#packagepath#campaign")>
		
			<!--- setting the campaign id --->
			<cfset oCampaign.setID(val(form.campaignID))>
		
			<!--- setting the campaign status --->
			<cfset oCampaign.setStatus(trim(form.status))>
		
			<!--- create a campaignoperation instance --->
			<cfset oCampaignOperation = createObject("component", "#packagepath#campaignoperation")>
		
			<!--- set operator to set --->
			<cfset oCampaignOperation.setOperator("SET")>
		
			<!--- set operand to the campaign --->
			<cfset oCampaignOperation.setOperand(oCampaign)>
		
			<cftry>
				<!--- update the campaign --->
				<cfset oCampaignReturnValue = oCampaignService.mutate(oCampaignOperation)>
			
				<cfset stUpdatedCapaignData = oCampaignReturnValue.getObjectData(true)>
			
				<cfset aUpdatedCapaignData = structToExtNodesStruct(stUpdatedCapaignData.value)>
			
				<cfoutput>#serializeJSON(aUpdatedCapaignData)#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true , 'message':'The CampaignService raised an error. Try again later.'}"/>
				<cfoutput>#serializeJSON(structToExtNodesStruct(oCampaignService.getError()))#</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="setAdGroupStatus">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class adgroupservice --->
			<cfset oAdGroupService = createObject("component", "#packagepath#adgroupservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupService.setUseSandbox(bUseSandBox)>
		
			<!--- create a adgroup instance --->
			<cfset oAdGroup = createObject("component", "#packagepath#adgroup")>
		
			<!--- setting the adgroup id --->
			<cfset oAdGroup.setID(val(form.adGroupID))>
		
			<!--- setting the adgroup status --->
			<cfset oAdGroup.setStatus(trim(form.status))>
		
			<!--- create a adgroupoperation instance --->
			<cfset oAdGroupOperation = createObject("component", "#packagepath#adgroupoperation")>
		
			<!--- set operator to set --->
			<cfset oAdGroupOperation.setOperator("SET")>
		
			<!--- set operand to the adgroup --->
			<cfset oAdGroupOperation.setOperand(oAdGroup)>
		
			<cftry>
				<!--- update the campaign --->
				<cfset oAdGroupReturnValue = oAdGroupService.mutate(oAdGroupOperation)>
			
				<cfset stUpdatedAdGroupData = oAdGroupReturnValue.getObjectData(true)>
			
				<cfset aUpdatedAdGroupData = structToExtNodesStruct(stUpdatedAdGroupData.value)>
			
				<cfoutput>#serializeJSON(aUpdatedAdGroupData)#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true , 'message':'The AdGroupService raised an error. Try again later.'}"/>
				<cfdump var="#cfcatch#">
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="addCampaign">
		
			<!---<cfoutput>{'success':false}</cfoutput><cfabort>--->
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class campaignservice and call method init(oService) --->
			<cfset oCampaignService = createObject("component", "#packagepath#campaignservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oCampaignService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oCampaignService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oCampaignService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create a money instance --->
			<cfset oMoney = createObject("component", "#packagepath#money")>
		
			<!--- setting the amount in micros --->
			<cfset oMoney.setMicroAmount(1000000000)>
		
			<!--- create a budget instance --->
			<cfset oBudget = createObject("component", "#packagepath#budget")>
		
			<!--- set amount to oMoney --->
			<cfset oBudget.setAmount(oMoney)>
		
			<!--- setting the period to a value of "Daily" --->
			<cfset oBudget.setPeriod("DAILY")>
		
			<!--- create a campaign instance --->
			<cfset oCampaign = createObject("component", "#packagepath#campaign")>
		
			<!--- giving the campaign a random name --->
			<cfset oCampaign.setName(trim(form.campaignName))>
		
			<!--- set budget to oBudget --->
			<cfset oCampaign.setBudget(oBudget)>
		
			<!--- create instance of manualcpc (a biddingStrategy) --->
			<cfset oManualCPC = createObject("component", "#packagepath#manualcpc")>
		
			<!--- set the biddingStrategy to manualCPC --->
			<cfset oCampaign.setBiddingStrategy(oManualCPC)>
		
			<!--- create a campaignoperation instance --->
			<cfset oCampaignOperation = createObject("component", "#packagepath#campaignoperation")>
		
			<!--- set operator to ADD --->
			<cfset oCampaignOperation.setOperator("ADD")>
		
			<!--- set operand to the new campaign --->
			<cfset oCampaignOperation.setOperand(oCampaign)>
		
			<cftry>
			
				<!--- add the new campaign --->
				<cfset oCampaignReturnValue = oCampaignService.mutate(oCampaignOperation)>
			
				<!--- get all data from the nested set of objects and return the data as a structure --->
				<cfset stData = oCampaignReturnValue.getObjectData(true).value>
			
				<cfoutput>{success:true,campaignid:#stData[1].id#}</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true ,'message':'The CampaignService raised an error. Watch the error details at the details panel.'}"/>
				<cfset jsonData = serializeJSON(structToExtNodesStruct(oCampaignService.getError()))>
				<cfoutput>{success:false,data:#jsonData#}</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="addAdGroup">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class adgroupservice --->
			<cfset oAdGroupService = createObject("component", "#packagepath#adgroupservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oAdGroupService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create an adgroup instance --->
			<cfset oAdGroup = createObject("component", "#packagepath#adgroup")>
		
			<!--- giving the adgroup a name --->
			<cfset oAdGroup.setName(trim(form.adgroupname))>
		
			<!--- setting the adGroups campaignID --->
			<cfset oAdGroup.setCampaignID(val(form.campaignID))>
		
			<!--- create a adgroupoperation instance --->
			<cfset oAdGroupOperation = createObject("component", "#packagepath#adgroupoperation")>
		
			<!--- set operator to ADD --->
			<cfset oAdGroupOperation.setOperator("ADD")>
		
			<!--- set operand to the new campaign --->
			<cfset oAdGroupOperation.setOperand(oAdGroup)>
		
			<cftry>
			
				<!--- add the new adgroup --->
				<cfset oAdGroupReturnValue = oAdGroupService.mutate(oAdGroupOperation)>
			
				<!--- get all data from the nested set of objects and return the data as a structure --->
				<cfset stData = oAdGroupReturnValue.getObjectData(true).value>
			
				<cfoutput>{success:true,adgroupid:#stData[1].id#,campaignid:#stData[1].campaignId#}</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true ,'message':'The AdGroupService raised an error. Watch the error details at the details panel.'}"/>
				<cfset jsonData = serializeJSON(structToExtNodesStruct(oAdGroupService.getError()))>
				<cfoutput>{success:false,data:#jsonData#}</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="addTextAd">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class adgroupservice --->
			<cfset oAdGroupAdService = createObject("component", "#packagepath#adgroupadservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupAdService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupAdService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oAdGroupAdService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create a textad instance --->
			<cfset oTextAd = createObject("component", "#packagepath#textad")>
		
			<!--- setting the url --->
			<cfset oTextAd.setUrl(trim(form.url))>
		
			<!--- setting the displayurl --->
			<cfset oTextAd.setDisplayUrl(trim(form.dspurl))>
		
			<!--- setting the headline --->
			<cfset oTextAd.setHeadline(trim(form.headline))>
		
			<!--- setting description1 (line no 1) --->
			<cfset oTextAd.setDescription1(trim(form.desc1))>
		
			<!--- setting description2 (line no 2) --->
			<cfset oTextAd.setDescription2(trim(form.desc2))>
		
			<!--- create an adgroupad instance --->
			<cfset oAdGroupAd = createObject("component", "#packagepath#adgroupad")>
		
			<!--- setting the adGroupId --->
			<cfset oAdGroupAd.setAdGroupId(val(form.adgroupID))>
		
			<!--- setting the a textad inside oAdGroup --->
			<cfset oAdGroupAd.setAd(oTextAd)>
		
			<!--- create a adgroupadadoperation instance --->
			<cfset oAdGroupAdOperation = createObject("component", "#packagepath#adgroupadoperation")>
		
			<!--- set operator to ADD --->
			<cfset oAdGroupAdOperation.setOperator("ADD")>
		
			<!--- set operand to the new adgroupad --->
			<cfset oAdGroupAdOperation.setOperand(oAdGroupAd)>
		
			<cftry>
			
				<!--- add the new TextAd --->
				<cfset oAdGroupAdReturnValue = oAdGroupAdService.mutate(oAdGroupAdOperation)>
			
				<!--- get all data from the nested set of objects and return the data as a structure --->
				<cfset stData = oAdGroupAdReturnValue.getObjectData(true).value>
			
				<cfoutput>{success:true,adid:#stData[1].ad.id#,adgroupid:#stData[1].adGroupId#}</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true ,'message':'The AdGroupAdService raised an error. Watch the error details at the details panel.'}"/>
				<cfset jsonData = serializeJSON(structToExtNodesStruct(oAdGroupAdService.getError()))>
				<cfoutput>{success:false,data:#jsonData#}</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="delAd">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class adgroupservice --->
			<cfset oAdGroupAdService = createObject("component", "#packagepath#adgroupadservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupAdService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupAdService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oAdGroupAdService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create base class ad to avoid setting type specific fields --->
			<cfset oAd = createObject("component", "#packagepath#ad")>
		
			<!--- setting the adID --->
			<cfset oAd.setId(val(form.adId))>
		
			<!--- create an adgroupad instance --->
			<cfset oAdGroupAd = createObject("component", "#packagepath#adgroupad")>
		
			<!--- setting the adGroupId --->
			<cfset oAdGroupAd.setAdGroupId(val(form.adgroupID))>
		
			<!--- setting the a textad inside oAdGroup --->
			<cfset oAdGroupAd.setAd(oAd)>
		
			<!--- create a adgroupadadoperation instance --->
			<cfset oAdGroupAdOperation = createObject("component", "#packagepath#adgroupadoperation")>
		
			<!--- set operator to remove --->
			<cfset oAdGroupAdOperation.setOperator("REMOVE")>
		
			<!--- set operand to the adgroupad --->
			<cfset oAdGroupAdOperation.setOperand(oAdGroupAd)>
		
			<cftry>
			
				<!--- add the new TextAd --->
				<cfset oAdGroupAdReturnValue = oAdGroupAdService.mutate(oAdGroupAdOperation)>
			
				<!--- get all data from the nested set of objects and return the data as a structure --->
				<cfset stData = oAdGroupAdReturnValue.getObjectData(true).value>
			
				<cfoutput>{success:true,adid:#stData[1].ad.id#,adgroupid:#stData[1].adGroupId#}</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true ,'message':'The AdGroupAdService raised an error. Watch the error details at the details panel.'}"/>
				<cfset jsonData = serializeJSON(structToExtNodesStruct(oAdGroupAdService.getError()))>
				<cfoutput>{success:false,data:#jsonData#}</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="delCriterion">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class AdGroupCriterionService --->
			<cfset oAdGroupCriterionService = createObject("component", 
			                                               "#packagepath#adgroupcriterionservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupCriterionService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupCriterionService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oAdGroupCriterionService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create base class ad to avoid setting type specific fields --->
			<cfset oCriterion = createObject("component", "#packagepath#criterion")>
		
			<!--- setting the criterionID --->
			<cfset oCriterion.setId(val(form.criterionID))>
		
			<!--- create an adgroupad instance --->
			<cfset oAdGroupCriterion = createObject("component", "#packagepath#adgroupcriterion")>
		
			<!--- setting the adGroupId --->
			<cfset oAdGroupCriterion.setAdGroupId(val(form.adgroupID))>
		
			<!--- setting the a criterion inside oAdGroupCriterion --->
			<cfset oAdGroupCriterion.setCriterion(oCriterion)>
		
			<!--- create a AdGroupCriterionOperation instance --->
			<cfset oAdGroupCriterionOperation = createObject("component", 
			                                                 "#packagepath#adgroupcriterionoperation")>
		
			<!--- set operator to remove --->
			<cfset oAdGroupCriterionOperation.setOperator("REMOVE")>
		
			<!--- set operand to the AdGroupCriterion --->
			<cfset oAdGroupCriterionOperation.setOperand(oAdGroupCriterion)>
		
			<cftry>
			
				<!--- remove the criterion --->
				<cfset oAdGroupCriterionReturnValue = oAdGroupCriterionService.mutate(oAdGroupCriterionOperation)>
			
				<!--- get all data from the nested set of objects and return the data as a structure --->
				<cfset stData = oAdGroupCriterionReturnValue.getObjectData(true).value>
			
				<cfoutput>{success:true,criterionid:#stData[1].criterion.id#,adgroupid:#stData[1].adGroupId#}</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true ,'message':'The AdGroupAdService raised an error. Watch the error details at the details panel.'}"/>
				<cfset jsonData = serializeJSON(structToExtNodesStruct(oAdGroupAdService.getError()))>
				<cfoutput>{success:false,data:#jsonData#}</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="addKeyword">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class AdGroupCriterionService and call method init(oService) --->
			<cfset oAdGroupCriterionService = createObject("component", 
			                                               "#packagepath#adgroupcriterionservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oAdGroupCriterionService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oAdGroupCriterionService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oAdGroupCriterionService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create a keyword instance --->
			<cfset oKeyword = createObject("component", "#packagepath#keyword")>
		
			<!--- setting the keyword text --->
			<cfset oKeyword.setText(trim(form.keyword))>
		
			<!--- setting the matchType --->
			<cfset oKeyword.setMatchType(trim(form.matchType))>
		
			<!--- create an BiddableAdGroupCriterion instance --->
			<cfset oBiddableAdGroupCriterion = createObject("component", 
			                                                "#packagepath#biddableadgroupcriterion")>
		
			<!--- setting the adGroupId --->
			<cfset oBiddableAdGroupCriterion.setAdGroupId(val(form.adgroupID))>
		
			<!--- setting criterion to oCriterion --->
			<cfset oBiddableAdGroupCriterion.setCriterion(oKeyword)>
		
			<!--- create a adgroupcriterionoperation instance --->
			<cfset oAdGroupCriterionOperation = createObject("component", 
			                                                 "#packagepath#adgroupcriterionoperation")>
		
			<!--- set operator to ADD --->
			<cfset oAdGroupCriterionOperation.setOperator("ADD")>
		
			<!--- set operand to the new biddableadgroupcriterion --->
			<cfset oAdGroupCriterionOperation.setOperand(oBiddableAdGroupCriterion)>
		
			<cftry>
			
				<!--- add the new keyword --->
				<cfset oAdGroupCriterionReturnValue = oAdGroupCriterionService.mutate(oAdGroupCriterionOperation)>
			
				<!--- get all data from the nested set of objects and return the data as a structure --->
				<cfset stData = oAdGroupCriterionReturnValue.getObjectData(true).value>
			
				<cfoutput>{success:true,criterionid:#stData[1].criterion.id#,adgroupid:#stData[1].adGroupId#}</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true ,'message':'The AdGroupCriterionService raised an error. Watch the error details at the details panel.'}"/>
				<cfset jsonData = serializeJSON(structToExtNodesStruct(oAdGroupCriterionService.getError()))>
				<cfoutput>{success:false,data:#jsonData#}</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
		<cfcase value="getTargetList">
		
			<!--- setting clientCustomerId --->
			<cfset oAdwordsUser.setClientCustomerId(val(form.clientCustomerId))>
		
			<!--- create instance of the class campaigntargetservice and call method init(oService) --->
			<cfset oCampaignTargetService = createObject("component", "#packagepath#campaigntargetservice")>
		
			<!--- setting the adwordsUser --->
			<cfset oCampaignTargetService.setAdwordsUser(oAdwordsUser)>
		
			<!--- switch to sandbox mode --->
			<cfset oCampaignTargetService.setUseSandbox(bUseSandBox)>
		
			<!--- use defaultLogging and log request and response to logs directory --->
			<cfset oCampaignTargetService.setUseDefaultLogging(bUseLogging)>
		
			<!--- create instance of the class campaigntargetselector --->
			<cfset oCampaignTargetSelector = createObject("component", "#packagepath#campaigntargetselector")>
		
			<!--- setting the campaignID to get campaign specific targetList --->
			<cfset oCampaignTargetSelector.setCampaignIds(val(form.campaignID))>
		
			<cftry>
			
				<cfset oCampaignTargetPage = oCampaignTargetService.get(oCampaignTargetSelector)>
			
				<cfoutput>#serializeJSON(structToExtNodesStruct(oCampaignTargetPage.getObjectData(true).entries))#</cfoutput>
			
			<cfcatch>
				<cfheader statuscode="550" 
				          statustext="{'failure':true ,'message':'The CampaignTargetService raised an error. Try again later.'}"/>
				<cfoutput>#serializeJSON(structToExtNodesStruct(oCampaignTargetService.getError()))#</cfoutput>
			</cfcatch>
			
			</cftry>
		
		</cfcase>
	
	</cfswitch>
	
<cfcatch>
	<cfheader statuscode="550" statustext="{'failure':true , 'message':'Unexpected Error'}"/>
	<cfoutput>{'failure':true,'message':'#serializeJSON(cfcatch)#'}</cfoutput>
</cfcatch>

</cftry>

<cfsetting enablecfoutputonly="false">