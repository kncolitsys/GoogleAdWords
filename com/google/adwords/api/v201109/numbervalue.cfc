<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="NumberValue" hint="Number value types for constructing number valued ranges." extends="ComparableValue">


<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>
<!--- set the type of the extending cfc  --->
<cfset setComparableValueType("NumberValue")>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>
