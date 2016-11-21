<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LostResult" hint="Represents the result of processing an individual mutate operation that however failed to get durably saved despite the service's best efforts. The operation is considered to have completed processing because it either was successfully performed or failed with validation errors, and cannot be retried without the risk of doing duplicate work." extends="OperationResult">


<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationResultType("LostResult")>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
