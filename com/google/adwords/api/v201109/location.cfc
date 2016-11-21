<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Location" hint="Represents Location criterion. A criterion of this type can only be created using an ID. A criterion of this type can be either targeted or excluded." extends="Criterion">

<cfproperty name="locationName" required="no" type="string" hint="Name of the location criterion. Note: This field is filterable only in LocationCriterionService. This field can be selected using the value 'LocationName'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="displayType" required="no" type="string" hint="Display type of the location criterion. This field can be selected using the value 'DisplayType'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">
<cfproperty name="isObsolete" required="no" type="boolean" hint="Indicates if the location criterion is obsolete. This field can be selected using the value 'IsObsolete'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="6">
<cfproperty name="parentLocations" required="no" type="Location[]" hint="Ordered list of parents of the location criterion. * This field can be selected using the value 'ParentLocations'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Location")>

<cffunction name="getLocationName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['locationName']" default="">
	<cfreturn variables["instance"]["locationName"]>
	
</cffunction>

<cffunction name="setLocationName" access="public" returntype="void" output="No">
<cfargument name="locationName" required="Yes" type="any">
	
	<cfset variables["instance"]["locationName"]=arguments["locationName"]>
		
</cffunction>

<cffunction name="getDisplayType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['displayType']" default="">
	<cfreturn variables["instance"]["displayType"]>
	
</cffunction>

<cffunction name="setDisplayType" access="public" returntype="void" output="No">
<cfargument name="displayType" required="Yes" type="any">
	
	<cfset variables["instance"]["displayType"]=arguments["displayType"]>
		
</cffunction>

<cffunction name="getIsObsolete" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isObsolete']" default="">
	<cfreturn variables["instance"]["isObsolete"]>
	
</cffunction>

<cffunction name="setIsObsolete" access="public" returntype="void" output="No">
<cfargument name="isObsolete" required="Yes" type="any">
	
	<cfset variables["instance"]["isObsolete"]=arguments["isObsolete"]>
		
</cffunction>

<cffunction name="getParentLocations" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['parentLocations']" default="">
	<cfreturn variables["instance"]["parentLocations"]>
	
</cffunction>

<cffunction name="setParentLocations" access="public" returntype="void" output="No">
<cfargument name="parentLocations" required="Yes" type="any">
	
	<cfset variables["instance"]["parentLocations"]=arguments["parentLocations"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
