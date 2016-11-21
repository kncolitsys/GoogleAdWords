<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdGroupCriterion" hint="Represents a criterion in an ad group, used with AdGroupCriterionService." extends="utils">

<cfproperty name="adGroupId" required="no" type="long" hint="The ad group this criterion is in. This field can be selected using the value 'AdGroupId'.This field can be filtered on. This field is required and should not be null." seq="1">
<cfproperty name="criterionUse" required="no" type="string" hint="This field can be selected using the value 'CriterionUse'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="criterion" required="no" type="Criterion" hint="The criterion part of the ad group criterion. This field is required and should not be null." seq="3">
<cfproperty name="AdGroupCriterion_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of AdGroupCriterion of this instance. It is ignored on input, and instead xsi:type should be specified." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAdGroupId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adGroupId']" default="">
	<cfreturn variables["instance"]["adGroupId"]>
	
</cffunction>

<cffunction name="setAdGroupId" access="public" returntype="void" output="No">
<cfargument name="adGroupId" required="Yes" type="any">
	
	<cfset variables["instance"]["adGroupId"]=arguments["adGroupId"]>
		
</cffunction>

<cffunction name="getCriterionUse" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criterionUse']" default="">
	<cfreturn variables["instance"]["criterionUse"]>
	
</cffunction>

<cffunction name="setCriterionUse" access="public" returntype="void" output="No">
<cfargument name="criterionUse" required="Yes" type="any">
	
	<cfset variables["instance"]["criterionUse"]=arguments["criterionUse"]>
		
</cffunction>

<cffunction name="getCriterion" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['criterion']" default="">
	<cfreturn variables["instance"]["criterion"]>
	
</cffunction>

<cffunction name="setCriterion" access="public" returntype="void" output="No">
<cfargument name="criterion" required="Yes" type="any">
	
	<cfset variables["instance"]["criterion"]=arguments["criterion"]>
		
</cffunction>

<cffunction name="getAdGroupCriterionType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['AdGroupCriterion_Type']" default="">
	<cfreturn variables["instance"]["AdGroupCriterion_Type"]>
	
</cffunction>

<cffunction name="setAdGroupCriterionType" access="public" returntype="void" output="No">
<cfargument name="AdGroupCriterion_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["AdGroupCriterion_Type"]=arguments["AdGroupCriterion_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
