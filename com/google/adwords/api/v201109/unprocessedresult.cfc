<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="UnprocessedResult" hint="Indicates that the mutate operation was not processed. This could result if the job was aborted by the back-end workflow because the developer's API quota was exceeded or if the job encountered some severe workflow system failure." extends="OperationResult">


<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationResultType("UnprocessedResult")>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
