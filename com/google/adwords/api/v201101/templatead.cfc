<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="TemplateAd" hint="Represents a Display Ad Builder template ad. A template ad is composed of a template (specified by its ID) and the data that populates the template's fields. For a list of available templates and their required fields, see the Template Ads appendix." extends="Ad">

<cfproperty name="templateId" required="no" type="long" hint="ID of the template to use. This field can be selected using the value 'TemplateId'." seq="8">
<cfproperty name="adUnionId" required="no" type="AdUnionId" hint="Group ID of all template ads, which should be created together. Template ads in the same union reference the same data but have different dimensions. Single ads do not have a union ID. If a template ad specifies an ad union with only one ad, no union will be created. This field can be selected using the value 'AdUnionId'." seq="9">
<cfproperty name="templateElements" required="no" type="TemplateElement[]" hint="List of elements (each containing a set of fields) for the template referenced by templateId. See the Template Ads appendix for the elements and fields required for each template." seq="10">
<cfproperty name="dimensions" required="no" type="Dimensions" hint="The dimensions for this ad. This field can be selected using the value 'Dimensions'." seq="11">
<cfproperty name="name" required="no" type="string" hint="Name of this ad. This field can be selected using the value 'Name'. This field is required and should not be null." seq="12">
<cfproperty name="duration" required="no" type="int" hint="Duration of this ad (if it contains playable media). This field can be selected using the value 'Duration'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="13">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("TemplateAd")>

<cffunction name="getTemplateId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['templateId']" default="">
	<cfreturn variables["instance"]["templateId"]>
	
</cffunction>

<cffunction name="setTemplateId" access="public" returntype="void" output="No">
<cfargument name="templateId" required="Yes" type="any">
	
	<cfset variables["instance"]["templateId"]=arguments["templateId"]>
		
</cffunction>

<cffunction name="getAdUnionId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adUnionId']" default="">
	<cfreturn variables["instance"]["adUnionId"]>
	
</cffunction>

<cffunction name="setAdUnionId" access="public" returntype="void" output="No">
<cfargument name="adUnionId" required="Yes" type="any">
	
	<cfset variables["instance"]["adUnionId"]=arguments["adUnionId"]>
		
</cffunction>

<cffunction name="getTemplateElements" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['templateElements']" default="">
	<cfreturn variables["instance"]["templateElements"]>
	
</cffunction>

<cffunction name="setTemplateElements" access="public" returntype="void" output="No">
<cfargument name="templateElements" required="Yes" type="any">
	
	<cfset variables["instance"]["templateElements"]=arguments["templateElements"]>
		
</cffunction>

<cffunction name="getDimensions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dimensions']" default="">
	<cfreturn variables["instance"]["dimensions"]>
	
</cffunction>

<cffunction name="setDimensions" access="public" returntype="void" output="No">
<cfargument name="dimensions" required="Yes" type="any">
	
	<cfset variables["instance"]["dimensions"]=arguments["dimensions"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getDuration" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['duration']" default="">
	<cfreturn variables["instance"]["duration"]>
	
</cffunction>

<cffunction name="setDuration" access="public" returntype="void" output="No">
<cfargument name="duration" required="Yes" type="any">
	
	<cfset variables["instance"]["duration"]=arguments["duration"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
