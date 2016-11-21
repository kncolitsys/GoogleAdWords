<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="PercentCPA" hint="Percentage CPA based bidding where user pays a percent of conversions. This bidding strategy is available only to some advertisers. A campaign can only be created with PercentCPA bidding strategy. Existing campaigns with a different bidding strategy cannot be transitioned to PercentCPA. Similarly, once created as a PercentCPA, a campaign cannot be transitioned to any other bidding strategy." extends="BiddingStrategy">


<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setBiddingStrategyType("PercentCPA")>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
