<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Bid" hint="Represents a bid on a criterion." extends="utils">

<cfproperty name="amount" required="no" type="Money" hint="Bid amount." seq="1">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getAmount" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['amount']" default="">
	<cfreturn variables["instance"]["amount"]>
	
</cffunction>

<cffunction name="setAmount" access="public" returntype="void" output="No">
<cfargument name="amount" required="Yes" type="any">
	
	<cfset variables["instance"]["amount"]=arguments["amount"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
