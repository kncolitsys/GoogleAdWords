<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Product" hint="Product targeting criteria, represents a filter for products in the product feed that is defined by the advertiser. The criteria is used to determine the products in a Merchant Center account to be used with the ProductAds in the AdGroup. This criteria is available only to some advertisers." extends="Criterion">

<cfproperty name="conditions" required="no" type="ProductCondition[]" hint="Product filter conditions. The condition in the product criteria is defined as {operand1=argument1,operand2=argument2. The product conditions are anded to evaluate the targeting parameter. null conditions means that all products are targeted." seq="4">
<cfproperty name="text" required="no" type="string" hint="Product criteria parameter This field can be selected using the value 'Text'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Product")>

<cffunction name="getConditions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conditions']" default="">
	<cfreturn variables["instance"]["conditions"]>
	
</cffunction>

<cffunction name="setConditions" access="public" returntype="void" output="No">
<cfargument name="conditions" required="Yes" type="any">
	
	<cfset variables["instance"]["conditions"]=arguments["conditions"]>
		
</cffunction>

<cffunction name="getText" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['text']" default="">
	<cfreturn variables["instance"]["text"]>
	
</cffunction>

<cffunction name="setText" access="public" returntype="void" output="No">
<cfargument name="text" required="Yes" type="any">
	
	<cfset variables["instance"]["text"]=arguments["text"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
