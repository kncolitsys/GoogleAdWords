<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="EntityCountLimitExceeded" hint="Signals that an entity count limit was exceeded for some level. For example, too many criteria for a campaign." extends="ApiError">

<cfproperty name="reason" required="no" type="string" hint="Specifies which level's limit was exceeded." seq="5">
<cfproperty name="enclosingId" required="no" type="string" hint="Id of the entity whose limit was exceeded." seq="6">
<cfproperty name="limit" required="no" type="int" hint="The limit which was exceeded." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setApiErrorType("EntityCountLimitExceeded")>

<cffunction name="getReason" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reason']" default="">
	<cfreturn variables["instance"]["reason"]>
	
</cffunction>

<cffunction name="setReason" access="public" returntype="void" output="No">
<cfargument name="reason" required="Yes" type="any">
	
	<cfset variables["instance"]["reason"]=arguments["reason"]>
		
</cffunction>

<cffunction name="getEnclosingId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enclosingId']" default="">
	<cfreturn variables["instance"]["enclosingId"]>
	
</cffunction>

<cffunction name="setEnclosingId" access="public" returntype="void" output="No">
<cfargument name="enclosingId" required="Yes" type="any">
	
	<cfset variables["instance"]["enclosingId"]=arguments["enclosingId"]>
		
</cffunction>

<cffunction name="getLimit" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['limit']" default="">
	<cfreturn variables["instance"]["limit"]>
	
</cffunction>

<cffunction name="setLimit" access="public" returntype="void" output="No">
<cfargument name="limit" required="Yes" type="any">
	
	<cfset variables["instance"]["limit"]=arguments["limit"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
