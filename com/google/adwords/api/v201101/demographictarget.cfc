<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="DemographicTarget" hint="Abstract class to identify a demographic target." extends="Target">

<cfproperty name="bidModifier" required="no" type="int" hint="The bid modifier for the current age or gender segment. It is expressed as an addition percentage. Its value should lie between 0 and 500. The new bid will be: (1 + 0.01 * bidModifier) * bid." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("DemographicTarget")>

<cffunction name="getBidModifier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bidModifier']" default="">
	<cfreturn variables["instance"]["bidModifier"]>
	
</cffunction>

<cffunction name="setBidModifier" access="public" returntype="void" output="No">
<cfargument name="bidModifier" required="Yes" type="any">
	
	<cfset variables["instance"]["bidModifier"]=arguments["bidModifier"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
