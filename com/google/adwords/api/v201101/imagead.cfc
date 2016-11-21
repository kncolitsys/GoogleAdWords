<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ImageAd" hint="Represents an ImageAd." extends="Ad">

<cfproperty name="image" required="no" type="Image" hint="The image data for the ad" seq="8">
<cfproperty name="name" required="no" type="string" hint="The name label for this ad This field can be selected using the value 'ImageCreativeName'.This field can be filtered on. This field is required and should not be null." seq="9">
<cfproperty name="adToCopyImageFrom" required="no" type="long" hint="For ADD operations only: use this field to specify an existing image ad to copy the image from, in which case the 'image' field can be left empty. This is the preferred way of copying images over re-uploading the same image. This field is read only and should not be set for following Operators : SET, REMOVE. If this field is sent to the API, it will be ignored." seq="10">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdType("ImageAd")>

<cffunction name="getImage" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['image']" default="">
	<cfreturn variables["instance"]["image"]>
	
</cffunction>

<cffunction name="setImage" access="public" returntype="void" output="No">
<cfargument name="image" required="Yes" type="any">
	
	<cfset variables["instance"]["image"]=arguments["image"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getAdToCopyImageFrom" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adToCopyImageFrom']" default="">
	<cfreturn variables["instance"]["adToCopyImageFrom"]>
	
</cffunction>

<cffunction name="setAdToCopyImageFrom" access="public" returntype="void" output="No">
<cfargument name="adToCopyImageFrom" required="Yes" type="any">
	
	<cfset variables["instance"]["adToCopyImageFrom"]=arguments["adToCopyImageFrom"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
