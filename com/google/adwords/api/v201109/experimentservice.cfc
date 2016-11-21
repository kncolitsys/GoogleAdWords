<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ExperimentService" hint="Use this service to set up campaign experiments, which let you accurately test and measure changes to your keywords, bids, ad groups and placements. Creating and running a campaign experiment involves the following steps: Creating an Experiment object that describes the experiment itself, including the experiment ID, date range, and the percentage of traffic that will be directed to the experiment. Setting up control and experimental campaign entities by setting the experimentData field on AdGroup and BiddableAdGroupCriterion objects. Use the experimentDataStatus field to choose if the entity should be part of a control group, part of the experiment group, or if the entity should handle both control and experimental traffic. For more information on campaign experiments, including tracking the performance of an experiment, see the AdWords Help Center." extends="utils">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>


<cffunction name="get" access="public" returntype="ExperimentPage" hint="Returns a list of experiments specified by the experiment selector from the customer's account. @param serviceSelector the selector specifying the Experiments to return. If selector is empty, all experiments are returned. @return list of experiments meeting all the criteria of each selector. @throws ApiException if problems occurred while fetching experiment information." output="No">
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
<cfset var oExperimentServiceGet="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oExperimentServiceGet=createObject("component","experimentserviceget")>
		<cfset oExperimentServiceGet.setServiceSelector(serviceSelector)>
		
		<cfset variables["instance"]["get"]=oExperimentServiceGet>
		
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
		<cfset stResponse=getService().callWebService("ExperimentService",this)>
		
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
					<cfset oTemp=createObject("component","ExperimentPage")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an ExperimentPage object and set data inside returning object --->
				<cfset oTemp=createObject("component","ExperimentPage")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oExperimentService.getService().SOAPRequest">
			</cfif>
		
		</cfif>

		<cfcatch>
			<!--- okay, we have an error, so rethrow the error --->
			<cfrethrow>
		</cfcatch>
		
	</cftry>
	
	<cfreturn oReturnValue>	
		
</cffunction>

<cffunction name="mutate" access="public" returntype="ExperimentReturnValue" hint="Mutates (add, update or remove) experiments. Note: to REMOVE use SET and mark status to DELETED. @param operations a list of unique operations. The same experiment cannot be specified in more than one operation. @return the updated experiments. The list of experiments is returned in the same order in which it came in as input. @throws ApiException if problems occurred while updating experiment information." output="No">
<cfargument name="operations" required="no" type="any" hint="This field must not contain null elements. Elements in this field must have distinct IDs for following Operators : SET, REMOVE. This field must contain at least one element. This field is required and should not be null. The following Operators are supported: ADD, SET."> 
<cfset var stResponse=StructNew()>
<cfset var aResponse="">
<cfset var j="">
<cfset var aTemp=arrayNew(1)>
<cfset var oTemp="">
<cfset var oReturnValue="">
<cfset var aProperties="">
<cfset var stProperty="">
<cfset var stTemp="">
<cfset var oExperimentServiceMutate="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oExperimentServiceMutate=createObject("component","experimentservicemutate")>
		<cfset oExperimentServiceMutate.setOperations(operations)>
		
		<cfset variables["instance"]["mutate"]=oExperimentServiceMutate>
		
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
		<cfset stResponse=getService().callWebService("ExperimentService",this)>
		
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
					<cfset oTemp=createObject("component","ExperimentReturnValue")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an ExperimentReturnValue object and set data inside returning object --->
				<cfset oTemp=createObject("component","ExperimentReturnValue")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oExperimentService.getService().SOAPRequest">
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
	
	<cfparam name="variables['instance']['serviceUrl']" default="https://adwords.google.com/api/adwords/cm/v201109/ExperimentService">
	<cfreturn variables["instance"]["serviceUrl"]>
	
</cffunction>

<cffunction name="setServiceUrl" access="public" returntype="void" output="No">
<cfargument name="serviceUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceUrl"]=arguments["serviceUrl"]>
		
</cffunction>

<cffunction name="getSandboxUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sandboxUrl']" default="https://adwords-sandbox.google.com/api/adwords/cm/v201109/ExperimentService">
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
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
