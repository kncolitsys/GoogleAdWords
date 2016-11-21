<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CriterionUserInterest" hint="User Interest - represents a particular interest based vertical to be targeted. Targeting UserInterest is currently in a limited beta. If you'd like access please speak with your account representative." extends="Criterion">

<cfproperty name="userInterestId" required="no" type="long" hint="Id of this user interest. This is a required field. This field can be selected using the value 'UserInterestId'." seq="3">
<cfproperty name="userInterestName" required="no" type="string" hint="This field can be selected using the value 'UserInterestName'." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("CriterionUserInterest")>

<cffunction name="getUserInterestId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['userInterestId']" default="">
	<cfreturn variables["instance"]["userInterestId"]>
	
</cffunction>

<cffunction name="setUserInterestId" access="public" returntype="void" output="No">
<cfargument name="userInterestId" required="Yes" type="any">
	
	<cfset variables["instance"]["userInterestId"]=arguments["userInterestId"]>
		
</cffunction>

<cffunction name="getUserInterestName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['userInterestName']" default="">
	<cfreturn variables["instance"]["userInterestName"]>
	
</cffunction>

<cffunction name="setUserInterestName" access="public" returntype="void" output="No">
<cfargument name="userInterestName" required="Yes" type="any">
	
	<cfset variables["instance"]["userInterestName"]=arguments["userInterestName"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
