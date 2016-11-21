<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ApplicationException" hint="Base class for exceptions." extends="utils">

<cfproperty name="message" required="no" type="string" hint="Error message." seq="1">
<cfproperty name="ApplicationException_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of ApplicationException of this instance. It is ignored on input, and instead xsi:type should be specified." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getMessage" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['message']" default="">
	<cfreturn variables["instance"]["message"]>
	
</cffunction>

<cffunction name="setMessage" access="public" returntype="void" output="No">
<cfargument name="message" required="Yes" type="any">
	
	<cfset variables["instance"]["message"]=arguments["message"]>
		
</cffunction>

<cffunction name="getApplicationExceptionType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ApplicationException_Type']" default="">
	<cfreturn variables["instance"]["ApplicationException_Type"]>
	
</cffunction>

<cffunction name="setApplicationExceptionType" access="public" returntype="void" output="No">
<cfargument name="ApplicationException_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["ApplicationException_Type"]=arguments["ApplicationException_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
