<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TemplateElementField" hint="Represents a field in a template element." extends="utils">

<cfproperty name="name" required="no" type="string" hint="The name of this field This field can be selected using the value 'Name'. This field is required and should not be null." seq="1">
<cfproperty name="type" required="no" type="string" hint="The type of this field This field can be selected using the value 'Type'. This field is required and should not be null." seq="2">
<cfproperty name="fieldText" required="no" type="string" hint="Text value for text field types. Null if not text field. The field is a text field if type is ADDRESS, ENUM, TEXT, URL, or VISIBLE_URL. This field can be selected using the value 'FieldText'." seq="3">
<cfproperty name="fieldMedia" required="no" type="Media" hint="Media value for non-text field types. Null if a text field. This fields must be specified if fieldText is null." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['type']" default="">
	<cfreturn variables["instance"]["type"]>
	
</cffunction>

<cffunction name="setType" access="public" returntype="void" output="No">
<cfargument name="type" required="Yes" type="any">
	
	<cfset variables["instance"]["type"]=arguments["type"]>
		
</cffunction>

<cffunction name="getFieldText" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fieldText']" default="">
	<cfreturn variables["instance"]["fieldText"]>
	
</cffunction>

<cffunction name="setFieldText" access="public" returntype="void" output="No">
<cfargument name="fieldText" required="Yes" type="any">
	
	<cfset variables["instance"]["fieldText"]=arguments["fieldText"]>
		
</cffunction>

<cffunction name="getFieldMedia" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fieldMedia']" default="">
	<cfreturn variables["instance"]["fieldMedia"]>
	
</cffunction>

<cffunction name="setFieldMedia" access="public" returntype="void" output="No">
<cfargument name="fieldMedia" required="Yes" type="any">
	
	<cfset variables["instance"]["fieldMedia"]=arguments["fieldMedia"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
