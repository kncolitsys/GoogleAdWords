<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="FrequencyCap" hint="A frequency cap is the maximum number of times an ad (or some set of ads) can be shown to a user over a particular time period." extends="utils">

<cfproperty name="impressions" required="no" type="long" hint="Maximum number of impressions allowed during the time range by this cap. This field can be selected using the value 'FrequencyCapMaxImpressions'.This field can be filtered on." seq="1">
<cfproperty name="timeUnit" required="no" type="string" hint="Unit of time the cap is defined at. Only the Day, Week and Month time units are supported. This field can be selected using the value 'TimeUnit'.This field can be filtered on." seq="2">
<cfproperty name="level" required="no" type="string" hint="The level on which the cap is to be applied (creative/adgroup). Cap is applied to all the entities of this level in the campaign. This field can be selected using the value 'Level'.This field can be filtered on." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getImpressions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['impressions']" default="">
	<cfreturn variables["instance"]["impressions"]>
	
</cffunction>

<cffunction name="setImpressions" access="public" returntype="void" output="No">
<cfargument name="impressions" required="Yes" type="any">
	
	<cfset variables["instance"]["impressions"]=arguments["impressions"]>
		
</cffunction>

<cffunction name="getTimeUnit" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['timeUnit']" default="">
	<cfreturn variables["instance"]["timeUnit"]>
	
</cffunction>

<cffunction name="setTimeUnit" access="public" returntype="void" output="No">
<cfargument name="timeUnit" required="Yes" type="any">
	
	<cfset variables["instance"]["timeUnit"]=arguments["timeUnit"]>
		
</cffunction>

<cffunction name="getLevel" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['level']" default="">
	<cfreturn variables["instance"]["level"]>
	
</cffunction>

<cffunction name="setLevel" access="public" returntype="void" output="No">
<cfargument name="level" required="Yes" type="any">
	
	<cfset variables["instance"]["level"]=arguments["level"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
