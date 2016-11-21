<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="MonthlySearchVolumeAttribute" hint="Attribute type that contains a list of MonthlySearchVolume values. The list contains the past 12 MonthlySearchVolumes (excluding the current month). The first item is the data for the most recent month and the last item is the data for the oldest month." extends="Attribute">

<cfproperty name="value" required="no" type="MonthlySearchVolume[]" hint="List of MonthlySearchVolume values contained by this Attribute. The list contains the data for the past 12 months (excluding the current month) in sorted order started with the most recent month. This field is required and should not be null." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAttributeType("MonthlySearchVolumeAttribute")>

<cffunction name="getValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['value']" default="">
	<cfreturn variables["instance"]["value"]>
	
</cffunction>

<cffunction name="setValue" access="public" returntype="void" output="No">
<cfargument name="value" required="Yes" type="any">
	
	<cfset variables["instance"]["value"]=arguments["value"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
