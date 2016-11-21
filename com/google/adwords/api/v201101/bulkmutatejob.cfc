<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateJob" hint="A BulkMutateJob is essentially a mixed collection of mutate operations from the following AdWords API campaign management services: CampaignService CampaignTargetService CampaignCriterionService AdGroupService AdGroupAdService AdGroupCriterionService The mutate operations in a job's request are constructed in exactly the same way as they are for synchronous calls to these services. The mutate operations are grouped by their scoping entity in the AdWords customer tree. Currently, mutate operations can be grouped either by the customer or by their parent campaign. However, they cannot be grouped both ways - some by customer and others by campaigns - in the same job. Note: A job may have no more than 500,000 mutate operations in total, and no more than 10 different scoping campaigns. Since v201003, a job may have no fewer than 100 mutate operations in total. The mutate operations must be packaged into containers called Streams, each tagged with the id of the scoping entity of its operations. To facilitate the building of very large bulk mutate jobs, the operation streams of a job can be submitted using multiple request parts. A job is queued for processing as soon as it can be determined that all of its request parts have been received. Note: A job may have no more than 100 request parts. Each part may have no more than 25 operation streams and no more than 10,000 operations in total." extends="Job">

<cfproperty name="id" required="no" type="long" hint="ID of this bulk mutate job, which is returned by BulkMutateJobService after adding a new job. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored." seq="7">
<cfproperty name="policy" required="no" type="BulkMutateJobPolicy" hint="Defines which existing jobs are required to successfully process before starting this job. This field can only be set when adding a new job. This field is read only and should not be set for following Operators : SET. If this field is sent to the API, it will be ignored." seq="8">
<cfproperty name="request" required="no" type="BulkMutateRequest" hint="A request part of this job. Even though a BulkMutateJob can contain up to 100 request parts (each with a unique partIndex), only one can be added or updated at a time for optimization purposes. This field is required and should not be null when it is contained within Operators : ADD." seq="9">
<cfproperty name="status" required="no" type="string" hint="Status of this job. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="10">
<cfproperty name="history" required="no" type="BulkMutateJobEvent[]" hint="History of status changes of this job. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="11">
<cfproperty name="result" required="no" type="BulkMutateResult" hint="The selected result part of this job. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="12">
<cfproperty name="numRequestParts" required="no" type="int" hint="Total number of request parts (maximum of 100) in this job." seq="13">
<cfproperty name="numRequestPartsReceived" required="no" type="int" hint="Number of request parts currently received via ADD and SET operations. This job will begin processing when numRequestPartsReceived equals numRequestParts. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="14">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setJobType("BulkMutateJob")>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getPolicy" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['policy']" default="">
	<cfreturn variables["instance"]["policy"]>
	
</cffunction>

<cffunction name="setPolicy" access="public" returntype="void" output="No">
<cfargument name="policy" required="Yes" type="any">
	
	<cfset variables["instance"]["policy"]=arguments["policy"]>
		
</cffunction>

<cffunction name="getRequest" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['request']" default="">
	<cfreturn variables["instance"]["request"]>
	
</cffunction>

<cffunction name="setRequest" access="public" returntype="void" output="No">
<cfargument name="request" required="Yes" type="any">
	
	<cfset variables["instance"]["request"]=arguments["request"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getHistory" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['history']" default="">
	<cfreturn variables["instance"]["history"]>
	
</cffunction>

<cffunction name="setHistory" access="public" returntype="void" output="No">
<cfargument name="history" required="Yes" type="any">
	
	<cfset variables["instance"]["history"]=arguments["history"]>
		
</cffunction>

<cffunction name="getResult" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['result']" default="">
	<cfreturn variables["instance"]["result"]>
	
</cffunction>

<cffunction name="setResult" access="public" returntype="void" output="No">
<cfargument name="result" required="Yes" type="any">
	
	<cfset variables["instance"]["result"]=arguments["result"]>
		
</cffunction>

<cffunction name="getNumRequestParts" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numRequestParts']" default="">
	<cfreturn variables["instance"]["numRequestParts"]>
	
</cffunction>

<cffunction name="setNumRequestParts" access="public" returntype="void" output="No">
<cfargument name="numRequestParts" required="Yes" type="any">
	
	<cfset variables["instance"]["numRequestParts"]=arguments["numRequestParts"]>
		
</cffunction>

<cffunction name="getNumRequestPartsReceived" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['numRequestPartsReceived']" default="">
	<cfreturn variables["instance"]["numRequestPartsReceived"]>
	
</cffunction>

<cffunction name="setNumRequestPartsReceived" access="public" returntype="void" output="No">
<cfargument name="numRequestPartsReceived" required="Yes" type="any">
	
	<cfset variables["instance"]["numRequestPartsReceived"]=arguments["numRequestPartsReceived"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
