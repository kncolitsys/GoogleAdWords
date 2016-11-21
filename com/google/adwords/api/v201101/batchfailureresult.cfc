<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BatchFailureResult" hint="Represents a failure result for a mutate operation that was applied in a transactional batch. It does not imply that the corresponding operation for this result itself caused the failure. To determine that, please see the FailureResult provided for the first operation of the batch." extends="OperationResult">

<cfproperty name="operationIndexInBatch" required="no" type="int" hint="The zero-based index within the batch of the operation corresponding to this result." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationResultType("BatchFailureResult")>

<cffunction name="getOperationIndexInBatch" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operationIndexInBatch']" default="">
	<cfreturn variables["instance"]["operationIndexInBatch"]>
	
</cffunction>

<cffunction name="setOperationIndexInBatch" access="public" returntype="void" output="No">
<cfargument name="operationIndexInBatch" required="Yes" type="any">
	
	<cfset variables["instance"]["operationIndexInBatch"]=arguments["operationIndexInBatch"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
