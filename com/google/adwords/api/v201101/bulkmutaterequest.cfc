<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BulkMutateRequest" hint="A request part of a BulkMutateJob." extends="utils">

<cfproperty name="partIndex" required="no" type="int" hint="Index of this request part. 0 &le; partIndex < numRequestParts. This field is required and should not be null." seq="1">
<cfproperty name="operationStreams" required="no" type="OperationStream[]" hint="This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

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

<cffunction name="getOperationStreams" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operationStreams']" default="">
	<cfreturn variables["instance"]["operationStreams"]>
	
</cffunction>

<cffunction name="setOperationStreams" access="public" returntype="void" output="No">
<cfargument name="operationStreams" required="Yes" type="any">
	
	<cfset variables["instance"]["operationStreams"]=arguments["operationStreams"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
