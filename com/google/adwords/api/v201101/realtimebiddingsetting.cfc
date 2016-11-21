<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="RealTimeBiddingSetting" hint="Settings for Real-Time Bidding, a feature only available for campaigns targeting the Ad Exchange network." extends="Setting">

<cfproperty name="optIn" required="no" type="boolean" hint="Whether the campaign is opted in to real-time bidding." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setSettingType("RealTimeBiddingSetting")>

<cffunction name="getOptIn" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['optIn']" default="">
	<cfreturn variables["instance"]["optIn"]>
	
</cffunction>

<cffunction name="setOptIn" access="public" returntype="void" output="No">
<cfargument name="optIn" required="Yes" type="any">
	
	<cfset variables["instance"]["optIn"]=arguments["optIn"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
