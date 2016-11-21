<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Detail" hint="Detail refers to a single event or condition that triggered its owning Alert. Multiple details can cause the same Alert to occur." extends="utils">

<cfproperty name="triggerTime" required="no" type="string" hint="When the this condition was first detected." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getTriggerTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['triggerTime']" default="">
	<cfreturn variables["instance"]["triggerTime"]>
	
</cffunction>

<cffunction name="setTriggerTime" access="public" returntype="void" output="No">
<cfargument name="triggerTime" required="Yes" type="any">
	
	<cfset variables["instance"]["triggerTime"]=arguments["triggerTime"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201109">
	
</cffunction>	

</cfcomponent>
