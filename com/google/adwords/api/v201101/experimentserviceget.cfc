<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="experimentserviceget" extends="utils">

<cfproperty name="serviceSelector" required="no" type="Selector" hint="This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getServiceSelector" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['serviceSelector']" default="">
	<cfreturn variables["instance"]["serviceSelector"]>
	
</cffunction>

<cffunction name="setServiceSelector" access="public" returntype="void" output="No">
<cfargument name="serviceSelector" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceSelector"]=arguments["serviceSelector"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
