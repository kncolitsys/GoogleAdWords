<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AgeTarget" hint="Immutable structure to hold an age target." extends="DemographicTarget">

<cfproperty name="age" required="no" type="string" hint="The age segment to be targeted. This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("DemographicTarget")>

<cffunction name="getAge" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['age']" default="">
	<cfreturn variables["instance"]["age"]>
	
</cffunction>

<cffunction name="setAge" access="public" returntype="void" output="No">
<cfargument name="age" required="Yes" type="any">
	
	<cfset variables["instance"]["age"]=arguments["age"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
