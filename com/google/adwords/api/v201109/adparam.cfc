<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdParam" hint="Represents an ad parameter. Use ad parameters to update numeric values (such as prices or inventory levels) in any line of a text ad, including the destination URL. You can set two AdParam objects (one for each value of paramIndex) per ad group Keyword criterion. When setting or removing an AdParam, it is uniquely identified by the combination of these three fields: adGroupId criterionId paramIndex" extends="utils">

<cfproperty name="adGroupId" required="no" type="long" hint="ID of the associated ad group. Text ads in this ad group will be candidates for parameterized text replacement. This field can be selected using the value 'AdGroupId'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="criterionId" required="no" type="long" hint="ID of the associated Keyword criterion. The keyword must be in the same ad group as this AdParam. Text ads triggered by this keyword will have their {paramN:default-value snippet replaced by the contents of  insertionText. This field can be selected using the value 'CriterionId'.This field can be filtered on. This field is required and should not be null." seq="2">
<cfproperty name="insertionText" required="no" type="string" hint="Numeric value to insert into the ad text. The following restrictions apply: Can use , or . as a separator, with an optional . or , (respectively) for fractional values. For example, 1,000,000.00 and 2.000.000,10 are valid. Can be prepended or appended with a currency symbol. For example, $99.99 and 200&pound; are valid. Can be prepended or appended with a currency code. For example, 99.99USD and EUR200 are valid. Can use %. For example, 1.0% and 1,0% are valid. Can use + or -. For example, -10.99 and 25+ are valid. Can use / between two numbers. For example 4/1 and 0.95/0.45 are valid. This field can be selected using the value 'InsertionText'. This field is required and should not be null when it is contained within Operators : SET. The length of this string should be between 1 and 25, inclusive." seq="3">
<cfproperty name="paramIndex" required="no" type="int" hint="Defines which parameterized snippet of ad text to replace. For example, a value of 1 indicates a replacement for the {param1:default-value token. This field can be selected using the value 'ParamIndex'. This field must be between 1 and 2, inclusive. This field is required and should not be null." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupId']" default="">
	<cfreturn variables["instance"]["adGroupId"]>
	
</cffunction>

<cffunction name="setAdGroupId" access="public" returntype="void" output="No">
<cfargument name="adGroupId" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupId"]=arguments["adGroupId"]>
		
</cffunction>

<cffunction name="getCriterionId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criterionId']" default="">
	<cfreturn variables["instance"]["criterionId"]>
	
</cffunction>

<cffunction name="setCriterionId" access="public" returntype="void" output="No">
<cfargument name="criterionId" required="Yes" type="any">
	
	<cfset variables["instance"]["criterionId"]=arguments["criterionId"]>
		
</cffunction>

<cffunction name="getInsertionText" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['insertionText']" default="">
	<cfreturn variables["instance"]["insertionText"]>
	
</cffunction>

<cffunction name="setInsertionText" access="public" returntype="void" output="No">
<cfargument name="insertionText" required="Yes" type="any">
	
	<cfset variables["instance"]["insertionText"]=arguments["insertionText"]>
		
</cffunction>

<cffunction name="getParamIndex" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['paramIndex']" default="">
	<cfreturn variables["instance"]["paramIndex"]>
	
</cffunction>

<cffunction name="setParamIndex" access="public" returntype="void" output="No">
<cfargument name="paramIndex" required="Yes" type="any">
	
	<cfset variables["instance"]["paramIndex"]=arguments["paramIndex"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
