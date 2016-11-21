<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateResult" hint="Represents a result part of a BulkMutateJob. Once one or more mutate operations have been processed, the bulk mutate job will eventually be completed. This means that the job will have a result corresponding to each operation. The types of results for an operation are: ReturnValueResult: the corresponding operation was successfully processed and this result contains the return value of that operation; FailureResult or BatchFailureResult: the corresponding operation was in a batch that failed with errors. Please inspect these errors to determine if the operation itself was faulty and if so what errors need to be fixed before you submit this operation as part of a future job. LostResult: the corresponding operation was processed - it was either successful and had a return value, or it was a part of a failed batch. Unfortunately, despite our best efforts, we were unable to durably save the result. You may have to retrieve the related state of your account to determine if this operation actually succeeded. UnprocessedResult: the corresponding operation was not processed because the job was aborted Note: The job's status will be COMPLETED, signifying that although it may have some operations that were processed, it cannot be resumed. The results of a job are structured so that the each operation can be easily matched to its corresponding result. So for every BulkMutateRequest in a job, there is a corresponding BulkMutateResult; For every OperationStream in a request part, there is a corresponding OperationStreamResult; And, for every Operation in an operation stream, there is an OperationResult. Within an operation stream, the operations are processed in atomic batches. So even one faulty operation may cause its neighboring non-faulty operations to fail just because they happened to be processed in the same batch. It is important to keep this batch failure reporting scheme in mind when handling operation failures. There will be a single ApiException returned for each failing batch of operations, and it will have a similar structure and interpretation to the exceptions returned by the synchronous AdWords API services. This exception is returned in a FailureResult that corresponds to the first operation of the failing batch. The exception may contain multiple errors, and each error may have paths that identify the faulty operation(s) by index (or position within the batch). The first operation in the batch has an implicit index of 0. The subsequent operations in the batch have a corresponding BatchFailureResult which explicitly specifies the index of the operation within the batch." extends="utils">

<cfproperty name="partIndex" required="no" type="int" hint="The index of this result part; From 0 (inclusive) to numResultParts (exclusive)." seq="1">
<cfproperty name="operationStreamResults" required="no" type="OperationStreamResult[]" hint="List of OperationStreamResult's that comprise this result part of the bulk mutate job. Each operation result is indexed to its corresponding OperationStream in the BulkMutateRequest." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getPartIndex" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['partIndex']" default="">
	<cfreturn variables["instance"]["partIndex"]>
	
</cffunction>

<cffunction name="setPartIndex" access="public" returntype="void" output="No">
<cfargument name="partIndex" required="Yes" type="any">
	
	<cfset variables["instance"]["partIndex"]=arguments["partIndex"]>
		
</cffunction>

<cffunction name="getOperationStreamResults" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operationStreamResults']" default="">
	<cfreturn variables["instance"]["operationStreamResults"]>
	
</cffunction>

<cffunction name="setOperationStreamResults" access="public" returntype="void" output="No">
<cfargument name="operationStreamResults" required="Yes" type="any">
	
	<cfset variables["instance"]["operationStreamResults"]=arguments["operationStreamResults"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
