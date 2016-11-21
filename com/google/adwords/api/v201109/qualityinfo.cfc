<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="QualityInfo" hint="Container for criterion quality information." extends="utils">

<cfproperty name="isKeywordAdRelevanceAcceptable" required="no" type="boolean" hint="Whether the keyword relevance is acceptable. This field can be selected using the value 'IsKeywordAdRelevanceAcceptable'.This field can be filtered on." seq="1">
<cfproperty name="isLandingPageQualityAcceptable" required="no" type="boolean" hint="Whether the landing page quality is acceptable. This field can be selected using the value 'IsLandingPageQualityAcceptable'.This field can be filtered on." seq="2">
<cfproperty name="isLandingPageLatencyAcceptable" required="no" type="boolean" hint="Whether the latency to load the landing page is acceptable. This field can be selected using the value 'IsLandingPageLatencyAcceptable'.This field can be filtered on." seq="3">
<cfproperty name="qualityScore" required="no" type="int" hint="Keyword quality score that ranges from 1 to 10, 1 being the lowest, 10 the highest. This field can be selected using the value 'QualityScore'.This field can be filtered on." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getIsKeywordAdRelevanceAcceptable" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isKeywordAdRelevanceAcceptable']" default="">
	<cfreturn variables["instance"]["isKeywordAdRelevanceAcceptable"]>
	
</cffunction>

<cffunction name="setIsKeywordAdRelevanceAcceptable" access="public" returntype="void" output="No">
<cfargument name="isKeywordAdRelevanceAcceptable" required="Yes" type="any">
	
	<cfset variables["instance"]["isKeywordAdRelevanceAcceptable"]=arguments["isKeywordAdRelevanceAcceptable"]>
		
</cffunction>

<cffunction name="getIsLandingPageQualityAcceptable" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isLandingPageQualityAcceptable']" default="">
	<cfreturn variables["instance"]["isLandingPageQualityAcceptable"]>
	
</cffunction>

<cffunction name="setIsLandingPageQualityAcceptable" access="public" returntype="void" output="No">
<cfargument name="isLandingPageQualityAcceptable" required="Yes" type="any">
	
	<cfset variables["instance"]["isLandingPageQualityAcceptable"]=arguments["isLandingPageQualityAcceptable"]>
		
</cffunction>

<cffunction name="getIsLandingPageLatencyAcceptable" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isLandingPageLatencyAcceptable']" default="">
	<cfreturn variables["instance"]["isLandingPageLatencyAcceptable"]>
	
</cffunction>

<cffunction name="setIsLandingPageLatencyAcceptable" access="public" returntype="void" output="No">
<cfargument name="isLandingPageLatencyAcceptable" required="Yes" type="any">
	
	<cfset variables["instance"]["isLandingPageLatencyAcceptable"]=arguments["isLandingPageLatencyAcceptable"]>
		
</cffunction>

<cffunction name="getQualityScore" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['qualityScore']" default="">
	<cfreturn variables["instance"]["qualityScore"]>
	
</cffunction>

<cffunction name="setQualityScore" access="public" returntype="void" output="No">
<cfargument name="qualityScore" required="Yes" type="any">
	
	<cfset variables["instance"]["qualityScore"]=arguments["qualityScore"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
