<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdStats" hint="Represents stats specific to Ads." extends="Stats">

<cfproperty name="percentServed" required="no" type="double" hint="Percentage of time this ad gets shown This field can be selected using the value 'PercentServed'." seq="24">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setStatsType("AdStats")>

<cffunction name="getPercentServed" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['percentServed']" default="">
	<cfreturn variables["instance"]["percentServed"]>
	
</cffunction>

<cffunction name="setPercentServed" access="public" returntype="void" output="No">
<cfargument name="percentServed" required="Yes" type="any">
	
	<cfset variables["instance"]["percentServed"]=arguments["percentServed"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
