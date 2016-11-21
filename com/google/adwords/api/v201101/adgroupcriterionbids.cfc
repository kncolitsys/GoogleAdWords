<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupCriterionBids" hint="Represents criterion level bids." extends="utils">

<cfproperty name="AdGroupCriterionBids_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of AdGroupCriterionBids of this instance. It is ignored on input, and instead xsi:type should be specified." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupCriterionBidsType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['AdGroupCriterionBids_Type']" default="">
	<cfreturn variables["instance"]["AdGroupCriterionBids_Type"]>
	
</cffunction>

<cffunction name="setAdGroupCriterionBidsType" access="public" returntype="void" output="No">
<cfargument name="AdGroupCriterionBids_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["AdGroupCriterionBids_Type"]=arguments["AdGroupCriterionBids_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
