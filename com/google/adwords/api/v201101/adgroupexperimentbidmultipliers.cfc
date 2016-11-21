<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupExperimentBidMultipliers" hint="Bid multiplier used to modify the bid of an adgroup while running an experiment." extends="utils">

<cfproperty name="AdGroupExperimentBidMultipliers_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of AdGroupExperimentBidMultipliers of this instance. It is ignored on input, and instead xsi:type should be specified." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupExperimentBidMultipliersType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['AdGroupExperimentBidMultipliers_Type']" default="">
	<cfreturn variables["instance"]["AdGroupExperimentBidMultipliers_Type"]>
	
</cffunction>

<cffunction name="setAdGroupExperimentBidMultipliersType" access="public" returntype="void" output="No">
<cfargument name="AdGroupExperimentBidMultipliers_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["AdGroupExperimentBidMultipliers_Type"]=arguments["AdGroupExperimentBidMultipliers_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
