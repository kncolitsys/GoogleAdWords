<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ReturnValueResult" hint="Represents a success result of processing a mutate operation that returned a value." extends="OperationResult">

<cfproperty name="returnValue" required="no" type="Operand" hint="The value returned from successfully processing a mutate operation." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationResultType("ReturnValueResult")>

<cffunction name="getReturnValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['returnValue']" default="">
	<cfreturn variables["instance"]["returnValue"]>
	
</cffunction>

<cffunction name="setReturnValue" access="public" returntype="void" output="No">
<cfargument name="returnValue" required="Yes" type="any">
	
	<cfset variables["instance"]["returnValue"]=arguments["returnValue"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
