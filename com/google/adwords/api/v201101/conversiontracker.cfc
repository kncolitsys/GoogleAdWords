<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConversionTracker" hint="An abstract Conversion base class." extends="utils">

<cfproperty name="id" required="no" type="long" hint="ID of this conversion tracker, null when creating a new one. This field can be selected using the value 'Id'.This field can be filtered on. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="name" required="no" type="string" hint="Name of this conversion tracker. This field can be selected using the value 'Name'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : ADD." seq="2">
<cfproperty name="status" required="no" type="string" hint="Status of this conversion tracker. This field can be selected using the value 'Status'.This field can be filtered on." seq="3">
<cfproperty name="category" required="no" type="string" hint="The category of conversion that is being tracked. This field can be selected using the value 'Category'.This field can be filtered on." seq="4">
<cfproperty name="stats" required="no" type="ConversionTrackerStats" hint="Statistics for this conversion tracker. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">
<cfproperty name="viewthroughLookbackWindow" required="no" type="int" hint="Lookback window for view-through conversions in days. This is the length of time in which a conversion without a click can be attributed to an impression. This field can be selected using the value 'ViewthroughLookbackWindow'.This field can be filtered on. This field must be between 1.0 and 30.0, inclusive." seq="6">
<cfproperty name="viewthroughConversionDeDupSearch" required="no" type="boolean" hint="Indicates whether to turn on search de-duping of view through conversions. This field can be selected using the value 'ViewthroughConversionDeDupSearch'.This field can be filtered on." seq="7">
<cfproperty name="isProductAdsChargeable" required="no" type="boolean" hint="Indicates whether to turn on charging for product ads. This field can be selected using the value 'IsProductAdsChargeable'.This field can be filtered on." seq="8">
<cfproperty name="productAdsChargeableConversionWindow" required="no" type="int" hint="Lookback window, in days, for whether product ads can be charged or not. This field can be selected using the value 'ProductAdsChargeableConversionWindow'.This field can be filtered on." seq="9">
<cfproperty name="ConversionTracker_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of ConversionTracker of this instance. It is ignored on input, and instead xsi:type should be specified." seq="10">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getCategory" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['category']" default="">
	<cfreturn variables["instance"]["category"]>
	
</cffunction>

<cffunction name="setCategory" access="public" returntype="void" output="No">
<cfargument name="category" required="Yes" type="any">
	
	<cfset variables["instance"]["category"]=arguments["category"]>
		
</cffunction>

<cffunction name="getStats" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['stats']" default="">
	<cfreturn variables["instance"]["stats"]>
	
</cffunction>

<cffunction name="setStats" access="public" returntype="void" output="No">
<cfargument name="stats" required="Yes" type="any">
	
	<cfset variables["instance"]["stats"]=arguments["stats"]>
		
</cffunction>

<cffunction name="getViewthroughLookbackWindow" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['viewthroughLookbackWindow']" default="">
	<cfreturn variables["instance"]["viewthroughLookbackWindow"]>
	
</cffunction>

<cffunction name="setViewthroughLookbackWindow" access="public" returntype="void" output="No">
<cfargument name="viewthroughLookbackWindow" required="Yes" type="any">
	
	<cfset variables["instance"]["viewthroughLookbackWindow"]=arguments["viewthroughLookbackWindow"]>
		
</cffunction>

<cffunction name="getViewthroughConversionDeDupSearch" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['viewthroughConversionDeDupSearch']" default="">
	<cfreturn variables["instance"]["viewthroughConversionDeDupSearch"]>
	
</cffunction>

<cffunction name="setViewthroughConversionDeDupSearch" access="public" returntype="void" output="No">
<cfargument name="viewthroughConversionDeDupSearch" required="Yes" type="any">
	
	<cfset variables["instance"]["viewthroughConversionDeDupSearch"]=arguments["viewthroughConversionDeDupSearch"]>
		
</cffunction>

<cffunction name="getIsProductAdsChargeable" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isProductAdsChargeable']" default="">
	<cfreturn variables["instance"]["isProductAdsChargeable"]>
	
</cffunction>

<cffunction name="setIsProductAdsChargeable" access="public" returntype="void" output="No">
<cfargument name="isProductAdsChargeable" required="Yes" type="any">
	
	<cfset variables["instance"]["isProductAdsChargeable"]=arguments["isProductAdsChargeable"]>
		
</cffunction>

<cffunction name="getProductAdsChargeableConversionWindow" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['productAdsChargeableConversionWindow']" default="">
	<cfreturn variables["instance"]["productAdsChargeableConversionWindow"]>
	
</cffunction>

<cffunction name="setProductAdsChargeableConversionWindow" access="public" returntype="void" output="No">
<cfargument name="productAdsChargeableConversionWindow" required="Yes" type="any">
	
	<cfset variables["instance"]["productAdsChargeableConversionWindow"]=arguments["productAdsChargeableConversionWindow"]>
		
</cffunction>

<cffunction name="getConversionTrackerType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ConversionTracker_Type']" default="">
	<cfreturn variables["instance"]["ConversionTracker_Type"]>
	
</cffunction>

<cffunction name="setConversionTrackerType" access="public" returntype="void" output="No">
<cfargument name="ConversionTracker_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["ConversionTracker_Type"]=arguments["ConversionTracker_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
