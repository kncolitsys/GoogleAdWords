<cfcomponent
	output="false"
	hint="Handles simple time-based data caching.">
 
	<!--- Set up instance variables. --->
	<cfset VARIABLES.Instance = StructNew() />
 
	<!--- This will be the structure to hold our cached data. --->
	<cfset VARIABLES.Instance.Data = StructNew() />
 
 
	<cffunction
		name="Init"
		access="public"
		returntype="any"
		output="false"
		hint="Returns an initialized component.">
 
		<!--- Return This reference. --->
		<cfreturn THIS />
	</cffunction>
 
 
	<cffunction
		name="GetData"
		access="public"
		returntype="any"
		output="false"
		hint="Returns the given data item from the data cache (will throw exception if the requested data does not exist).">
 
		<!--- Define arguments. --->
		<cfargument
			name="Key"
			type="string"
			required="true"
			hint="The unique key for this data entry."
			/>
 
		<!--- Update the data cache. --->
		<cfset VARIABLES.UpdateCacheData(
			ARGUMENTS.Key
			) />
 
		<!---
			Now that the cache has been updated, simply return
			the given data item. If the data does not exist,
			this will throw an error.
		--->
		<cfreturn VARIABLES.Instance.Data[ ARGUMENTS.Key ].Data />
	</cffunction>
 
 
	<cffunction
		name="HasData"
		access="public"
		returntype="boolean"
		output="false"
		hint="Checks to see if the given data item exists in the cache.">
 
		<!--- Define arguments. --->
		<cfargument
			name="Key"
			type="string"
			required="true"
			hint="The unique key for this data entry."
			/>
 		
		<cftry>
		<!--- Update the data cache. --->
		<cfset VARIABLES.UpdateCacheData(
			ARGUMENTS.Key
			) />
			<cfcatch></cfcatch>
		</cftry>
 
		<!---
			Now that the cache has been updated, simply return
			the existence of the given key in the cache.
		--->
		<cfreturn StructKeyExists(
			VARIABLES.Instance.Data,
			ARGUMENTS.Key
			) />
	</cffunction>
 
 
	<cffunction
		name="SetData"
		access="public"
		returntype="void"
		output="false"
		hint="Sets the data in the cache.">
 
		<!--- Define arguments. --->
		<cfargument
			name="Key"
			type="string"
			required="true"
			hint="The unique key for this data entry."
			/>
 
		<cfargument
			name="Data"
			type="any"
			required="true"
			hint="The data being stored at the given key."
			/>
 
		<cfargument
			name="ExpirationDate"
			type="numeric"
			required="true"
			hint="The date on which this data will expire and be removed from the cache."
			/>
 
		<!--- Set the local scope. --->
		<cfset var LOCAL = StructNew() />
 
		<!--- Create the cache item. --->
		<cfset LOCAL.Item = StructNew() />
		<cfset LOCAL.Item.Data = ARGUMENTS.Data />
		<cfset LOCAL.Item.ExpirationDate = ARGUMENTS.ExpirationDate />
 
		<!--- Put item in cache. --->
		<cfset VARIABLES.Instance.Data[ ARGUMENTS.Key ] = LOCAL.Item />
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
 
 
	<cffunction
		name="UpdateCacheData"
		access="private"
		returntype="void"
		output="false"
		hint="Checks to see if the given data tiem needs to be removed from the cache (and removes it if necessary).">
 
		<!--- Define arguments. --->
		<cfargument
			name="Key"
			type="string"
			required="true"
			hint="The unique key for this data entry."
			/>
 
		<!---
			Check to see if the data item has expired. This
			will be true if the set expiration date is less
			than Now().
		--->
		<cfif (VARIABLES.Instance.Data[ ARGUMENTS.Key ].ExpirationDate LTE Now())>
 
			<!---
				This data item has expired. Remove it from
				the data cache.
			--->
			<cfset StructDelete(
				VARIABLES.Instance.Data,
				ARGUMENTS.Key
				) />
 
		</cfif>
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
 
</cfcomponent>