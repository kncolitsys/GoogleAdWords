<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="GeoTargetTypeSetting" hint="Represents a collection of settings related to ads geotargeting. AdWords ads can be geotargeted using Location of Presence (LOP), Area of Interest (AOI), or both. LOP is the physical location of the user performing the search; AOI is the geographical region in which the searcher is interested. For example, if a user in New York City performs a search 'hotels california', their LOP is New York City and their AOI is California. Additionally, ads can be positively or negatively geotargeted. An ad that is positively geotargeted to New York City only appears to users whose location is related (via AOI or LOP) to New York City. An ad that is negatively geotargeted to New York City appears for all users except those whose location is related to New York City. Ads can only be negatively geotargeted if a positive geotargeting is also supplied, and the negatively geotargeted region must be contained within the positive region. Geotargeting settings allow ads to be targeted in the following way: Positively geotargeted using solely AOI, solely LOP, or either. Negatively geotargeted using solely LOP, or both. This setting applies only to ads shown on the search network, and does not affect ads shown on the Google Display Network." extends="Setting">

<cfproperty name="positiveGeoTargetType" required="no" type="string" hint="The setting used for positive geotargeting in this particular campaign. Again, the campaign can be positively targeted using solely LOP, solely AOI, or either. Positive targeting triggers ads only for users whose location is related to the given locations. The default value is DONT_CARE." seq="2">
<cfproperty name="negativeGeoTargetType" required="no" type="string" hint="The setting used for negative geotargeting in this particular campaign. Again, the campaign can be negatively targeted using solely LOP or both AOI and LOP. Negative targeting triggers ads for all users except those whose location is related to the given locations. The default value is LOP." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSettingType("GeoTargetTypeSetting")>

<cffunction name="getPositiveGeoTargetType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['positiveGeoTargetType']" default="">
	<cfreturn variables["instance"]["positiveGeoTargetType"]>
	
</cffunction>

<cffunction name="setPositiveGeoTargetType" access="public" returntype="void" output="No">
<cfargument name="positiveGeoTargetType" required="Yes" type="any">
	
	<cfset variables["instance"]["positiveGeoTargetType"]=arguments["positiveGeoTargetType"]>
		
</cffunction>

<cffunction name="getNegativeGeoTargetType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['negativeGeoTargetType']" default="">
	<cfreturn variables["instance"]["negativeGeoTargetType"]>
	
</cffunction>

<cffunction name="setNegativeGeoTargetType" access="public" returntype="void" output="No">
<cfargument name="negativeGeoTargetType" required="Yes" type="any">
	
	<cfset variables["instance"]["negativeGeoTargetType"]=arguments["negativeGeoTargetType"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
