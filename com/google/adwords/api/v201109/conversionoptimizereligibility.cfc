<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConversionOptimizerEligibility" hint="Eligibility data for Campaign to transition to Conversion Optimizer" extends="utils">

<cfproperty name="eligible" required="no" type="boolean" hint="If the campaign is eligible to enter conversion optimizer. This field can be selected using the value 'Eligible'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="rejectionReasons" required="no" type="string[]" hint="Reason why a campaign would be rejected for conversion optimizer. This field can be selected using the value 'RejectionReasons'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getEligible" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['eligible']" default="">
	<cfreturn variables["instance"]["eligible"]>
	
</cffunction>

<cffunction name="setEligible" access="public" returntype="void" output="No">
<cfargument name="eligible" required="Yes" type="any">
	
	<cfset variables["instance"]["eligible"]=arguments["eligible"]>
		
</cffunction>

<cffunction name="getRejectionReasons" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['rejectionReasons']" default="">
	<cfreturn variables["instance"]["rejectionReasons"]>
	
</cffunction>

<cffunction name="setRejectionReasons" access="public" returntype="void" output="No">
<cfargument name="rejectionReasons" required="Yes" type="any">
	
	<cfset variables["instance"]["rejectionReasons"]=arguments["rejectionReasons"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
