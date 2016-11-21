<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CriterionUserList" hint="UserList - represents a user list that is defined by the advertiser to be targeted." extends="Criterion">

<cfproperty name="userListId" required="no" type="long" hint="Id of this user list. This is a required field. This field can be selected using the value 'UserListId'." seq="4">
<cfproperty name="userListName" required="no" type="string" hint="This field can be selected using the value 'UserListName'." seq="5">
<cfproperty name="userListMembershipStatus" required="no" type="string" hint="This field can be selected using the value 'UserListMembershipStatus'.This field can be filtered on." seq="6">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setCriterionType("CriterionUserList")>

<cffunction name="getUserListId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['userListId']" default="">
	<cfreturn variables["instance"]["userListId"]>
	
</cffunction>

<cffunction name="setUserListId" access="public" returntype="void" output="No">
<cfargument name="userListId" required="Yes" type="any">
	
	<cfset variables["instance"]["userListId"]=arguments["userListId"]>
		
</cffunction>

<cffunction name="getUserListName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['userListName']" default="">
	<cfreturn variables["instance"]["userListName"]>
	
</cffunction>

<cffunction name="setUserListName" access="public" returntype="void" output="No">
<cfargument name="userListName" required="Yes" type="any">
	
	<cfset variables["instance"]["userListName"]=arguments["userListName"]>
		
</cffunction>

<cffunction name="getUserListMembershipStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['userListMembershipStatus']" default="">
	<cfreturn variables["instance"]["userListMembershipStatus"]>
	
</cffunction>

<cffunction name="setUserListMembershipStatus" access="public" returntype="void" output="No">
<cfargument name="userListMembershipStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["userListMembershipStatus"]=arguments["userListMembershipStatus"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
