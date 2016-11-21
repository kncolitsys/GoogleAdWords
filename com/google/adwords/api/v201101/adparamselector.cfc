<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdParamSelector" hint="A selector used to specify what AdParams should be returned." extends="utils">

<cfproperty name="adGroupIds" required="no" type="long[]" hint="Returned ad parameters will be from ad groups whose IDs are included in this list. This field must contain distinct elements. This field must not contain null elements. This field is required and should not be null." seq="1">
<cfproperty name="criteriaId" required="no" type="long[]" hint="Returned ad parameters will be for keywords whose IDs are included in this list. An empty list means there are no keyword restrictions. This field must contain distinct elements. This field must not contain null elements." seq="2">
<cfproperty name="paging" required="no" type="Paging" hint="Specifies paging-specific parameters for paging the return list." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupIds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupIds']" default="">
	<cfreturn variables["instance"]["adGroupIds"]>
	
</cffunction>

<cffunction name="setAdGroupIds" access="public" returntype="void" output="No">
<cfargument name="adGroupIds" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupIds"]=arguments["adGroupIds"]>
		
</cffunction>

<cffunction name="getCriteriaId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criteriaId']" default="">
	<cfreturn variables["instance"]["criteriaId"]>
	
</cffunction>

<cffunction name="setCriteriaId" access="public" returntype="void" output="No">
<cfargument name="criteriaId" required="Yes" type="any">
	
	<cfset variables["instance"]["criteriaId"]=arguments["criteriaId"]>
		
</cffunction>

<cffunction name="getPaging" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['paging']" default="">
	<cfreturn variables["instance"]["paging"]>
	
</cffunction>

<cffunction name="setPaging" access="public" returntype="void" output="No">
<cfargument name="paging" required="Yes" type="any">
	
	<cfset variables["instance"]["paging"]=arguments["paging"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
