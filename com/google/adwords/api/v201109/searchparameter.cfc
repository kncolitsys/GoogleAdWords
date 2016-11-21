<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="SearchParameter" hint="A set of SearchParameters are supplied to the com.google.ads.api.services.targetingideas.TargetingIdeaSelector to specify how the user wants to filter the set of all possible com.google.ads.api.services.targetingideas.TargetingIdeas. There is a SearchParameter for all types of inputs. SearchParameters can conceptually be broken down into two types. Input SearchParameters provide the seed information from which ideas should be generated or statistic information is desired (eg. RelatedToKeywordSearchParameter, RelatedToUrlSearchParameter, etc). Such SearchParameters are required for valid requests. Filter SearchParameters are used to trim down the results based on com.google.ads.api.services.targetingideas.attributes.Attribute related information (eg. CompetitionSearchParameter, etc.). A request should only contain one instance of each SearchParameter One or more of the following SearchParameters are required:KeywordCategoryIdSearchParameterCategoryProductsAndServicesSearchParameterRelatedToKeywordSearchParameterRelatedToUrlSearchParameterSeedAdGroupIdSearchParameterIdeaType KEYWORD supports following SearchParameters:AdShareSearchParameterAverageTargetedMonthlySearchesSearchParameterCompetitionSearchParameterDeviceTypeSearchParameterExcludedKeywordSearchParameterGlobalMonthlySearchesSearchParameterIdeaTextFilterSearchParameterIdeaTextMatchesSearchParameterIncludeAdultContentSearchParameterKeywordCategoryIdSearchParameterCategoryProductsAndServicesSearchParameterKeywordMatchTypeSearchParameterLanguageSearchParameterMobileSearchParameterNgramGroupsSearchParameterRelatedToKeywordSearchParameterRelatedToUrlSearchParameterSearchShareSearchParameterSeedAdGroupIdSearchParameterIdeaType PLACEMENT supports following SearchParameters:AdTypeSearchParameterDeviceTypeSearchParameterLanguageSearchParameterMobileSearchParameterPlacementTypeSearchParameterRelatedToKeywordSearchParameterRelatedToUrlSearchParameter" extends="utils">

<cfproperty name="SearchParameter_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/o/v201109'" hint="Indicates that this instance is a subtype of SearchParameter. Although this field is returned in the response, it is ignored on input and cannot be selected. Specify xsi:type instead." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getSearchParameterType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['SearchParameter_Type']" default="">
	<cfreturn variables["instance"]["SearchParameter_Type"]>
	
</cffunction>

<cffunction name="setSearchParameterType" access="public" returntype="void" output="No">
<cfargument name="SearchParameter_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["SearchParameter_Type"]=arguments["SearchParameter_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
