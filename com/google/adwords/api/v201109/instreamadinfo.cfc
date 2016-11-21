<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="InStreamAdInfo" hint="Information specific to the instream ad format. Instream ads are video ads which play as part of the delivery of video content, either before, during, or after the content itself." extends="utils">

<cfproperty name="maxAdDuration" required="no" type="int" hint="The maximum ad duration (sec)." seq="1">
<cfproperty name="minAdDuration" required="no" type="int" hint="The minimum ad duration (sec)." seq="2">
<cfproperty name="medianAdDuration" required="no" type="int" hint="The median ad duration (sec)." seq="3">
<cfproperty name="preRollPercent" required="no" type="double" hint="Percentage of ads shown before the video content." seq="4">
<cfproperty name="midRollPercent" required="no" type="double" hint="Percentage of ads shown during the video content." seq="5">
<cfproperty name="postRollPercent" required="no" type="double" hint="Percentage of ads shown after the video content." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getMaxAdDuration" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['maxAdDuration']" default="">
	<cfreturn variables["instance"]["maxAdDuration"]>
	
</cffunction>

<cffunction name="setMaxAdDuration" access="public" returntype="void" output="No">
<cfargument name="maxAdDuration" required="Yes" type="any">
	
	<cfset variables["instance"]["maxAdDuration"]=arguments["maxAdDuration"]>
		
</cffunction>

<cffunction name="getMinAdDuration" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['minAdDuration']" default="">
	<cfreturn variables["instance"]["minAdDuration"]>
	
</cffunction>

<cffunction name="setMinAdDuration" access="public" returntype="void" output="No">
<cfargument name="minAdDuration" required="Yes" type="any">
	
	<cfset variables["instance"]["minAdDuration"]=arguments["minAdDuration"]>
		
</cffunction>

<cffunction name="getMedianAdDuration" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['medianAdDuration']" default="">
	<cfreturn variables["instance"]["medianAdDuration"]>
	
</cffunction>

<cffunction name="setMedianAdDuration" access="public" returntype="void" output="No">
<cfargument name="medianAdDuration" required="Yes" type="any">
	
	<cfset variables["instance"]["medianAdDuration"]=arguments["medianAdDuration"]>
		
</cffunction>

<cffunction name="getPreRollPercent" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['preRollPercent']" default="">
	<cfreturn variables["instance"]["preRollPercent"]>
	
</cffunction>

<cffunction name="setPreRollPercent" access="public" returntype="void" output="No">
<cfargument name="preRollPercent" required="Yes" type="any">
	
	<cfset variables["instance"]["preRollPercent"]=arguments["preRollPercent"]>
		
</cffunction>

<cffunction name="getMidRollPercent" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['midRollPercent']" default="">
	<cfreturn variables["instance"]["midRollPercent"]>
	
</cffunction>

<cffunction name="setMidRollPercent" access="public" returntype="void" output="No">
<cfargument name="midRollPercent" required="Yes" type="any">
	
	<cfset variables["instance"]["midRollPercent"]=arguments["midRollPercent"]>
		
</cffunction>

<cffunction name="getPostRollPercent" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['postRollPercent']" default="">
	<cfreturn variables["instance"]["postRollPercent"]>
	
</cffunction>

<cffunction name="setPostRollPercent" access="public" returntype="void" output="No">
<cfargument name="postRollPercent" required="Yes" type="any">
	
	<cfset variables["instance"]["postRollPercent"]=arguments["postRollPercent"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/o/v201109">
	
</cffunction>	

</cfcomponent>
