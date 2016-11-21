<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="DataService" hint="A service to return Ads Campaign Management data matching a {@Selector." extends="utils">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>


<cffunction name="getAdGroupBidLandscape" access="public" returntype="AdGroupBidLandscapePage" hint="Returns a list of bid landscapes for the ad groups specified in the selector. @param serviceSelector Selects the entities to return bid landscapes for. @return A list of bid landscapes. @throws ApiException when there is at least one error with the request." output="No">
<cfargument name="serviceSelector" required="no" type="Selector" hint="This field is required and should not be null."> 
<cfset var stResponse=StructNew()>
<cfset var aResponse="">
<cfset var j="">
<cfset var aTemp=arrayNew(1)>
<cfset var oTemp="">
<cfset var oReturnValue="">
<cfset var aProperties="">
<cfset var stProperty="">
<cfset var stTemp="">
<cfset var oDataServiceGetAdGroupBidLandscape="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oDataServiceGetAdGroupBidLandscape=createObject("component","dataservicegetadgroupbidlandscape")>
		<cfset oDataServiceGetAdGroupBidLandscape.setServiceSelector(serviceSelector)>
		
		<cfset variables["instance"]["getAdGroupBidLandscape"]=oDataServiceGetAdGroupBidLandscape>
		
		<cfset aProperties=arrayNew(1)>
		<!--- create the attribute collection for this property llection --->
		<cfset stProperty=structNew()/>
		<!--- set attribute values. --->
		<cfset stProperty["name"]="getAdGroupBidLandscape"/>
		<!--- set attribute seq. --->
		<cfset stProperty["seq"]=1/>
		<!--- add this attribute to the property attribute collection array. --->
		<cfset arrayAppend(aProperties,stProperty)/>
		<!--- overwrite the meta data properties. --->
		<cfset stTemp=structNew()>
		<cfset stTemp['properties']=aProperties/>
		<cfset setInjectionData(stTemp)>
		
		<!--- call webservice and get back xml response from the google adwords api--->
		<cfset stResponse=getService().callWebService("DataService",this)>
		
		<!--- get the response and store it into aResponse --->
		<cfset aResponse=StructFindKey(stResponse,"rval")>
		
		<!--- check for response --->
		<cfif ArrayLen(aResponse) gt 0>
		
			<!--- handle the response --->
			
			<!--- get the data --->
			<cfset aResponse=Evaluate("stResponse#aResponse[1].path#")>
			
			<cfif isArray(aResponse)>
				<!--- return an array of objects --->
				<cfloop from="1" to="#arrayLen(aResponse)#" index="j">
					<cfset oTemp=createObject("component","AdGroupBidLandscapePage")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an AdGroupBidLandscapePage object and set data inside returning object --->
				<cfset oTemp=createObject("component","AdGroupBidLandscapePage")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oDataService.getService().SOAPRequest">
			</cfif>
		
		</cfif>

		<cfcatch>
			<!--- okay, we have an error, so rethrow the error --->
			<cfrethrow>
		</cfcatch>
		
	</cftry>
	
	<cfreturn oReturnValue>	
		
</cffunction>

