<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="Stats" hint="Statistics about an ad or criterion within an adgroup or campaign." extends="utils">

<cfproperty name="startDate" required="no" type="string" hint="Starting date (inclusive) of the statistics." seq="1">
<cfproperty name="endDate" required="no" type="string" hint="Ending date (inclusive) of the statistics." seq="2">
<cfproperty name="network" required="no" type="string" hint="The ad network which the stats are for." seq="3">
<cfproperty name="clicks" required="no" type="long" hint="Number of clicks. This field can be selected using the value 'Clicks'.This field can be filtered on." seq="4">
<cfproperty name="impressions" required="no" type="long" hint="Number of impressions. This field can be selected using the value 'Impressions'.This field can be filtered on." seq="5">
<cfproperty name="cost" required="no" type="Money" hint="Cost. This field can be selected using the value 'Cost'.This field can be filtered on." seq="6">
<cfproperty name="averagePosition" required="no" type="double" hint="Average position of ads. This field can be selected using the value 'AveragePosition'.This field can be filtered on." seq="7">
<cfproperty name="averageCpc" required="no" type="Money" hint="Average cost per click. This field can be selected using the value 'AverageCpc'.This field can be filtered on." seq="8">
<cfproperty name="averageCpm" required="no" type="Money" hint="Average Cost Per Impression. This field can be selected using the value 'AverageCpm'.This field can be filtered on." seq="9">
<cfproperty name="ctr" required="no" type="double" hint="Click Through Rate. This field can be selected using the value 'Ctr'.This field can be filtered on." seq="10">
<cfproperty name="conversions" required="no" type="long" hint="Number of conversions. This field can be selected using the value 'Conversions'.This field can be filtered on." seq="11">
<cfproperty name="conversionRate" required="no" type="double" hint="Conversion Rate. This field can be selected using the value 'ConversionRate'.This field can be filtered on." seq="12">
<cfproperty name="costPerConversion" required="no" type="Money" hint="Cost per Conversion. This field can be selected using the value 'CostPerConversion'.This field can be filtered on." seq="13">
<cfproperty name="conversionsManyPerClick" required="no" type="long" hint="Number of conversions (many-per-click). This field can be selected using the value 'ConversionsManyPerClick'.This field can be filtered on." seq="14">
<cfproperty name="conversionRateManyPerClick" required="no" type="double" hint="Conversion Rate (many-per-click). This field can be selected using the value 'ConversionRateManyPerClick'.This field can be filtered on." seq="15">
<cfproperty name="costPerConversionManyPerClick" required="no" type="Money" hint="Cost per Conversion (many-per-click). This field can be selected using the value 'CostPerConversionManyPerClick'.This field can be filtered on." seq="16">
<cfproperty name="viewThroughConversions" required="no" type="long" hint="Number of conversions (view-through). This field can be selected using the value 'ViewThroughConversions'.This field can be filtered on." seq="17">
<cfproperty name="totalConvValue" required="no" type="long" hint="Total conversion rate. This field can be selected using the value 'TotalConvValue'.This field can be filtered on." seq="18">
<cfproperty name="valuePerConv" required="no" type="double" hint="Value per conversion. This field can be selected using the value 'ValuePerConv'.This field can be filtered on." seq="19">
<cfproperty name="valuePerConvManyPerClick" required="no" type="double" hint="Value per conversion (many per click). This field can be selected using the value 'ValuePerConvManyPerClick'.This field can be filtered on." seq="20">
<cfproperty name="invalidClicks" required="no" type="long" hint="Invalid clicks. This field can be selected using the value 'InvalidClicks'.This field can be filtered on." seq="21">
<cfproperty name="invalidClickRate" required="no" type="double" hint="Invalid click rate. This field can be selected using the value 'InvalidClickRate'.This field can be filtered on." seq="22">
<cfproperty name="Stats_Type" required="no" type="string" xmlattribute="xsi:type" xmlnamespace="xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='https://adwords.google.com/api/adwords/cm/v201101'" hint="This field indicates the subtype of Stats of this instance. It is ignored on input, and instead xsi:type should be specified." seq="23">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<cffunction name="getStartDate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['startDate']" default="">
	<cfreturn variables["instance"]["startDate"]>
	
</cffunction>

<cffunction name="setStartDate" access="public" returntype="void" output="No">
<cfargument name="startDate" required="Yes" type="any">
	
	<cfset variables["instance"]["startDate"]=arguments["startDate"]>
		
</cffunction>

<cffunction name="getEndDate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['endDate']" default="">
	<cfreturn variables["instance"]["endDate"]>
	
