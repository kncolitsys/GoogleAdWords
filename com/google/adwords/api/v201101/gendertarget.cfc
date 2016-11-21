<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="GenderTarget" hint="Immutable structure to hold a gender target." extends="DemographicTarget">

<cfproperty name="gender" required="no" type="string" hint="The gender segment to be targeted. This field is required and should not be null." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("DemographicTarget")>

<cffunction name="getGender" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['gender']" default="">
	<cfreturn variables["instance"]["gender"]>
	
</cffunction>

<cffunction name="setGender" access="public" returntype="void" output="No">
<cfargument name="gender" required="Yes" type="any">
	
	<cfset variables["instance"]["gender"]=arguments["gender"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
