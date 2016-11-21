<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ClientSelector" hint="A filter to select specific clients and campaigns that are managed by an MCC." extends="utils">

<cfproperty name="login" required="no" type="string" hint="The contact email address of the client. This value must be specified within this ClientSelector to specify the target client for selection." seq="1">
<cfproperty name="predicates" required="no" type="Predicate[]" hint="Additional predicates to select campaigns associated with the specified client. This predicate should be of the form: CampaignId IN <list-of-campaign-IDs> This field must contain distinct elements." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getLogin" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['login']" default="">
	<cfreturn variables["instance"]["login"]>
	
</cffunction>

<cffunction name="setLogin" access="public" returntype="void" output="No">
<cfargument name="login" required="Yes" type="any">
	
	<cfset variables["instance"]["login"]=arguments["login"]>
		
</cffunction>

<cffunction name="getPredicates" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['predicates']" default="">
	<cfreturn variables["instance"]["predicates"]>
	
</cffunction>

<cffunction name="setPredicates" access="public" returntype="void" output="No">
<cfargument name="predicates" required="Yes" type="any">
	
	<cfset variables["instance"]["predicates"]=arguments["predicates"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
