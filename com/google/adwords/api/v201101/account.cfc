<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Account" hint="Represents a single AdWords account." extends="utils">

<cfproperty name="customerId" required="no" type="long" hint="The 10-digit ID that uniquely identifies the AdWords account. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored." seq="1">
<cfproperty name="login" required="no" type="string" hint="The email address of the account's first login user, if any. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="companyName" required="no" type="string" hint="The company name of the account, if any. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored." seq="3">
<cfproperty name="canManageClients" required="no" type="boolean" hint="Whether this account can manage clients. This field is read only and should not be set for following Operators : ADD. If this field is sent to the API, it will be ignored." seq="4">
<cfproperty name="currencyCode" required="no" type="string" hint="The currency in which this account operates. We support a subset of the currency codes derived from the ISO 4217 standard. See Currency Codes for the currently supported currencies. This field can only be set during creation of the account. This field is not provided by ServicedAccountService. This field is required and should not be null when it is contained within Operators : ADD. The length of this string should be between 3 and 3, inclusive." seq="5">
<cfproperty name="dateTimeZone" required="no" type="string" hint="The local timezone ID for this Account. See Time Zone Codes for the currently supported list. This field can only be set during creation of the account. This field is not provided by ServicedAccountService. This field is required and should not be null when it is contained within Operators : ADD." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getCustomerId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['customerId']" default="">
	<cfreturn variables["instance"]["customerId"]>
	
</cffunction>

<cffunction name="setCustomerId" access="public" returntype="void" output="No">
<cfargument name="customerId" required="Yes" type="any">
	
	<cfset variables["instance"]["customerId"]=arguments["customerId"]>
		
</cffunction>

<cffunction name="getLogin" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['login']" default="">
	<cfreturn variables["instance"]["login"]>
	
</cffunction>

<cffunction name="setLogin" access="public" returntype="void" output="No">
<cfargument name="login" required="Yes" type="any">
	
	<cfset variables["instance"]["login"]=arguments["login"]>
		
</cffunction>

<cffunction name="getCompanyName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['companyName']" default="">
	<cfreturn variables["instance"]["companyName"]>
	
</cffunction>

<cffunction name="setCompanyName" access="public" returntype="void" output="No">
<cfargument name="companyName" required="Yes" type="any">
	
	<cfset variables["instance"]["companyName"]=arguments["companyName"]>
		
</cffunction>

<cffunction name="getCanManageClients" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['canManageClients']" default="">
	<cfreturn variables["instance"]["canManageClients"]>
	
</cffunction>

<cffunction name="setCanManageClients" access="public" returntype="void" output="No">
<cfargument name="canManageClients" required="Yes" type="any">
	
	<cfset variables["instance"]["canManageClients"]=arguments["canManageClients"]>
		
</cffunction>

<cffunction name="getCurrencyCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['currencyCode']" default="">
	<cfreturn variables["instance"]["currencyCode"]>
	
</cffunction>

<cffunction name="setCurrencyCode" access="public" returntype="void" output="No">
<cfargument name="currencyCode" required="Yes" type="any">
	
	<cfset variables["instance"]["currencyCode"]=arguments["currencyCode"]>
		
</cffunction>

<cffunction name="getDateTimeZone" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dateTimeZone']" default="">
	<cfreturn variables["instance"]["dateTimeZone"]>
	
</cffunction>

<cffunction name="setDateTimeZone" access="public" returntype="void" output="No">
<cfargument name="dateTimeZone" required="Yes" type="any">
	
	<cfset variables["instance"]["dateTimeZone"]=arguments["dateTimeZone"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/mcm/v201101">
	
</cffunction>	

</cfcomponent>