</cffunction>

<cffunction name="setEndDate" access="public" returntype="void" output="No">
<cfargument name="endDate" required="Yes" type="any">
	
	<cfset variables["instance"]["endDate"]=arguments["endDate"]>
		
</cffunction>

<cffunction name="getNetwork" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['network']" default="">
	<cfreturn variables["instance"]["network"]>
	
</cffunction>

<cffunction name="setNetwork" access="public" returntype="void" output="No">
<cfargument name="network" required="Yes" type="any">
	
	<cfset variables["instance"]["network"]=arguments["network"]>
		
</cffunction>

<cffunction name="getClicks" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['clicks']" default="">
	<cfreturn variables["instance"]["clicks"]>
	
</cffunction>

<cffunction name="setClicks" access="public" returntype="void" output="No">
<cfargument name="clicks" required="Yes" type="any">
	
	<cfset variables["instance"]["clicks"]=arguments["clicks"]>
		
</cffunction>

<cffunction name="getImpressions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['impressions']" default="">
	<cfreturn variables["instance"]["impressions"]>
	
</cffunction>

<cffunction name="setImpressions" access="public" returntype="void" output="No">
<cfargument name="impressions" required="Yes" type="any">
	
	<cfset variables["instance"]["impressions"]=arguments["impressions"]>
		
</cffunction>

<cffunction name="getCost" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['cost']" default="">
	<cfreturn variables["instance"]["cost"]>
	
</cffunction>

<cffunction name="setCost" access="public" returntype="void" output="No">
<cfargument name="cost" required="Yes" type="any">
	
	<cfset variables["instance"]["cost"]=arguments["cost"]>
		
</cffunction>

<cffunction name="getAveragePosition" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['averagePosition']" default="">
	<cfreturn variables["instance"]["averagePosition"]>
	
</cffunction>

<cffunction name="setAveragePosition" access="public" returntype="void" output="No">
<cfargument name="averagePosition" required="Yes" type="any">
	
	<cfset variables["instance"]["averagePosition"]=arguments["averagePosition"]>
		
</cffunction>

<cffunction name="getAverageCpc" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['averageCpc']" default="">
	<cfreturn variables["instance"]["averageCpc"]>
	
</cffunction>

<cffunction name="setAverageCpc" access="public" returntype="void" output="No">
<cfargument name="averageCpc" required="Yes" type="any">
	
	<cfset variables["instance"]["averageCpc"]=arguments["averageCpc"]>
		
</cffunction>

<cffunction name="getAverageCpm" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['averageCpm']" default="">
	<cfreturn variables["instance"]["averageCpm"]>
	
</cffunction>

<cffunction name="setAverageCpm" access="public" returntype="void" output="No">
<cfargument name="averageCpm" required="Yes" type="any">
	
	<cfset variables["instance"]["averageCpm"]=arguments["averageCpm"]>
		
</cffunction>

<cffunction name="getCtr" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['ctr']" default="">
	<cfreturn variables["instance"]["ctr"]>
	
</cffunction>

<cffunction name="setCtr" access="public" returntype="void" output="No">
<cfargument name="ctr" required="Yes" type="any">
	
	<cfset variables["instance"]["ctr"]=arguments["ctr"]>
		
</cffunction>

<cffunction name="getConversions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversions']" default="">
	<cfreturn variables["instance"]["conversions"]>
	
</cffunction>

<cffunction name="setConversions" access="public" returntype="void" output="No">
<cfargument name="conversions" required="Yes" type="any">
	
	<cfset variables["instance"]["conversions"]=arguments["conversions"]>
		
</cffunction>

<cffunction name="getConversionRate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversionRate']" default="">
	<cfreturn variables["instance"]["conversionRate"]>
	
</cffunction>

<cffunction name="setConversionRate" access="public" returntype="void" output="No">
<cfargument name="conversionRate" required="Yes" type="any">
	
	<cfset variables["instance"]["conversionRate"]=arguments["conversionRate"]>
		
</cffunction>

<cffunction name="getCostPerConversion" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['costPerConversion']" default="">
	<cfreturn variables["instance"]["costPerConversion"]>
	
</cffunction>

<cffunction name="setCostPerConversion" access="public" returntype="void" output="No">
<cfargument name="costPerConversion" required="Yes" type="any">
	
	<cfset variables["instance"]["costPerConversion"]=arguments["costPerConversion"]>
		
</cffunction>

