<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Audio" hint="Encapsulates an Audio media identified by a MediaId." extends="Media">

<cfproperty name="durationMillis" required="no" type="long" hint="The duration of the associated audio, in milliseconds. This field can be selected using the value 'DurationMillis'.This field can be filtered on." seq="12">
<cfproperty name="streamingUrl" required="no" type="string" hint="The streaming url of the audio. This field can be selected using the value 'StreamingUrl'." seq="13">
<cfproperty name="readyToPlayOnTheWeb" required="no" type="boolean" hint="Indicates whether the audio is ready to play on the web. This field can be selected using the value 'ReadyToPlayOnTheWeb'." seq="14">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setMediaType("Audio")>

<cffunction name="getDurationMillis" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['durationMillis']" default="">
	<cfreturn variables["instance"]["durationMillis"]>
	
</cffunction>

<cffunction name="setDurationMillis" access="public" returntype="void" output="No">
<cfargument name="durationMillis" required="Yes" type="any">
	
	<cfset variables["instance"]["durationMillis"]=arguments["durationMillis"]>
		
</cffunction>

<cffunction name="getStreamingUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['streamingUrl']" default="">
	<cfreturn variables["instance"]["streamingUrl"]>
	
</cffunction>

<cffunction name="setStreamingUrl" access="public" returntype="void" output="No">
<cfargument name="streamingUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["streamingUrl"]=arguments["streamingUrl"]>
		
</cffunction>

<cffunction name="getReadyToPlayOnTheWeb" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['readyToPlayOnTheWeb']" default="">
	<cfreturn variables["instance"]["readyToPlayOnTheWeb"]>
	
</cffunction>

<cffunction name="setReadyToPlayOnTheWeb" access="public" returntype="void" output="No">
<cfargument name="readyToPlayOnTheWeb" required="Yes" type="any">
	
	<cfset variables["instance"]["readyToPlayOnTheWeb"]=arguments["readyToPlayOnTheWeb"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
