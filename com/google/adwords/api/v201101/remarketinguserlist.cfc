<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="RemarketingUserList" hint="User list targeting as a collection of conversion types. RemarketingUserList can be created in the following ways : Using a single conversion type name: The service will create a new ConversionType and associate it with the RemarketingUserList. Using one or many existing conversion type Ids: The service will associate the conversion types with the RemarketingUserList. The Id of the ConversionType can be obtained using ConversionTrackerService." extends="UserList">

<cfproperty name="conversionTypes" required="no" type="UserListConversionType[]" hint="Conversion types associated with this user list. This field can be selected using the value 'ConversionTypes'. This field is required and should not be null when it is contained within Operators : ADD." seq="13">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setUserListType("RemarketingUserList")>

<cffunction name="getConversionTypes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversionTypes']" default="">
	<cfreturn variables["instance"]["conversionTypes"]>
	
</cffunction>

<cffunction name="setConversionTypes" access="public" returntype="void" output="No">
<cfargument name="conversionTypes" required="Yes" type="any">
	
	<cfset variables["instance"]["conversionTypes"]=arguments["conversionTypes"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
