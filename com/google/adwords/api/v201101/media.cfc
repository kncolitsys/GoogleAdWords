<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Media" hint="Represents some kind of media." extends="utils">

<cfproperty name="mediaId" required="no" type="long" hint="ID of this media object. This field can be selected using the value 'MediaId'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : SET, REMOVE." seq="1">
<cfproperty name="type" required="no" type="string" hint="Type of this media object. Required when using upload() to upload a new media file. This field can be selected using the value 'Type'.This field can be filtered on. This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="referenceId" required="no" type="long" hint="Media reference id key This field can be selected using the value 'ReferenceId'.This field can be filtered on. This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="dimensions" required="no" type="Media_Size_DimensionsMapEntry[]" hint="Various dimension sizes for the media. Only applies to image media (and video media for video thumbnails). This field can be selected using the value 'Dimensions'." seq="4">
<cfproperty name="urls" required="no" type="Media_Size_StringMapEntry[]" hint="Urls pointing to the resized media for the given sizes. Only applies to image media. This field can be selected using the value 'Urls'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="5">
<cfproperty name="mimeType" required="no" type="string" hint="The mime type of the media This field can be selected using the value 'MimeType'.This field can be filtered on. This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="6">
<cfproperty name="sourceUrl" required="no" type="string" hint="The url where the orginal media was downloaded from (or a file name). This field can be selected using the value 'SourceUrl'.This field can be filtered on. This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="7">
<cfproperty name="name" required="no" type="string" hint="The name of the media. The name can be used by clients to help identify previously uploaded media. This field can be selected using the value 'Name'.This field can be filtered on." seq="8">
<cfproperty name="fileSize" required="no" type="long" hint="The size of the media file in bytes This field can be selected using the value 'FileSize'.This field can be filtered on. This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="9">
<cfproperty name="creationTime" required="no" type="string" hint="Media creation date in the format YYYY-MM-DD HH:MM:SS+TZ. This is not updatable and not specifiable. This field can be selected using the value 'CreationTime'.This field can be filtered on. This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="10">
<cfproperty name="Media_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of Media of this instance. It is ignored on input, and instead xsi:type should be specified." seq="11">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getMediaId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['mediaId']" default="">
	<cfreturn variables["instance"]["mediaId"]>
	
</cffunction>

<cffunction name="setMediaId" access="public" returntype="void" output="No">
<cfargument name="mediaId" required="Yes" type="any">
	
	<cfset variables["instance"]["mediaId"]=arguments["mediaId"]>
		
</cffunction>

<cffunction name="getType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['type']" default="">
	<cfreturn variables["instance"]["type"]>
	
</cffunction>

<cffunction name="setType" access="public" returntype="void" output="No">
<cfargument name="type" required="Yes" type="any">
	
	<cfset variables["instance"]["type"]=arguments["type"]>
		
</cffunction>

<cffunction name="getReferenceId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['referenceId']" default="">
	<cfreturn variables["instance"]["referenceId"]>
	
</cffunction>

<cffunction name="setReferenceId" access="public" returntype="void" output="No">
<cfargument name="referenceId" required="Yes" type="any">
	
	<cfset variables["instance"]["referenceId"]=arguments["referenceId"]>
		
</cffunction>

<cffunction name="getDimensions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dimensions']" default="">
	<cfreturn variables["instance"]["dimensions"]>
	
</cffunction>

<cffunction name="setDimensions" access="public" returntype="void" output="No">
<cfargument name="dimensions" required="Yes" type="any">
	
	<cfset variables["instance"]["dimensions"]=arguments["dimensions"]>
		
</cffunction>

<cffunction name="getUrls" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['urls']" default="">
	<cfreturn variables["instance"]["urls"]>
	
</cffunction>

<cffunction name="setUrls" access="public" returntype="void" output="No">
<cfargument name="urls" required="Yes" type="any">
	
	<cfset variables["instance"]["urls"]=arguments["urls"]>
		
</cffunction>

<cffunction name="getMimeType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['mimeType']" default="">
	<cfreturn variables["instance"]["mimeType"]>
	
</cffunction>

<cffunction name="setMimeType" access="public" returntype="void" output="No">
<cfargument name="mimeType" required="Yes" type="any">
	
	<cfset variables["instance"]["mimeType"]=arguments["mimeType"]>
		
</cffunction>

<cffunction name="getSourceUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sourceUrl']" default="">
	<cfreturn variables["instance"]["sourceUrl"]>
	
</cffunction>

<cffunction name="setSourceUrl" access="public" returntype="void" output="No">
<cfargument name="sourceUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["sourceUrl"]=arguments["sourceUrl"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getFileSize" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['fileSize']" default="">
	<cfreturn variables["instance"]["fileSize"]>
	
</cffunction>

<cffunction name="setFileSize" access="public" returntype="void" output="No">
<cfargument name="fileSize" required="Yes" type="any">
	
	<cfset variables["instance"]["fileSize"]=arguments["fileSize"]>
		
</cffunction>

<cffunction name="getCreationTime" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['creationTime']" default="">
	<cfreturn variables["instance"]["creationTime"]>
	
</cffunction>

<cffunction name="setCreationTime" access="public" returntype="void" output="No">
<cfargument name="creationTime" required="Yes" type="any">
	
	<cfset variables["instance"]["creationTime"]=arguments["creationTime"]>
		
</cffunction>

<cffunction name="getMediaType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Media_Type']" default="">
	<cfreturn variables["instance"]["Media_Type"]>
	
</cffunction>

<cffunction name="setMediaType" access="public" returntype="void" output="No">
<cfargument name="Media_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Media_Type"]=arguments["Media_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
