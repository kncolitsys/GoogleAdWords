<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Video" hint="Encapsulates a Video media identified by a MediaId" extends="Media">

<cfproperty name="durationMillis" required="no" type="long" hint="The duration of the associated video, in milliseconds. This field can be selected using the value 'DurationMillis'.This field can be filtered on." seq="12">
<cfproperty name="streamingUrl" required="no" type="string" hint="Streaming url for the video. This field can be selected using the value 'StreamingUrl'." seq="13">
<cfproperty name="readyToPlayOnTheWeb" required="no" type="boolean" hint="Indicates whether the video is ready to play on the web This field can be selected using the value 'ReadyToPlayOnTheWeb'." seq="14">
<cfproperty name="industryStandardCommercialIdentifier" required="no" type="string" hint="The Industry Standard Commercial Identifier code for this media, used mainly for television commercials. This field can be selected using the value 'IndustryStandardCommercialIdentifier'.This field can be filtered on." seq="15">
<cfproperty name="advertisingId" required="no" type="string" hint="The Advertising Digital Identification code for this media, as defined by the American Association of Advertising Agencies, used mainly for television commercials.. This field can be selected using the value 'AdvertisingId'.This field can be filtered on." seq="16">
<cfproperty name="youTubeVideoIdString" required="no" type="string" hint="For YouTube-hosted videos, the YouTube video id (as seen in YT urls) may also be filled in. This field can be selected using the value 'YouTubeVideoIdString'.This field can be filtered on." seq="17">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setMediaType("Video")>

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

<cffunction name="getIndustryStandardCommercialIdentifier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['industryStandardCommercialIdentifier']" default="">
	<cfreturn variables["instance"]["industryStandardCommercialIdentifier"]>
	
</cffunction>

<cffunction name="setIndustryStandardCommercialIdentifier" access="public" returntype="void" output="No">
<cfargument name="industryStandardCommercialIdentifier" required="Yes" type="any">
	
	<cfset variables["instance"]["industryStandardCommercialIdentifier"]=arguments["industryStandardCommercialIdentifier"]>
		
</cffunction>

<cffunction name="getAdvertisingId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['advertisingId']" default="">
	<cfreturn variables["instance"]["advertisingId"]>
	
</cffunction>

<cffunction name="setAdvertisingId" access="public" returntype="void" output="No">
<cfargument name="advertisingId" required="Yes" type="any">
	
	<cfset variables["instance"]["advertisingId"]=arguments["advertisingId"]>
		
</cffunction>

<cffunction name="getYouTubeVideoIdString" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['youTubeVideoIdString']" default="">
	<cfreturn variables["instance"]["youTubeVideoIdString"]>
	
</cffunction>

<cffunction name="setYouTubeVideoIdString" access="public" returntype="void" output="No">
<cfargument name="youTubeVideoIdString" required="Yes" type="any">
	
	<cfset variables["instance"]["youTubeVideoIdString"]=arguments["youTubeVideoIdString"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
