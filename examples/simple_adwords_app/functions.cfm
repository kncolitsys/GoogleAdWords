<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
--->

<cffunction name="structToExtNodesStruct" access="public" returntype="any" output="false">
	<cfargument name="str" required="true" type="any"/>
	<cfargument name="stExtraNodes" required="false" type="struct" default="#structNew()#"/>

	<cfset var stTemp = "">
	<cfset var key = "">
	<cfset var i = "">
	<cfset var aReturn = arrayNew(1)>

	<cfif isStruct(str)>
		<cfloop collection="#str#" item="key">
			<cfset stTemp = structNew()>
			<cfif isStruct(str[key])>
				<cfset stTemp['text'] = key>
				<cfset stTemp['value'] = "">
				<cfset stTemp['expanded'] = true>
				<cfset stTemp['children'] = structToExtNodesStruct(str[key])>
			<cfelseif isArray(str[key])>
				<cfset stTemp['text'] = key & "[ ]">
				<cfset stTemp['value'] = "">
				<cfset stTemp['expanded'] = true>
				<cfset stTemp['children'] = structToExtNodesStruct(str[key])>
			<cfelse>
				<cfset stTemp['text'] = key>
				<cfset stTemp['value'] = str[key]>
				<cfset stTemp['leaf'] = true>
			</cfif>
			<cfset arrayAppend(aReturn, stTemp)>
		</cfloop>
	<cfelseif isArray(str)>
		<cfloop from="1" to="#arrayLen(str)#" index="i">
			<cfset stTemp = structNew()>
			<cfif isStruct(str[i])>
				<cfset stTemp['text'] = "[#i-1#]">
				<cfset stTemp['value'] = "">
				<cfset stTemp['expanded'] = true>
				<cfset stTemp['children'] = structToExtNodesStruct(str[i])>
			<cfelseif isArray(str[i])>
				<cfset aReturn = structToExtNodesStruct(str[i])>
			<cfelse>
				<cfset stTemp['text'] = "[#i-1#]">
				<cfset stTemp['value'] = str[i]>
				<cfset stTemp['leaf'] = true>
			</cfif>
			<cfset arrayAppend(aReturn, stTemp)>
		</cfloop>
	</cfif>
	<cfreturn aReturn>
</cffunction>
