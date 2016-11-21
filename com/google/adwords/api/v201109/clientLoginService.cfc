<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displayname="clientLoginService">

<cfproperty name="accountType" required="No" type="any" hint="">
<cfproperty name="Email" required="No" type="any" hint="">
<cfproperty name="Passwd" required="No" type="any" hint="">
<cfproperty name="service" required="No" type="any" hint="">
<cfproperty name="source" required="No" type="any" hint="">

<cffunction name="getAuthTokenFromGoogle" access="public" returntype="string" hint="I return the authToken from Google.">
<cfargument name="email" type="string" required="no" default="#getEmail()#">
<cfargument name="pwd" type="string"required="no" default="#getPasswd()#">
<cfargument name="loginurl" type="string" required="no" default="https://www.google.com/accounts/ClientLogin">

    <cfset var authToken = "" />
	
	<!--- TechInfo: http://code.google.com/apis/accounts/docs/AuthForInstalledApps.html --->
    <cfhttp url="#arguments.loginurl#" method="post">
        <cfhttpparam name="accountType" type="url" value="GOOGLE">
        <cfhttpparam name="Email" type="url" value="#arguments.email#">
        <cfhttpparam name="Passwd" type="url" value="#arguments.pwd#">
        <cfhttpparam name="service" type="url" value="adwords">
        <cfhttpparam name="source" type="url" value="cfsolution_coldfusion_adwords_api_v201101">
    </cfhttp>

	<cfif not FindNoCase("Auth=",cfhttp.filecontent)>
		<!--- throw error if login was not successful --->
		<cfthrow type="loginservice" message="Google ClientLogin failed" detail="Response: #cfhttp.filecontent#">
	<cfelse>
		<!--- parse token from http response and save to variable authToken --->
		<cfset authToken = Mid(cfhttp.filecontent, FindNoCase("Auth=",cfhttp.filecontent) + (Len("Auth=")), Len(cfhttp.filecontent)) />
	</cfif>
	<cfreturn authToken />
</cffunction>

<cffunction name="getAccountType" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.accountType>
	
</cffunction>

<cffunction name="setAccountType" access="public" returntype="void" output="No">
<cfargument name="accountType" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["accountType"]=arguments.accountType>
		
</cffunction>


<cffunction name="getEmail" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.Email>
	
</cffunction>

<cffunction name="setEmail" access="public" returntype="void" output="No">
<cfargument name="Email" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["Email"]=arguments.Email>
		
</cffunction>


<cffunction name="getPasswd" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.Passwd>
	
</cffunction>

<cffunction name="setPasswd" access="public" returntype="void" output="No">
<cfargument name="Passwd" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["Passwd"]=arguments.Passwd>
		
</cffunction>


<cffunction name="getService" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.service>
	
</cffunction>

<cffunction name="setService" access="public" returntype="void" output="No">
<cfargument name="service" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["service"]=arguments.service>
		
</cffunction>


<cffunction name="getSource" access="public" returntype="any" output="No">
	
	<cfreturn variables.instance.source>
	
</cffunction>

<cffunction name="setSource" access="public" returntype="void" output="No">
<cfargument name="source" required="Yes" type="any">
	
	<cfparam name="variables.instance" default="#StructNew()#">
	<cfset variables.instance["source"]=arguments.source>
		
</cffunction>


</cfcomponent>