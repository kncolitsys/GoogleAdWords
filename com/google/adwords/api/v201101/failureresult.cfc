<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="FailureResult" hint="Represents a failure result for an individual mutate operation. Currently, operations are applied in transactional batches, so the corresponding operation for this result may not itself be faulty. The errors in the exception may contain paths that identify the faulty operations in the batch. Please see the subsequent BatchFailureResults to determine the remaining operations that were also applied in the batch and their positions within the batch." extends="OperationResult">

<cfproperty name="cause" required="no" type="ApiException" hint="The exception describing the failure that occurred in processing the mutate operation." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationResultType("FailureResult")>

<cffunction name="getCause" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['cause']" default="">
	<cfreturn variables["instance"]["cause"]>
	
</cffunction>

<cffunction name="setCause" access="public" returntype="void" output="No">
<cfargument name="cause" required="Yes" type="any">
	
	<cfset variables["instance"]["cause"]=arguments["cause"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
