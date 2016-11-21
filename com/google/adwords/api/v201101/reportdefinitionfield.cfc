<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ReportDefinitionField" hint="Represents the fields that can be used to create a ReportDefinition. This class allows the user to query the list of fields applicable to a given report type. Consumers of reports will be able use the retrieved fields through the getReportFields api and run the corresponding reports." extends="utils">

<cfproperty name="fieldName" required="no" type="string" hint="The field name. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="displayFieldName" required="no" type="string" hint="The name that is displayed in the downloaded report. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="xmlAttributeName" required="no" type="string" hint="The XML attribute in the downloaded report. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="fieldType" required="no" type="string" hint="The type of field. Useful for knowing what operation type to pass in for a given field in a predicate. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="enumValues" required="no" type="string[]" hint="List of enum values for the corresponing field iff the field is an enum type. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">
<cfproperty name="canSelect" required="no" type="boolean" hint="Indicates if the user can select this field. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="6">
<cfproperty name="canFilter" required="no" type="boolean" hint="Indicates if the user can filter on this field. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="7">
<cfproperty name="enumValuePairs" required="no" type="EnumValuePair[]" hint="List of enum values in api to their corresponding display values in the downloaded reports. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="8">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getFieldName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fieldName']" default="">
	<cfreturn variables["instance"]["fieldName"]>
	
</cffunction>

<cffunction name="setFieldName" access="public" returntype="void" output="No">
<cfargument name="fieldName" required="Yes" type="any">
	
	<cfset variables["instance"]["fieldName"]=arguments["fieldName"]>
		
</cffunction>

<cffunction name="getDisplayFieldName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['displayFieldName']" default="">
	<cfreturn variables["instance"]["displayFieldName"]>
	
</cffunction>

<cffunction name="setDisplayFieldName" access="public" returntype="void" output="No">
<cfargument name="displayFieldName" required="Yes" type="any">
	
	<cfset variables["instance"]["displayFieldName"]=arguments["displayFieldName"]>
		
</cffunction>

<cffunction name="getXmlAttributeName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['xmlAttributeName']" default="">
	<cfreturn variables["instance"]["xmlAttributeName"]>
	
</cffunction>

<cffunction name="setXmlAttributeName" access="public" returntype="void" output="No">
<cfargument name="xmlAttributeName" required="Yes" type="any">
	
	<cfset variables["instance"]["xmlAttributeName"]=arguments["xmlAttributeName"]>
		
</cffunction>

<cffunction name="getFieldType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fieldType']" default="">
	<cfreturn variables["instance"]["fieldType"]>
	
</cffunction>

<cffunction name="setFieldType" access="public" returntype="void" output="No">
<cfargument name="fieldType" required="Yes" type="any">
	
	<cfset variables["instance"]["fieldType"]=arguments["fieldType"]>
		
</cffunction>

<cffunction name="getEnumValues" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enumValues']" default="">
	<cfreturn variables["instance"]["enumValues"]>
	
</cffunction>

<cffunction name="setEnumValues" access="public" returntype="void" output="No">
<cfargument name="enumValues" required="Yes" type="any">
	
	<cfset variables["instance"]["enumValues"]=arguments["enumValues"]>
		
</cffunction>

<cffunction name="getCanSelect" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['canSelect']" default="">
	<cfreturn variables["instance"]["canSelect"]>
	
</cffunction>

<cffunction name="setCanSelect" access="public" returntype="void" output="No">
<cfargument name="canSelect" required="Yes" type="any">
	
	<cfset variables["instance"]["canSelect"]=arguments["canSelect"]>
		
</cffunction>

<cffunction name="getCanFilter" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['canFilter']" default="">
	<cfreturn variables["instance"]["canFilter"]>
	
</cffunction>

<cffunction name="setCanFilter" access="public" returntype="void" output="No">
<cfargument name="canFilter" required="Yes" type="any">
	
	<cfset variables["instance"]["canFilter"]=arguments["canFilter"]>
		
</cffunction>

<cffunction name="getEnumValuePairs" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['enumValuePairs']" default="">
	<cfreturn variables["instance"]["enumValuePairs"]>
	
</cffunction>

<cffunction name="setEnumValuePairs" access="public" returntype="void" output="No">
<cfargument name="enumValuePairs" required="Yes" type="any">
	
	<cfset variables["instance"]["enumValuePairs"]=arguments["enumValuePairs"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
