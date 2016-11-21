<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Vertical" hint="Use verticals to target or exclude placements in the Google Display Network based on the category into which the placement falls (for example, 'Pets &amp; Animals/Pets/Dogs'). View the complete list of available vertical categories." extends="Criterion">

<cfproperty name="path" required="no" type="string[]" hint="The category to target or exclude. Each subsequent element in the array describes a more specific sub-category. For example, 'Dogs' represents the 'Pets &amp; Animals/Pets/Dogs' category. A complete list of available vertical categories is available here This field is required and must not be empty. This field can be selected using the value 'Path'." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("Vertical")>

<cffunction name="getPath" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['path']" default="">
	<cfreturn variables["instance"]["path"]>
	
</cffunction>

<cffunction name="setPath" access="public" returntype="void" output="No">
<cfargument name="path" required="Yes" type="any">
	
	<cfset variables["instance"]["path"]=arguments["path"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
