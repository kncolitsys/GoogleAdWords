<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="OperationStream" hint="A stream of AdWords API mutate operations that must be performed serially. Further, this operation stream must be processed serially with all other operation streams in a bulk mutate job that specify the same scoping entity." extends="utils">

<cfproperty name="scopingEntityId" required="no" type="EntityId" hint="The id of the entity within whose scope the mutate operations apply." seq="1">
<cfproperty name="operations" required="no" type="Operation[]" hint="The mutate operations comprising this stream. This field must not contain null elements. This field must contain at least one element. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getScopingEntityId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['scopingEntityId']" default="">
	<cfreturn variables["instance"]["scopingEntityId"]>
	
</cffunction>

<cffunction name="setScopingEntityId" access="public" returntype="void" output="No">
<cfargument name="scopingEntityId" required="Yes" type="any">
	
	<cfset variables["instance"]["scopingEntityId"]=arguments["scopingEntityId"]>
		
</cffunction>

<cffunction name="getOperations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operations']" default="">
	<cfreturn variables["instance"]["operations"]>
	
</cffunction>

<cffunction name="setOperations" access="public" returntype="void" output="No">
<cfargument name="operations" required="Yes" type="any">
	
	<cfset variables["instance"]["operations"]=arguments["operations"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
