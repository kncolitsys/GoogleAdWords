<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Attribute" hint="Attributes encompass the core information about a particular com.google.ads.api.services.targetingideas.TargetingIdea. Some attributes are for KEYWORD IdeaTypes, some are for PLACEMENT IdeaTypes, and some are for both. Ultimately, an Attribute instance simply wraps an actual value of interest. For example, KeywordAttribute wraps the keyword itself, while a BooleanAttribute simply wraps a boolean describing some information about the keyword idea." extends="utils">

<cfproperty name="Attribute_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/o/v201101'" hint="This field indicates the subtype of Attribute of this instance. It is ignored on input, and instead xsi:type should be specified." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAttributeType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Attribute_Type']" default="">
	<cfreturn variables["instance"]["Attribute_Type"]>
	
</cffunction>

<cffunction name="setAttributeType" access="public" returntype="void" output="No">
<cfargument name="Attribute_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Attribute_Type"]=arguments["Attribute_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
