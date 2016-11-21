<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ContentLabel" hint="Content Label for category exclusion." extends="Criterion">

<cfproperty name="contentLabelType" required="no" type="string" hint="Content label type This field can be selected using the value 'ContentLabelType'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : ADD." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("ContentLabel")>

<cffunction name="getContentLabelType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['contentLabelType']" default="">
	<cfreturn variables["instance"]["contentLabelType"]>
	
</cffunction>

<cffunction name="setContentLabelType" access="public" returntype="void" output="No">
<cfargument name="contentLabelType" required="Yes" type="any">
	
	<cfset variables["instance"]["contentLabelType"]=arguments["contentLabelType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
