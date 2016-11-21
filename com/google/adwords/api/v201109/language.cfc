<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Language" hint="Represents a Language criterion. A criterion of this type can only be created using an ID. A criterion of this type is only targetable." extends="Criterion">

<cfproperty name="code" required="no" type="string" hint="This field can be selected using the value 'LanguageCode'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="name" required="no" type="string" hint="This field can be selected using the value 'LanguageName'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Language")>

<cffunction name="getCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['code']" default="">
	<cfreturn variables["instance"]["code"]>
	
</cffunction>

<cffunction name="setCode" access="public" returntype="void" output="No">
<cfargument name="code" required="Yes" type="any">
	
	<cfset variables["instance"]["code"]=arguments["code"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
