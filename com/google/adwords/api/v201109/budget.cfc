<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Budget" hint="Budgets are used for managing the amount of money spent on AdWords." extends="utils">

<cfproperty name="period" required="no" type="string" hint="Period over which to spend the budget. MONTHLY is not available to most users. This field can be selected using the value 'Period'." seq="1">
<cfproperty name="amount" required="no" type="Money" hint="Amount of budget in the local currency for the account. This field can be selected using the value 'Amount'.This field can be filtered on. This field must be greater than or equal to 1." seq="2">
<cfproperty name="deliveryMethod" required="no" type="string" hint="Delivery method for the budget. This field can be selected using the value 'DeliveryMethod'." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getPeriod" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['period']" default="">
	<cfreturn variables["instance"]["period"]>
	
</cffunction>

<cffunction name="setPeriod" access="public" returntype="void" output="No">
<cfargument name="period" required="Yes" type="any">
	
	<cfset variables["instance"]["period"]=arguments["period"]>
		
</cffunction>

<cffunction name="getAmount" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['amount']" default="">
	<cfreturn variables["instance"]["amount"]>
	
</cffunction>

<cffunction name="setAmount" access="public" returntype="void" output="No">
<cfargument name="amount" required="Yes" type="any">
	
	<cfset variables["instance"]["amount"]=arguments["amount"]>
		
</cffunction>

<cffunction name="getDeliveryMethod" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['deliveryMethod']" default="">
	<cfreturn variables["instance"]["deliveryMethod"]>
	
</cffunction>

<cffunction name="setDeliveryMethod" access="public" returntype="void" output="No">
<cfargument name="deliveryMethod" required="Yes" type="any">
	
	<cfset variables["instance"]["deliveryMethod"]=arguments["deliveryMethod"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
