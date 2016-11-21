<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Placement" hint="A placement used for modifying bids for sites when targeting the content network." extends="Criterion">

<cfproperty name="url" required="no" type="string" hint="Url of the placement. For example, 'http://www.domain.com'. This field can be selected using the value 'PlacementUrl'.This field can be filtered on. This field is required and should not be null." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Placement")>

<cffunction name="getUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['url']" default="">
	<cfreturn variables["instance"]["url"]>
	
</cffunction>

<cffunction name="setUrl" access="public" returntype="void" output="No">
<cfargument name="url" required="Yes" type="any">
	
	<cfset variables["instance"]["url"]=arguments["url"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