<cffunction name="getCriterionBidLandscape" access="public" returntype="CriterionBidLandscapePage" hint="Returns a list of bid landscapes for the criteria specified in the selector. @param serviceSelector Selects the entities to return bid landscapes for. @return A list of bid landscapes. @throws ApiException when there is at least one error with the request." output="No">
<cfargument name="serviceSelector" required="no" type="Selector" hint="This field is required and should not be null."> 
<cfset var stResponse=StructNew()>
<cfset var aResponse="">
<cfset var j="">
<cfset var aTemp=arrayNew(1)>
<cfset var oTemp="">
<cfset var oReturnValue="">
<cfset var aProperties="">
<cfset var stProperty="">
<cfset var stTemp="">
<cfset var oDataServiceGetCriterionBidLandscape="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oDataServiceGetCriterionBidLandscape=createObject("component","dataservicegetcriterionbidlandscape")>
		<cfset oDataServiceGetCriterionBidLandscape.setServiceSelector(serviceSelector)>
		
		<cfset variables["instance"]["getCriterionBidLandscape"]=oDataServiceGetCriterionBidLandscape>
		
		<cfset aProperties=arrayNew(1)>
		<!--- create the attribute collection for this property llection --->
		<cfset stProperty=structNew()/>
		<!--- set attribute values. --->
		<cfset stProperty["name"]="getCriterionBidLandscape"/>
		<!--- set attribute seq. --->
		<cfset stProperty["seq"]=1/>
		<!--- add this attribute to the property attribute collection array. --->
		<cfset arrayAppend(aProperties,stProperty)/>
		<!--- overwrite the meta data properties. --->
		<cfset stTemp=structNew()>
		<cfset stTemp['properties']=aProperties/>
		<cfset setInjectionData(stTemp)>
		
		<!--- call webservice and get back xml response from the google adwords api--->
		<cfset stResponse=getService().callWebService("DataService",this)>
		
		<!--- get the response and store it into aResponse --->
		<cfset aResponse=StructFindKey(stResponse,"rval")>
		
		<!--- check for response --->
		<cfif ArrayLen(aResponse) gt 0>
		
			<!--- handle the response --->
			
			<!--- get the data --->
			<cfset aResponse=Evaluate("stResponse#aResponse[1].path#")>
			
			<cfif isArray(aResponse)>
				<!--- return an array of objects --->
				<cfloop from="1" to="#arrayLen(aResponse)#" index="j">
					<cfset oTemp=createObject("component","CriterionBidLandscapePage")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an CriterionBidLandscapePage object and set data inside returning object --->
				<cfset oTemp=createObject("component","CriterionBidLandscapePage")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oDataService.getService().SOAPRequest">
			</cfif>
		
		</cfif>

		<cfcatch>
			<!--- okay, we have an error, so rethrow the error --->
			<cfrethrow>
		</cfcatch>
		
	</cftry>
	
	<cfreturn oReturnValue>	
		
</cffunction>
 
<cffunction name="getService" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['service']" default="#createObject('component','service')#">
	<cfreturn variables["instance"]["service"]>
	
</cffunction>

<cffunction name="setService" access="public" returntype="void" output="No">
<cfargument name="service" required="Yes" type="any">
	
	<cfset variables["instance"]["service"]=arguments["service"]>
		
</cffunction>

<cffunction name="getAdwordsUser" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adwordsUser']" default="">
	<cfreturn variables["instance"]["adwordsUser"]>
	
</cffunction>

<cffunction name="setAdwordsUser" access="public" returntype="void" output="No">
<cfargument name="adwordsUser" required="Yes" type="any">
	
	<cfset variables["instance"]["adwordsUser"]=arguments["adwordsUser"]>
		
</cffunction>

<cffunction name="getServiceUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['serviceUrl']" default="https://adwords.google.com/api/adwords/cm/v201101/DataService">
	<cfreturn variables["instance"]["serviceUrl"]>
	
</cffunction>

<cffunction name="setServiceUrl" access="public" returntype="void" output="No">
<cfargument name="serviceUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceUrl"]=arguments["serviceUrl"]>
		
</cffunction>

<cffunction name="getSandboxUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sandboxUrl']" default="https://adwords-sandbox.google.com/api/adwords/cm/v201101/DataService">
	<cfreturn variables["instance"]["sandboxUrl"]>
	
</cffunction>

<cffunction name="setSandboxUrl" access="public" returntype="void" output="No">
<cfargument name="sandboxUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["sandboxUrl"]=arguments["sandboxUrl"]>
		
</cffunction>

<cffunction name="getUseSandbox" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['useSandbox']" default="false">
	<cfreturn variables["instance"]["useSandbox"]>
	
</cffunction>

<cffunction name="setUseSandbox" access="public" returntype="void" output="No">
<cfargument name="useSandbox" required="Yes" type="boolean">
	
	<cfset variables["instance"]["useSandbox"]=arguments["useSandbox"]>
		
</cffunction>

<cffunction name="getUseDefaultLogging" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['useDefaultLogging']" default="false">
	<cfreturn variables["instance"]["useDefaultLogging"]>
	
</cffunction>

<cffunction name="setUseDefaultLogging" access="public" returntype="void" output="No">
<cfargument name="useDefaultLogging" required="Yes" type="boolean">
	
	<cfset variables["instance"]["useDefaultLogging"]=arguments["useDefaultLogging"]>
		
</cffunction>

<cffunction name="getError" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['error']" default="#structNew()#">
	<cfreturn variables["instance"]["error"]>
	
</cffunction>

<cffunction name="setError" access="public" returntype="void" output="No">
<cfargument name="error" required="Yes" type="any">
	
	<cfset variables["instance"]["error"]=arguments["error"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
