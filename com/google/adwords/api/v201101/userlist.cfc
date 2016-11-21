<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="UserList" hint="Represents a UserList object that is sent over the wire. This is a list of users an account may target." extends="utils">

<cfproperty name="id" required="no" type="long" hint="Id of this user list. This field can be selected using the value 'Id'.This field can be filtered on. This field is required and should not be null when it is contained within Operators : SET." seq="1">
<cfproperty name="isReadOnly" required="no" type="boolean" hint="A flag that indicates if a user may edit a list. Depends on the list ownership and list type. For example, external remarketing user lists are not editable. This field can be selected using the value 'IsReadOnly'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="2">
<cfproperty name="name" required="no" type="string" hint="Name of this user list. This field can be selected using the value 'Name'.This field can be filtered on." seq="3">
<cfproperty name="description" required="no" type="string" hint="Description of this user list. This field can be selected using the value 'Description'." seq="4">
<cfproperty name="status" required="no" type="string" hint="Membership status of this user list. Indicates whether a user list is open or active. Only open user lists can accumulate more users and can be targeted to. This field can be selected using the value 'Status'.This field can be filtered on." seq="5">
<cfproperty name="accessReason" required="no" type="string" hint="Indicates the reason this account has been granted access to the list. The reason can be Shared, Owned, Licensed or Subscribed. This field can be selected using the value 'AccessReason'.This field can be filtered on." seq="6">
<cfproperty name="accountUserListStatus" required="no" type="string" hint="Indicates if this share is still active. When a UserList is shared with the user this field is set to Active. Later the userList owner can decide to revoke the share and make it Inactive. The default value of this field is set to Active. This field can be selected using the value 'AccountUserListStatus'.This field can be filtered on." seq="7">
<cfproperty name="membershipLifeSpan" required="no" type="long" hint="Number of inactive days after which a user should be removed from the list. This field can be selected using the value 'MembershipLifeSpan'.This field can be filtered on." seq="8">
<cfproperty name="size" required="no" type="long" hint="Estimated number of users in this user list. This value is null if the number of users has not yet been determined. This field can be selected using the value 'Size'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="9">
<cfproperty name="sizeRange" required="no" type="string" hint="Size range in terms of number of users of the UserList. This field can be selected using the value 'SizeRange'. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="10">
<cfproperty name="type" required="no" type="string" hint="Type of this list: remarketing/logical/external remarketing. This field can be selected using the value 'Type'.This field can be filtered on. This field is read only and should not be set. If this field is sent to the API, it will be ignored." seq="11">
<cfproperty name="UserList_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of UserList of this instance. It is ignored on input, and instead xsi:type should be specified." seq="12">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getId" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['id']" default="">
	<cfreturn variables["instance"]["id"]>
	
</cffunction>

<cffunction name="setId" access="public" returntype="void" output="No">
<cfargument name="id" required="Yes" type="any">
	
	<cfset variables["instance"]["id"]=arguments["id"]>
		
</cffunction>

<cffunction name="getIsReadOnly" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['isReadOnly']" default="">
	<cfreturn variables["instance"]["isReadOnly"]>
	
</cffunction>

<cffunction name="setIsReadOnly" access="public" returntype="void" output="No">
<cfargument name="isReadOnly" required="Yes" type="any">
	
	<cfset variables["instance"]["isReadOnly"]=arguments["isReadOnly"]>
		
</cffunction>

<cffunction name="getName" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['name']" default="">
	<cfreturn variables["instance"]["name"]>
	
</cffunction>

<cffunction name="setName" access="public" returntype="void" output="No">
<cfargument name="name" required="Yes" type="any">
	
	<cfset variables["instance"]["name"]=arguments["name"]>
		
</cffunction>

<cffunction name="getDescription" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['description']" default="">
	<cfreturn variables["instance"]["description"]>
	
</cffunction>

<cffunction name="setDescription" access="public" returntype="void" output="No">
<cfargument name="description" required="Yes" type="any">
	
	<cfset variables["instance"]["description"]=arguments["description"]>
		
</cffunction>

<cffunction name="getStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['status']" default="">
	<cfreturn variables["instance"]["status"]>
	
</cffunction>

<cffunction name="setStatus" access="public" returntype="void" output="No">
<cfargument name="status" required="Yes" type="any">
	
	<cfset variables["instance"]["status"]=arguments["status"]>
		
</cffunction>

<cffunction name="getAccessReason" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['accessReason']" default="">
	<cfreturn variables["instance"]["accessReason"]>
	
</cffunction>

<cffunction name="setAccessReason" access="public" returntype="void" output="No">
<cfargument name="accessReason" required="Yes" type="any">
	
	<cfset variables["instance"]["accessReason"]=arguments["accessReason"]>
		
</cffunction>

<cffunction name="getAccountUserListStatus" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['accountUserListStatus']" default="">
	<cfreturn variables["instance"]["accountUserListStatus"]>
	
</cffunction>

<cffunction name="setAccountUserListStatus" access="public" returntype="void" output="No">
<cfargument name="accountUserListStatus" required="Yes" type="any">
	
	<cfset variables["instance"]["accountUserListStatus"]=arguments["accountUserListStatus"]>
		
</cffunction>

<cffunction name="getMembershipLifeSpan" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['membershipLifeSpan']" default="">
	<cfreturn variables["instance"]["membershipLifeSpan"]>
	
</cffunction>

<cffunction name="setMembershipLifeSpan" access="public" returntype="void" output="No">
<cfargument name="membershipLifeSpan" required="Yes" type="any">
	
	<cfset variables["instance"]["membershipLifeSpan"]=arguments["membershipLifeSpan"]>
		
</cffunction>

<cffunction name="getSize" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['size']" default="">
	<cfreturn variables["instance"]["size"]>
	
</cffunction>

<cffunction name="setSize" access="public" returntype="void" output="No">
<cfargument name="size" required="Yes" type="any">
	
	<cfset variables["instance"]["size"]=arguments["size"]>
		
</cffunction>

<cffunction name="getSizeRange" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sizeRange']" default="">
	<cfreturn variables["instance"]["sizeRange"]>
	
</cffunction>

<cffunction name="setSizeRange" access="public" returntype="void" output="No">
<cfargument name="sizeRange" required="Yes" type="any">
	
	<cfset variables["instance"]["sizeRange"]=arguments["sizeRange"]>
		
</cffunction>

<cffunction name="getType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['type']" default="">
	<cfreturn variables["instance"]["type"]>
	
</cffunction>

<cffunction name="setType" access="public" returntype="void" output="No">
<cfargument name="type" required="Yes" type="any">
	
	<cfset variables["instance"]["type"]=arguments["type"]>
		
</cffunction>

<cffunction name="getUserListType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['UserList_Type']" default="">
	<cfreturn variables["instance"]["UserList_Type"]>
	
</cffunction>

<cffunction name="setUserListType" access="public" returntype="void" output="No">
<cfargument name="UserList_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["UserList_Type"]=arguments["UserList_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
