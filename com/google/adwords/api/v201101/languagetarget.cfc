<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="LanguageTarget" hint="Represents language for targeting. The list of languages available for targeting are listed here." extends="Target">

<cfproperty name="languageCode" required="no" type="string" hint="Language code. This field is required and should not be null. This string must not be empty." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("LanguageTarget")>

<cffunction name="getLanguageCode" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['languageCode']" default="">
	<cfreturn variables["instance"]["languageCode"]>
	
</cffunction>

<cffunction name="setLanguageCode" access="public" returntype="void" output="No">
<cfargument name="languageCode" required="Yes" type="any">
	
	<cfset variables["instance"]["languageCode"]=arguments["languageCode"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
