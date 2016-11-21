<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AgeRange" hint="Represents an Age Range criterion. A criterion of this type can only be created using an ID. A criterion of this type is only excludable." extends="Criterion">

<cfproperty name="ageRangeType" required="no" type="string" hint="This field can be selected using the value 'AgeRangeType'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("AgeRange")>

<cffunction name="getAgeRangeType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ageRangeType']" default="">
	<cfreturn variables["instance"]["ageRangeType"]>
	
</cffunction>

<cffunction name="setAgeRangeType" access="public" returntype="void" output="No">
<cfargument name="ageRangeType" required="Yes" type="any">
	
	<cfset variables["instance"]["ageRangeType"]=arguments["ageRangeType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
