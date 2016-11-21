<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="OperationStreamResult" hint="The result of processing an OperationStream." extends="utils">

<cfproperty name="operationResults" required="no" type="OperationResult[]" hint="The individual operation results corresponding to the operations of the operation stream for this result." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getOperationResults" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operationResults']" default="">
	<cfreturn variables["instance"]["operationResults"]>
	
</cffunction>

<cffunction name="setOperationResults" access="public" returntype="void" output="No">
<cfargument name="operationResults" required="Yes" type="any">
	
	<cfset variables["instance"]["operationResults"]=arguments["operationResults"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
