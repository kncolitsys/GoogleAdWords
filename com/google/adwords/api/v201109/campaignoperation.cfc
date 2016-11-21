<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="CampaignOperation" hint="An operation on an AdWords campaign. Note: The REMOVE operator is not supported. To remove a campaign, set its status to DELETED." extends="Operation">

<cfproperty name="biddingTransition" required="no" type="BiddingTransition" hint="Changes the bidding strategy for this campaign. Use only when performing a SET operation." seq="3">
<cfproperty name="operand" required="no" type="Campaign" hint="This field is required and should not be null." seq="4">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationType("CampaignOperation")>

<cffunction name="getBiddingTransition" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['biddingTransition']" default="">
	<cfreturn variables["instance"]["biddingTransition"]>
	
</cffunction>

<cffunction name="setBiddingTransition" access="public" returntype="void" output="No">
<cfargument name="biddingTransition" required="Yes" type="any">
	
	<cfset variables["instance"]["biddingTransition"]=arguments["biddingTransition"]>
		
</cffunction>

<cffunction name="getOperand" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['operand']" default="">
	<cfreturn variables["instance"]["operand"]>
	
</cffunction>

<cffunction name="setOperand" access="public" returntype="void" output="No">
<cfargument name="operand" required="Yes" type="any">
	
	<cfset variables["instance"]["operand"]=arguments["operand"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
