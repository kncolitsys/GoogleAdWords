<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="SoapHeader" hint="Defines the required and optional elements within the header of a SOAP request." extends="utils">

<cfproperty name="authToken" required="no" type="string" hint="Authentication token from Google ClientLogin API. Developers need to authenticate themselves with that API before they can send a request to AdWords API. This header identifies either the MCC manager acting on behalf of their client, or the advertiser managing their own account." seq="1">
<cfproperty name="clientCustomerId" required="no" type="string" hint="Optional header: the customer id of the client of the MCC manager. Applicable only if an MCC manager, as identified by authToken, is acting on behalf of their client." seq="2">
<cfproperty name="clientEmail" required="no" type="string" hint="Optional header: the login email of a client of the MCC manager. Applicable only if an MCC manager, as identified by authToken, is acting on behalf of their client." seq="3">
<cfproperty name="developerToken" required="no" type="string" hint="Developer token to identify that the person making the call has enough quota." seq="4">
<cfproperty name="userAgent" required="no" type="string" hint="UserAgent is used to track distribution of API client programs and application usage. The client is responsible for putting in a meaningful value for tracking purposes. To be clear this is not the same as an HTTP user agent." seq="5">
<cfproperty name="validateOnly" required="no" type="boolean" hint="Used to validate the request without executing it." seq="6">
<cfproperty name="partialFailure" required="no" type="boolean" hint="If true, API will try to commit as many error free operations as possible and report the other operations' errors. Ignored for non-mutate calls." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAuthToken" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['authToken']" default="">
	<cfreturn variables["instance"]["authToken"]>
	
</cffunction>

<cffunction name="setAuthToken" access="public" returntype="void" output="No">
<cfargument name="authToken" required="Yes" type="any">
	
	<cfset variables["instance"]["authToken"]=arguments["authToken"]>
		
</cffunction>

<cffunction name="getClientCustomerId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientCustomerId']" default="">
	<cfreturn variables["instance"]["clientCustomerId"]>
	
</cffunction>

<cffunction name="setClientCustomerId" access="public" returntype="void" output="No">
<cfargument name="clientCustomerId" required="Yes" type="any">
	
	<cfset variables["instance"]["clientCustomerId"]=arguments["clientCustomerId"]>
		
</cffunction>

<cffunction name="getClientEmail" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clientEmail']" default="">
	<cfreturn variables["instance"]["clientEmail"]>
	
</cffunction>

<cffunction name="setClientEmail" access="public" returntype="void" output="No">
<cfargument name="clientEmail" required="Yes" type="any">
	
	<cfset variables["instance"]["clientEmail"]=arguments["clientEmail"]>
		
</cffunction>

<cffunction name="getDeveloperToken" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['developerToken']" default="">
	<cfreturn variables["instance"]["developerToken"]>
	
</cffunction>

<cffunction name="setDeveloperToken" access="public" returntype="void" output="No">
<cfargument name="developerToken" required="Yes" type="any">
	
	<cfset variables["instance"]["developerToken"]=arguments["developerToken"]>
		
</cffunction>

<cffunction name="getUserAgent" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['userAgent']" default="">
	<cfreturn variables["instance"]["userAgent"]>
	
</cffunction>

<cffunction name="setUserAgent" access="public" returntype="void" output="No">
<cfargument name="userAgent" required="Yes" type="any">
	
	<cfset variables["instance"]["userAgent"]=arguments["userAgent"]>
		
</cffunction>

<cffunction name="getValidateOnly" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['validateOnly']" default="">
	<cfreturn variables["instance"]["validateOnly"]>
	
</cffunction>

<cffunction name="setValidateOnly" access="public" returntype="void" output="No">
<cfargument name="validateOnly" required="Yes" type="any">
	
	<cfset variables["instance"]["validateOnly"]=arguments["validateOnly"]>
		
</cffunction>

<cffunction name="getPartialFailure" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['partialFailure']" default="">
	<cfreturn variables["instance"]["partialFailure"]>
	
</cffunction>

<cffunction name="setPartialFailure" access="public" returntype="void" output="No">
<cfargument name="partialFailure" required="Yes" type="any">
	
	<cfset variables["instance"]["partialFailure"]=arguments["partialFailure"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