<cffunction name="getConversionsManyPerClick" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversionsManyPerClick']" default="">
	<cfreturn variables["instance"]["conversionsManyPerClick"]>
	
</cffunction>

<cffunction name="setConversionsManyPerClick" access="public" returntype="void" output="No">
<cfargument name="conversionsManyPerClick" required="Yes" type="any">
	
	<cfset variables["instance"]["conversionsManyPerClick"]=arguments["conversionsManyPerClick"]>
		
</cffunction>

<cffunction name="getConversionRateManyPerClick" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['conversionRateManyPerClick']" default="">
	<cfreturn variables["instance"]["conversionRateManyPerClick"]>
	
</cffunction>

<cffunction name="setConversionRateManyPerClick" access="public" returntype="void" output="No">
<cfargument name="conversionRateManyPerClick" required="Yes" type="any">
	
	<cfset variables["instance"]["conversionRateManyPerClick"]=arguments["conversionRateManyPerClick"]>
		
</cffunction>

<cffunction name="getCostPerConversionManyPerClick" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['costPerConversionManyPerClick']" default="">
	<cfreturn variables["instance"]["costPerConversionManyPerClick"]>
	
</cffunction>

<cffunction name="setCostPerConversionManyPerClick" access="public" returntype="void" output="No">
<cfargument name="costPerConversionManyPerClick" required="Yes" type="any">
	
	<cfset variables["instance"]["costPerConversionManyPerClick"]=arguments["costPerConversionManyPerClick"]>
		
</cffunction>

<cffunction name="getViewThroughConversions" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['viewThroughConversions']" default="">
	<cfreturn variables["instance"]["viewThroughConversions"]>
	
</cffunction>

<cffunction name="setViewThroughConversions" access="public" returntype="void" output="No">
<cfargument name="viewThroughConversions" required="Yes" type="any">
	
	<cfset variables["instance"]["viewThroughConversions"]=arguments["viewThroughConversions"]>
		
</cffunction>

<cffunction name="getTotalConvValue" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['totalConvValue']" default="">
	<cfreturn variables["instance"]["totalConvValue"]>
	
</cffunction>

<cffunction name="setTotalConvValue" access="public" returntype="void" output="No">
<cfargument name="totalConvValue" required="Yes" type="any">
	
	<cfset variables["instance"]["totalConvValue"]=arguments["totalConvValue"]>
		
</cffunction>

<cffunction name="getValuePerConv" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['valuePerConv']" default="">
	<cfreturn variables["instance"]["valuePerConv"]>
	
</cffunction>

<cffunction name="setValuePerConv" access="public" returntype="void" output="No">
<cfargument name="valuePerConv" required="Yes" type="any">
	
	<cfset variables["instance"]["valuePerConv"]=arguments["valuePerConv"]>
		
</cffunction>

<cffunction name="getValuePerConvManyPerClick" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['valuePerConvManyPerClick']" default="">
	<cfreturn variables["instance"]["valuePerConvManyPerClick"]>
	
</cffunction>

<cffunction name="setValuePerConvManyPerClick" access="public" returntype="void" output="No">
<cfargument name="valuePerConvManyPerClick" required="Yes" type="any">
	
	<cfset variables["instance"]["valuePerConvManyPerClick"]=arguments["valuePerConvManyPerClick"]>
		
</cffunction>

<cffunction name="getInvalidClicks" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['invalidClicks']" default="">
	<cfreturn variables["instance"]["invalidClicks"]>
	
</cffunction>

<cffunction name="setInvalidClicks" access="public" returntype="void" output="No">
<cfargument name="invalidClicks" required="Yes" type="any">
	
	<cfset variables["instance"]["invalidClicks"]=arguments["invalidClicks"]>
		
</cffunction>

<cffunction name="getInvalidClickRate" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['invalidClickRate']" default="">
	<cfreturn variables["instance"]["invalidClickRate"]>
	
</cffunction>

<cffunction name="setInvalidClickRate" access="public" returntype="void" output="No">
<cfargument name="invalidClickRate" required="Yes" type="any">
	
	<cfset variables["instance"]["invalidClickRate"]=arguments["invalidClickRate"]>
		
</cffunction>

<cffunction name="getStatsType" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['Stats_Type']" default="">
	<cfreturn variables["instance"]["Stats_Type"]>
	
</cffunction>

<cffunction name="setStatsType" access="public" returntype="void" output="No">
<cfargument name="Stats_Type" required="Yes" type="any">
	
	<cfset variables["instance"]["Stats_Type"]=arguments["Stats_Type"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201101">
	
</cffunction>	

</cfcomponent>
