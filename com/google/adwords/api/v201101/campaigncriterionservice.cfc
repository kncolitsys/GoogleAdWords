<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignCriterionService" hint="Use this service to manage campaign-level criteria. A campaign-level negative criterion prevents the campaign's ads from showing on specific placements, for certain categories of placements, or for specific keywords. Only negative criteria are supported at the campaign level." extends="utils">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>


<cffunction name="get" access="public" returntype="CampaignCriterionPage" hint="Gets campaign criteria. @param serviceSelector the selector specifying the CampaignCriterions to return. @return a list of campaign criteria @throws ApiException when there is at least one error with the request" output="No">
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
<cfset var oCampaignCriterionServiceGet="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oCampaignCriterionServiceGet=createObject("component","campaigncriterionserviceget")>
		<cfset oCampaignCriterionServiceGet.setServiceSelector(serviceSelector)>
		
		<cfset variables["instance"]["get"]=oCampaignCriterionServiceGet>
		
		<cfset aProperties=arrayNew(1)>
		<!--- create the attribute collection for this property llection --->
		<cfset stProperty=structNew()/>
		<!--- set attribute values. --->
		<cfset stProperty["name"]="get"/>
		<!--- set attribute seq. --->
		<cfset stProperty["seq"]=1/>
		<!--- add this attribute to the property attribute collection array. --->
		<cfset arrayAppend(aProperties,stProperty)/>
		<!--- overwrite the meta data properties. --->
		<cfset stTemp=structNew()>
		<cfset stTemp['properties']=aProperties/>
		<cfset setInjectionData(stTemp)>
		
		<!--- call webservice and get back xml response from the google adwords api--->
		<cfset stResponse=getService().callWebService("CampaignCriterionService",this)>
		
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
					<cfset oTemp=createObject("component","CampaignCriterionPage")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an CampaignCriterionPage object and set data inside returning object --->
				<cfset oTemp=createObject("component","CampaignCriterionPage")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oCampaignCriterionService.getService().SOAPRequest">
			</cfif>
		
		</cfif>

		<cfcatch>
			<!--- okay, we have an error, so rethrow the error --->
			<cfrethrow>
		</cfcatch>
		
	</cftry>
	
	<cfreturn oReturnValue>	
		
</cffunction>

<cffunction name="mutate" access="public" returntype="CampaignCriterionReturnValue" hint="Adds, removes or updates campaign criteria. @param operations the operations to do @return the added campaign criteria (without any optional parts) @throws ApiException when there is at least one error with the request" output="No">
<cfargument name="operations" required="no" type="any" hint="This field must not contain null elements. This field must contain at least one element. This field is required and should not be null. The following Operators are supported: ADD, REMOVE."> 
<cfset var stResponse=StructNew()>
<cfset var aResponse="">
<cfset var j="">
<cfset var aTemp=arrayNew(1)>
<cfset var oTemp="">
<cfset var oReturnValue="">
<cfset var aProperties="">
<cfset var stProperty="">
<cfset var stTemp="">
<cfset var oCampaignCriterionServiceMutate="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oCampaignCriterionServiceMutate=createObject("component","campaigncriterionservicemutate")>
		<cfset oCampaignCriterionServiceMutate.setOperations(operations)>
		
		<cfset variables["instance"]["mutate"]=oCampaignCriterionServiceMutate>
		
		<cfset aProperties=arrayNew(1)>
		<!--- create the attribute collection for this property llection --->
		<cfset stProperty=structNew()/>
		<!--- set attribute values. --->
		<cfset stProperty["name"]="mutate"/>
		<!--- set attribute seq. --->
		<cfset stProperty["seq"]=1/>
		<!--- add this attribute to the property attribute collection array. --->
		<cfset arrayAppend(aProperties,stProperty)/>
		<!--- overwrite the meta data properties. --->
		<cfset stTemp=structNew()>
		<cfset stTemp['properties']=aProperties/>
		<cfset setInjectionData(stTemp)>
		
		<!--- call webservice and get back xml response from the google adwords api--->
		<cfset stResponse=getService().callWebService("CampaignCriterionService",this)>
		
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
					<cfset oTemp=createObject("component","CampaignCriterionReturnValue")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an CampaignCriterionReturnValue object and set data inside returning object --->
				<cfset oTemp=createObject("component","CampaignCriterionReturnValue")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oCampaignCriterionService.getService().SOAPRequest">
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
	
	<cfparam name="variables['instance']['serviceUrl']" default="https://adwords.google.com/api/adwords/cm/v201101/CampaignCriterionService">
	<cfreturn variables["instance"]["serviceUrl"]>
	
</cffunction>

<cffunction name="setServiceUrl" access="public" returntype="void" output="No">
<cfargument name="serviceUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceUrl"]=arguments["serviceUrl"]>
		
</cffunction>

<cffunction name="getSandboxUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sandboxUrl']" default="https://adwords-sandbox.google.com/api/adwords/cm/v201101/CampaignCriterionService">
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
