<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConversionTrackerOperation" hint="Operations for conversion tracker." extends="Operation">

<cfproperty name="operand" required="no" type="ConversionTracker" hint="This field is required and should not be null." seq="3">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setOperationType("ConversionTrackerOperation")>

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
