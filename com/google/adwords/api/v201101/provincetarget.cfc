<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ProvinceTarget" hint="Represents the worldwide province for targeting. The list of provinces available for targeting are listed here" extends="GeoTarget">

<cfproperty name="provinceCode" required="no" type="string" hint="Province or state code. This field is required and should not be null. This string must not be empty." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("GeoTarget")>

<cffunction name="getProvinceCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['provinceCode']" default="">
	<cfreturn variables["instance"]["provinceCode"]>
	
</cffunction>

<cffunction name="setProvinceCode" access="public" returntype="void" output="No">
<cfargument name="provinceCode" required="Yes" type="any">
	
	<cfset variables["instance"]["provinceCode"]=arguments["provinceCode"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
