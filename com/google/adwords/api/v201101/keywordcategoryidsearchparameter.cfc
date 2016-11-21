<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="KeywordCategoryIdSearchParameter" hint="A SearchParameter for KEYWORD IdeaTypes that sets a keyword category that all search results should belong to. This search parameter will be retired soon in favor of CategoryProductsAndServicesSearchParameter, which uses the newer 'Products and Services' taxonomy. This search parameter can be used in bulk keyword requests through the getBulkKeywordIdeas(TargetingIdeaSelector) method. This element is supported by following IdeaTypes: KEYWORD. This element is supported by following RequestTypes: IDEAS." extends="SearchParameter">

<cfproperty name="categoryId" required="no" type="int" hint="A keyword category ID that all search results should belong to." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSearchParameterType("KeywordCategoryIdSearchParameter")>

<cffunction name="getCategoryId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['categoryId']" default="">
	<cfreturn variables["instance"]["categoryId"]>
	
</cffunction>

<cffunction name="setCategoryId" access="public" returntype="void" output="No">
<cfargument name="categoryId" required="Yes" type="any">
	
	<cfset variables["instance"]["categoryId"]=arguments["categoryId"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
