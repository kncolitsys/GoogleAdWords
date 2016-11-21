<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdScheduleTargetList" hint="List of ad schedule targets." extends="TargetList">

<cfproperty name="targets" required="no" type="AdScheduleTarget[]" hint="List of ad schedule targets. An empty list means all time is targeted. This field must contain distinct elements. This field must not contain null elements." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetListType("AdScheduleTargetList")>

<cffunction name="getTargets" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['targets']" default="">
	<cfreturn variables["instance"]["targets"]>
	
</cffunction>

<cffunction name="setTargets" access="public" returntype="void" output="No">
<cfargument name="targets" required="Yes" type="any">
	
	<cfset variables["instance"]["targets"]=arguments["targets"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
