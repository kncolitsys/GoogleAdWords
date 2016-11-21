<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LocationSyncExtension" hint="Local business center(LBC) sync extension that ties a LBC account with a campaign." extends="AdExtension">

<cfproperty name="email" required="no" type="string" hint="Email associated with the LBC backend data This field can be selected using the value 'Email'. This field is required and should not be null." seq="3">
<cfproperty name="authToken" required="no" type="string" hint="Required authentication token (from ClientLogin API) for the email - input only. This field can be selected using the value 'AuthToken'." seq="4">
<cfproperty name="iconMediaId" required="no" type="long" hint="The business icon to use with the extension This field can be selected using the value 'IconMediaId'." seq="5">
<cfproperty name="shouldSyncUrl" required="no" type="boolean" hint="Whether we should copy homepage url from LBC entries as the destination url in location extension. This field can be selected using the value 'ShouldSyncUrl'." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setAdExtensionType("LocationSyncExtension")>

<cffunction name="getEmail" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['email']" default="">
	<cfreturn variables["instance"]["email"]>
	
</cffunction>

<cffunction name="setEmail" access="public" returntype="void" output="No">
<cfargument name="email" required="Yes" type="any">
	
	<cfset variables["instance"]["email"]=arguments["email"]>
		
</cffunction>

<cffunction name="getAuthToken" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['authToken']" default="">
	<cfreturn variables["instance"]["authToken"]>
	
</cffunction>

<cffunction name="setAuthToken" access="public" returntype="void" output="No">
<cfargument name="authToken" required="Yes" type="any">
	
	<cfset variables["instance"]["authToken"]=arguments["authToken"]>
		
</cffunction>

<cffunction name="getIconMediaId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['iconMediaId']" default="">
	<cfreturn variables["instance"]["iconMediaId"]>
	
</cffunction>

<cffunction name="setIconMediaId" access="public" returntype="void" output="No">
<cfargument name="iconMediaId" required="Yes" type="any">
	
	<cfset variables["instance"]["iconMediaId"]=arguments["iconMediaId"]>
		
</cffunction>

<cffunction name="getShouldSyncUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['shouldSyncUrl']" default="">
	<cfreturn variables["instance"]["shouldSyncUrl"]>
	
</cffunction>

<cffunction name="setShouldSyncUrl" access="public" returntype="void" output="No">
<cfargument name="shouldSyncUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["shouldSyncUrl"]=arguments["shouldSyncUrl"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
