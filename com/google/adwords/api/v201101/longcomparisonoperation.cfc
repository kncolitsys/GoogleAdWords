<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LongComparisonOperation" hint="Pojo representing integer comparison operations. This is usually used within a particular com.google.ads.api.services.targetingideas.search.SearchParameter to specify the valid values requested for the specific com.google.ads.api.services.targetingideas.attributes.Attribute." extends="utils">

<cfproperty name="minimum" required="no" type="long" hint="the minimum value of elements returned by this operation (inclusive)." seq="1">
<cfproperty name="maximum" required="no" type="long" hint="the maximum value of elements returned by this operation (inclusive)." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getMinimum" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['minimum']" default="">
	<cfreturn variables["instance"]["minimum"]>
	
</cffunction>

<cffunction name="setMinimum" access="public" returntype="void" output="No">
<cfargument name="minimum" required="Yes" type="any">
	
	<cfset variables["instance"]["minimum"]=arguments["minimum"]>
		
</cffunction>

<cffunction name="getMaximum" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maximum']" default="">
	<cfreturn variables["instance"]["maximum"]>
	
</cffunction>

<cffunction name="setMaximum" access="public" returntype="void" output="No">
<cfargument name="maximum" required="Yes" type="any">
	
	<cfset variables["instance"]["maximum"]=arguments["maximum"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201101">
	
</cffunction>	

</cfcomponent>
