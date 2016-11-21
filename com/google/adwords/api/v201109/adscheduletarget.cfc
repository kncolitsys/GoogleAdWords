<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="AdScheduleTarget" hint="Immutable structure to hold an ad schedule target." extends="Target">

<cfproperty name="dayOfWeek" required="no" type="string" hint="Day of the week the schedule applies to. This field is required and should not be null." seq="2">
<cfproperty name="startHour" required="no" type="int" hint="Starting hour in 24 hour time. This field must be between 0 and 23, inclusive." seq="3">
<cfproperty name="startMinute" required="no" type="string" hint="Interval starts these minutes after the starting hour. This field is required and should not be null." seq="4">
<cfproperty name="endHour" required="no" type="int" hint="Ending hour in 24 hour time; 24 signifies end of the day. This field must be between 0 and 24, inclusive." seq="5">
<cfproperty name="endMinute" required="no" type="string" hint="Interval ends these minutes after the ending hour. This field is required and should not be null." seq="6">
<cfproperty name="bidMultiplier" required="no" type="double" hint="Multiplying factor for bids during this specified time interval." seq="7">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setTargetType("AdScheduleTarget")>

<cffunction name="getDayOfWeek" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['dayOfWeek']" default="">
	<cfreturn variables["instance"]["dayOfWeek"]>
	
</cffunction>

<cffunction name="setDayOfWeek" access="public" returntype="void" output="No">
<cfargument name="dayOfWeek" required="Yes" type="any">
	
	<cfset variables["instance"]["dayOfWeek"]=arguments["dayOfWeek"]>
		
</cffunction>

<cffunction name="getStartHour" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['startHour']" default="">
	<cfreturn variables["instance"]["startHour"]>
	
</cffunction>

<cffunction name="setStartHour" access="public" returntype="void" output="No">
<cfargument name="startHour" required="Yes" type="any">
	
	<cfset variables["instance"]["startHour"]=arguments["startHour"]>
		
</cffunction>

<cffunction name="getStartMinute" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['startMinute']" default="">
	<cfreturn variables["instance"]["startMinute"]>
	
</cffunction>

<cffunction name="setStartMinute" access="public" returntype="void" output="No">
<cfargument name="startMinute" required="Yes" type="any">
	
	<cfset variables["instance"]["startMinute"]=arguments["startMinute"]>
		
</cffunction>

<cffunction name="getEndHour" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['endHour']" default="">
	<cfreturn variables["instance"]["endHour"]>
	
</cffunction>

<cffunction name="setEndHour" access="public" returntype="void" output="No">
<cfargument name="endHour" required="Yes" type="any">
	
	<cfset variables["instance"]["endHour"]=arguments["endHour"]>
		
</cffunction>

<cffunction name="getEndMinute" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['endMinute']" default="">
	<cfreturn variables["instance"]["endMinute"]>
	
</cffunction>

<cffunction name="setEndMinute" access="public" returntype="void" output="No">
<cfargument name="endMinute" required="Yes" type="any">
	
	<cfset variables["instance"]["endMinute"]=arguments["endMinute"]>
		
</cffunction>

<cffunction name="getBidMultiplier" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['bidMultiplier']" default="">
	<cfreturn variables["instance"]["bidMultiplier"]>
	
</cffunction>

<cffunction name="setBidMultiplier" access="public" returntype="void" output="No">
<cfargument name="bidMultiplier" required="Yes" type="any">
	
	<cfset variables["instance"]["bidMultiplier"]=arguments["bidMultiplier"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
