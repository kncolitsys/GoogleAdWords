<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="RateExceededError" hint="Signals that a call failed because a measured rate exceeded." extends="ApiError">

<cfproperty name="reason" required="no" type="string" hint="The error reason represented by an enum." seq="5">
<cfproperty name="rateName" required="no" type="string" hint="Cause of the rate exceeded error." seq="6">
<cfproperty name="rateScope" required="no" type="string" hint="The scope of the rate (ACCOUNT/DEVELOPER)." seq="7">
<cfproperty name="retryAfterSeconds" required="no" type="int" hint="The amount of time (in seconds) the client should wait before retrying the request." seq="8">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setApiErrorType("RateExceededError")>

<cffunction name="getReason" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['reason']" default="">
	<cfreturn variables["instance"]["reason"]>
	
</cffunction>

<cffunction name="setReason" access="public" returntype="void" output="No">
<cfargument name="reason" required="Yes" type="any">
	
	<cfset variables["instance"]["reason"]=arguments["reason"]>
		
</cffunction>

<cffunction name="getRateName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['rateName']" default="">
	<cfreturn variables["instance"]["rateName"]>
	
</cffunction>

<cffunction name="setRateName" access="public" returntype="void" output="No">
<cfargument name="rateName" required="Yes" type="any">
	
	<cfset variables["instance"]["rateName"]=arguments["rateName"]>
		
</cffunction>

<cffunction name="getRateScope" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['rateScope']" default="">
	<cfreturn variables["instance"]["rateScope"]>
	
</cffunction>

<cffunction name="setRateScope" access="public" returntype="void" output="No">
<cfargument name="rateScope" required="Yes" type="any">
	
	<cfset variables["instance"]["rateScope"]=arguments["rateScope"]>
		
</cffunction>

<cffunction name="getRetryAfterSeconds" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['retryAfterSeconds']" default="">
	<cfreturn variables["instance"]["retryAfterSeconds"]>
	
</cffunction>

<cffunction name="setRetryAfterSeconds" access="public" returntype="void" output="No">
<cfargument name="retryAfterSeconds" required="Yes" type="any">
	
	<cfset variables["instance"]["retryAfterSeconds"]=arguments["retryAfterSeconds"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
