<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Keyword" hint="Represents a keyword." extends="Criterion">

<cfproperty name="text" required="no" type="string" hint="Text of this keyword (at most 80 characters and ten words). This field can be selected using the value 'KeywordText'.This field can be filtered on. This string must match the regular expression '[^\x00]*' This field is required and should not be null." seq="3">
<cfproperty name="matchType" required="no" type="string" hint="Match type of this keyword. This field can be selected using the value 'KeywordMatchType'.This field can be filtered on. This field is required and should not be null." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Keyword")>

<cffunction name="getText" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['text']" default="">
	<cfreturn variables["instance"]["text"]>
	
</cffunction>

<cffunction name="setText" access="public" returntype="void" output="No">
<cfargument name="text" required="Yes" type="any">
	
	<cfset variables["instance"]["text"]=arguments["text"]>
		
</cffunction>

<cffunction name="getMatchType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['matchType']" default="">
	<cfreturn variables["instance"]["matchType"]>
	
</cffunction>

<cffunction name="setMatchType" access="public" returntype="void" output="No">
<cfargument name="matchType" required="Yes" type="any">
	
	<cfset variables["instance"]["matchType"]=arguments["matchType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
