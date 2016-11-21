<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateJobService" hint="Use this service to schedule large batches of updates to your AdWords campaigns as asynchronous bulk mutate jobs, and to retrieve the status, results or statistics of your recent jobs. For example, a single BulkMutateJob may contain mutate operations that update several ad-groups, create several ads, and add thousands of keywords. Each customer has a single job queue - the jobs that operate on the customer are run one at a time in the order in which they were queued. Note: Jobs will be rejected (with an ApiException) once the customer has 10 pending jobs. Call mutate with an ADD operation to create a new job containing the first request part. The service will return the newly created job with a BulkMutateJobId for referring to this job in future calls to the service. Call mutate with a SET operation for each additional request part to be added to this job. You may set numRequestParts for the job during any of these mutate requests. Failing to set this value will result in the job remaining in its PENDING state indefinitely. Note: Both incomplete and queued jobs have a PENDING status, and so both count towards the customer's pending job limit. Mutate requests to the Bulk Mutate Job Service will fail if the request was invalid or if any of a job's structural constraints are violated, and depending on the operation, the job will not get created or updated. Once a job has been submitted, you may check its status periodically. When a job's status changes from PENDING to PROCESSING, you can request the job's processing statistics to be included with the job's status if you need to track the progress of the job. Caution: Do not do poll the job status too frequently or you will risk getting your customer rate limited. Once a job's status changes to COMPLETED, you can retrieve the job's results one part at a time. A job can fail even after it has been accepted for processing. For example, a job may fail at this stage if the total number of operations exceed the maximum limit for a job even though the number of operations in each request part did not exceed the maximum limit for a request part. If a job has a FAILED status it means that none of its mutate operations were even processed. Once a job is launched in the bulk mutate workflow, the operation streams in the job are sorted by scoping entity, which is either the customer or the parent campaign. The operations of a single scoping entity are always processed in their request order. Operations of different scoping entities may be processed concurrently or in a different order than in the request. The operations for each scoping entity are processed in batches for efficiency. Each batch is processed atomically so that either all of them have successful results, or they all fail with a failure result for the entire batch. The bulk mutate workflow will keep retrying operations when transient failures occur. However, if these failures persist for several hours or more serious ones occur, the bulk mutate workflow will abort a job leaving some or all of its operations unprocessed." extends="utils">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>


<cffunction name="get" access="public" returntype="any" hint="Returns a list of bulk mutate jobs. @param selector Specifies which jobs to return. If the selector is empty, all jobs are returned. @return List of bulk mutate jobs meeting the selector criteria. @throws ApiException if problems occurred while fetching the jobs" output="No">
<cfargument name="selector" required="no" type="BulkMutateJobSelector" hint="This field is required and should not be null."> 
<cfset var stResponse=StructNew()>
<cfset var aResponse="">
<cfset var j="">
<cfset var aTemp=arrayNew(1)>
<cfset var oTemp="">
<cfset var oReturnValue="">
<cfset var aProperties="">
<cfset var stProperty="">
<cfset var stTemp="">
<cfset var oBulkMutateJobServiceGet="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oBulkMutateJobServiceGet=createObject("component","bulkmutatejobserviceget")>
		<cfset oBulkMutateJobServiceGet.setSelector(selector)>
		
		<cfset variables["instance"]["get"]=oBulkMutateJobServiceGet>
		
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
		<cfset stResponse=getService().callWebService("BulkMutateJobService",this)>
		
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
					<cfset oTemp=createObject("component","BulkMutateJob")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an BulkMutateJob[] object and set data inside returning object --->
				<cfset oTemp=createObject("component","BulkMutateJob")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oBulkMutateJobService.getService().SOAPRequest">
			</cfif>
		
		</cfif>

		<cfcatch>
			<!--- okay, we have an error, so rethrow the error --->
			<cfrethrow>
		</cfcatch>
		
	</cftry>
	
	<cfreturn oReturnValue>	
		
</cffunction>

<cffunction name="mutate" access="public" returntype="BulkMutateJob" hint="Adds or updates a bulk mutate job. Use the &laquo;ADD&raquo; operator to submit a new job, and the &laquo;SET&raquo; operator to add additional parts to an existing job. The &laquo;DELETE&raquo; operator is not supported. Note: In the current implementation, the check for duplicate job keys is only 'best effort', and may not prevent jobs with the same keys from being accepted if they are submitted around the same instant. @param operation The operation to perform. @throws ApiException if problems occurred while creating or updating jobs @return The added or updated bulk mutate job." output="No">
<cfargument name="operation" required="no" type="JobOperation" hint="This field is required and should not be null."> 
<cfset var stResponse=StructNew()>
<cfset var aResponse="">
<cfset var j="">
<cfset var aTemp=arrayNew(1)>
<cfset var oTemp="">
<cfset var oReturnValue="">
<cfset var aProperties="">
<cfset var stProperty="">
<cfset var stTemp="">
<cfset var oBulkMutateJobServiceMutate="">

	<!--- use errorhandling --->
	<cftry>

		<cfset oBulkMutateJobServiceMutate=createObject("component","bulkmutatejobservicemutate")>
		<cfset oBulkMutateJobServiceMutate.setOperation(operation)>
		
		<cfset variables["instance"]["mutate"]=oBulkMutateJobServiceMutate>
		
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
		<cfset stResponse=getService().callWebService("BulkMutateJobService",this)>
		
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
					<cfset oTemp=createObject("component","BulkMutateJob")>
					<cfset oTemp.setObjectData(aResponse[j])>
					<cfset ArrayAppend(aTemp,oTemp)>
				</cfloop>
				<cfset oReturnValue=aTemp>
			<cfelseif isStruct(aResponse) and not structIsEmpty(aResponse)>
				<!--- create empty instance of an BulkMutateJob object and set data inside returning object --->
				<cfset oTemp=createObject("component","BulkMutateJob")>
				<cfset oTemp.setObjectData(aResponse)>
				<cfset oReturnValue=oTemp>
			<cfelse>
				<cfthrow message="The api returned an empty result." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oBulkMutateJobService.getService().SOAPRequest">
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
	
	<cfparam name="variables['instance']['serviceUrl']" default="https://adwords.google.com/api/adwords/job/v201101/BulkMutateJobService">
	<cfreturn variables["instance"]["serviceUrl"]>
	
</cffunction>

<cffunction name="setServiceUrl" access="public" returntype="void" output="No">
<cfargument name="serviceUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceUrl"]=arguments["serviceUrl"]>
		
</cffunction>

<cffunction name="getSandboxUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sandboxUrl']" default="https://adwords-sandbox.google.com/api/adwords/job/v201101/BulkMutateJobService">
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
