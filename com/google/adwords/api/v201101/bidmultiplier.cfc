<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="BidMultiplier" hint="Represents a multiplier to modify a bid. The final value after modification is represented by the multiplied bid value." extends="utils">

<cfproperty name="multiplier" required="no" type="double" seq="1">
<cfproperty name="multipliedBid" required="no" type="Bid" hint="The bid after multiplying original bid with the multiplier. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getMultiplier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['multiplier']" default="">
	<cfreturn variables["instance"]["multiplier"]>
	
</cffunction>

<cffunction name="setMultiplier" access="public" returntype="void" output="No">
<cfargument name="multiplier" required="Yes" type="any">
	
	<cfset variables["instance"]["multiplier"]=arguments["multiplier"]>
		
</cffunction>

<cffunction name="getMultipliedBid" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['multipliedBid']" default="">
	<cfreturn variables["instance"]["multipliedBid"]>
	
</cffunction>

<cffunction name="setMultipliedBid" access="public" returntype="void" output="No">
<cfargument name="multipliedBid" required="Yes" type="any">
	
	<cfset variables["instance"]["multipliedBid"]=arguments["multipliedBid"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
