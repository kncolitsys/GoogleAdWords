<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Money" hint="Represents a money amount." extends="ComparableValue">

<cfproperty name="microAmount" required="no" type="long" hint="Amount in micros. One million is equivalent to one unit." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setComparableValueType("Money")>

<cffunction name="getMicroAmount" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['microAmount']" default="">
	<cfreturn variables["instance"]["microAmount"]>
	
</cffunction>

<cffunction name="setMicroAmount" access="public" returntype="void" output="No">
<cfargument name="microAmount" required="Yes" type="any">
	
	<cfset variables["instance"]["microAmount"]=arguments["microAmount"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
