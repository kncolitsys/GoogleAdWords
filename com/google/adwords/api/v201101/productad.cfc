<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ProductAd" hint="Represents a product ad (known as a product listing ad in the AdWords user interface). A product ad displays product data (managed using the Google Merchant Center) that is pulled from the Google base product feed specified in the parent campaign's extension. Product ads are only available to a limited set of advertisers. If you not eligible to use product ads, they will not serve. Caution: Product ads do not use url or displayUrl; setting these fields on a product ad will cause an error." extends="Ad">

<cfproperty name="promotionLine" required="no" type="string" hint="Promotional line for this ad. This text will be displayed in addition to the products. This field can be selected using the value 'PromotionLine'.This field can be filtered on." seq="8">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("ProductAd")>

<cffunction name="getPromotionLine" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['promotionLine']" default="">
	<cfreturn variables["instance"]["promotionLine"]>
	
</cffunction>

<cffunction name="setPromotionLine" access="public" returntype="void" output="No">
<cfargument name="promotionLine" required="Yes" type="any">
	
	<cfset variables["instance"]["promotionLine"]=arguments["promotionLine"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
