<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
--->
<cfcomponent displayname="Utils">

<cfset variables.xmlattributes="">
<cfset this.lastAPIError="">

<cffunction name="getObjectData" access="public" returntype="any" hint="Returns an objects properties" output="false">
<cfargument name="bRecurse" required="No" default="false" type="boolean">
<cfset var stReturn=StructNew()>
<cfset var key="">
<cfset var i="">
<cfset var tempMethod="">
<cfset var metaData=structNew()>
<cfset var propMetaData="">

	<!--- user error handling --->
	<cftry>
	
	<!--- get property meta data deep down the inheritance chain --->
	<cfset metaData.Properties=getPropMetaDataFromSuper(_getMetaData(this))>
	
	<!--- check if it is a recursesiv call --->
	<cfif bRecurse is true and StructKeyExists(variables,"instance")>
			
		<!--- loop through internal structure with properties called variables --->
		<cfloop collection="#variables["instance"]#" item="key">
		
			<!--- get the metaData for current key value --->
			<cfset propMetaData=getPropMetaData(key,metaData)>
				
			<!--- check if key is a property --->
			<cfif isStruct(propMetaData)>
			
				<!--- check if current key value is an object --->
				<cfif isObject(variables["instance"][key])>
					
					<!--- use recursion to get properties inside the object instance --->						
					<cfset stReturn[replace(key,"_",".")]=variables["instance"][key].getObjectData(true)>
				
				<cfelseif isArray(variables["instance"][key])>
					<!--- okay, we have an array --->
					
					<!--- create an empty array --->
					<cfset stReturn[replace(key,"_",".")]=ArrayNew(1)>
					
					<!--- loop through the array data and copy array data row by row --->
					<cfloop from="1" to="#ArrayLen(variables["instance"][key])#" index="i">
					
						<!--- check if current key value is an object --->
						<cfif isObject(variables["instance"][key][i])>
							
							<!--- use recursion to get properties inside the object instance --->						
							<cfset ArrayAppend(stReturn[replace(key,"_",".")],variables["instance"][key][i].getObjectData(true))>
											
						<cfelse>
						
							<!--- simply setting the key of stReturn to the one of variables --->
							<cfset ArrayAppend(stReturn[replace(key,"_",".")],variables["instance"][key][i])>
							
						</cfif>
					
					</cfloop>
				
				<cfelseif isSimpleValue(variables["instance"][key])>
					<!--- it is not an object --->
					
					<!--- simply setting the key value of stReturn to the one of variables --->
					<cfset stReturn[replace(key,"_",".")]=variables["instance"][key]>
				
				</cfif>
		
			</cfif>
		
		</cfloop>
			
			<!--- return the structure with all the nested properties --->
			<cfreturn stReturn>
			
	<cfelse>
		<!--- it is not a recursive call --->
		
		<!--- simple return of variables --->
		<cfparam name="variables.instance" default="#StructNew()#">
		<cfreturn variables.instance>
		
	</cfif>

	<cfcatch>
		<!--- this code catches the error inside the try block --->
		
		<!--- return error message --->
		<cfrethrow>
	
	</cfcatch>
	
	</cftry>

</cffunction>

<cffunction name="setObjectData" access="public" returntype="struct" hint="Updates Data Structure variables with all nested objects." output="false">
<cfargument name="str" required="Yes" type="struct">
<cfset var key="">
<cfset var origkey="">
<cfset var dataType="">
<cfset var lDataTypes="any,double,float,numeric,long,int,boolean,string,base64binary,struct,array,query,date,uuid,void">
<cfset var metaData=structNew()>
<cfset var propMetaData="">
<cfset var oTemp="">
<cfset var aTemp="">
<cfset var i="">
<cfset var stTemp="">
<cfset var stReturn=structNew()>

	<!--- use error handling --->
	<cftry>
		
		<!--- get property meta data deep down the inheritance chain --->
		<cfset metaData.Properties=getPropMetaDataFromSuper(_getMetaData(this))>
		
		<!--- loop over argument structure --->
		<cfloop collection="#str#" item="key">
				
				<!--- patch for keys with a dot inside --->
				
				<!--- copy key to origKey --->
				<cfset origkey=key>
				<cfset key=Replace(key,".","_")>
		
				<!--- get the metaData for current key value --->
				<cfset propMetaData=getPropMetaData(key,metaData)>
				
				<!--- check for valid propMetaData and dataType --->
				<cfif isStruct(propMetaData) and StructKeyExists(propMetaData,"TYPE")>
				
					<!--- create key inside variables --->
					<cfset variables["instance"][key]="">
				
					<!--- save the dataType --->
					<cfset dataType=propMetaData["TYPE"]>
					
					<!--- check for extra dataType wthin attributes --->
					<cfif structKeyExists(str,"XMLAttributes") and structKeyExists(str['XMLAttributes'],"xsi:type") and trim(str['XMLAttributes']['xsi:type']) neq "">
						<cfset stReturn.dataType=trim(str['XMLAttributes']['xsi:type'])>
						<!--- remove namespace prefix --->
						<cfset stReturn.dataType=listLast(stReturn.dataType,":")>	
					</cfif>
					
					<!--- check if dataType is not one of lDataTypes --->
					<cfif not listFind(lDataTypes,lcase(dataType))>
						<!--- dataType is not one of lColdFusionDataTypes --->
						
						<!--- check for array[] of objects and if str[key] is an array --->
						<cfif dataType contains "[]" and isArray(str[key])>
							<!--- it is an array --->
							
							<!--- create an empty array --->
							<cfset aTemp=ArrayNew(1)>
							
							<!--- check if it is an array of objects --->
							<cfif not listFind(lDataTypes,lcase(listFirst(dataType,"[")))>
								<!--- it is an array of objects --->
																
								<!--- loop through the array str[key] --->
								<cfloop from="1" to="#ArrayLen(str[key])#" index="i">
								
									<!--- create a new instance of the object --->
									<cfset oTemp=createObject("component",listFirst(dataType,"["))>
									
									<!--- setting the objects data to the current key --->
									<cfset stTemp=oTemp.setObjectData(str[key][i])>
									
									<cfif structKeyExists(stTemp,"dataType")>
										<!--- create a new instance of the object --->
										<cfset oTemp=createObject("component",stTemp.dataType)>
										<cfset oTemp.setObjectData(str[key][i])>
									</cfif>
									
									<!--- append the object to aTemp --->
									<cfset ArrayAppend(aTemp,oTemp)>
								
								</cfloop>
																			
							<cfelse>
								<!--- it is an simple array --->
								
								<!--- loop through the array str[key] --->
								<cfloop from="1" to="#ArrayLen(str[key])#" index="i">
								
									<!--- append the str[key][i] to aTemp --->
									<cfset ArrayAppend(aTemp,str[key][i])>
								
								</cfloop>
							
							</cfif>
							
							<!--- setting the property to the new array[] --->
							<cfset variables["instance"][key]=aTemp>
						
						<cfelseif dataType contains "[]" and not isArray(str[key])>
						
							<!--- create an empty array --->
							<cfset aTemp=ArrayNew(1)>
						
							<!--- create a new instance of the object --->
							<cfset oTemp=createObject("component",listFirst(dataType,"["))>
							
							<!--- setting the objects data to the current key --->
							<cfset stTemp=oTemp.setObjectData(str[key])>
									
							<cfif structKeyExists(stTemp,"dataType")>
								<!--- create a new instance of the object --->
								<cfset oTemp=createObject("component",stTemp.dataType)>
								<cfset oTemp.setObjectData(str[key])>
							</cfif>
							
							<!--- append oTemp to aTemp --->
							<cfset ArrayAppend(aTemp,oTemp)>
							
							<!--- setting the property to the new object --->
							<cfset variables["instance"][key]=aTemp>															
						
						<cfelse>
							<!--- it is an object --->
							
							<!--- create a new instance of the object --->
							<cfset oTemp=createObject("component",dataType)>
							
							<!--- setting the objects data to the current key --->
							<cfset stTemp=oTemp.setObjectData(str[key])>
									
							<cfif structKeyExists(stTemp,"dataType")>
								<!--- create a new instance of the object --->
								<cfset oTemp=createObject("component",stTemp.dataType)>
								<cfset oTemp.setObjectData(str[key])>
							</cfif>
							
							<!--- setting the property to the new object --->
							<cfset variables["instance"][key]=oTemp>
														
						</cfif>
												
					<cfelse>
						<!--- dataType is one of lDataTypes --->
						
						<!--- setting the property to the new object --->
						<cfset variables["instance"][key]=str[origkey]>
					
					</cfif>
								
				</cfif>
					
		</cfloop>	
		
	<cfcatch></cfcatch>	

	</cftry>
	
	<cfreturn stReturn>
	
</cffunction>

<cffunction name="getDataAsXML" access="public" returntype="any" hint="Returns an objects properties as XML." output="false">
<cfargument name="stNamespace" required="No" type="struct" default="#structNew()#">
<cfset var stReturn=structNew()>
<cfset var metaData=structNew()>
<cfset var lNamespace=duplicate(arguments.stNamespace)>
<cfset var propMetaData="">
<cfset var innerxml="">
<cfset var namespace="">
<cfset var nsprefix="">
<cfset var key="">
<cfset var i="">
<cfset var j="">
<cfset var value="">
<cfset var tempMethod="">
<cfset var stXML=structNew()>
<cfset var xmlString="">
<cfset var startTag="">
<cfset var closingTag="">
<cfset var nskey="">

	<!--- use error handling --->
	<cftry>
	
	<cfif structKeyExists(lNamespace,getNamespace())>
		<cfset nsprefix=lNamespace[getNamespace()]>
	<cfelse>
		<cfset nsprefix="ns"&(structCount(lNamespace)+1)&":">
		<cfset lNamespace[getNamespace()]=nsprefix>
	</cfif>
	
	<!--- save xml data into variable rawxml --->
	<cfsavecontent variable="innerxml">
		
		<!--- get property meta data deep down the inheritance chain --->
		<cfset metaData.Properties=getPropMetaDataFromSuper(_getMetaData(this,getInjectionData()))>
		<cfset metaData.Properties=arrayOfStructsSort(metaData.Properties,"seq","asc","numeric")>
		
		<cfif structKeyExists(variables,"instance")>
		
			<!--- loop through properties --->
			<cfloop from="1" to="#ArrayLen(metaData.properties)#" index="j">
			
				<!--- get the metaData for current key value --->
				<cfset propMetaData=metaData.properties[j]>
				
				<cfset stXML.xmlattributes="">
				
				<cfset key=propMetaData.name>
					
				<!--- check if key is a serializeable property --->
				<cfif structKeyExists(variables["instance"],key)>
					
					<!--- check if current key value is an object --->
					<cfif isObject(variables["instance"][key])>
						
						<!--- use recursion to get properties inside the object instance --->
						<cfset stXML=variables["instance"][key].getDataAsXML(stNamespace=lNamespace)>
						
						<cfset lNamespace=stXML.lNamespace>
						
						<cfif structCount(stNamespace) eq 0>
							<cfloop collection="#lNamespace#" item="nskey">
								<cfset namespace=namespace&' xmlns:'&replace(lNamespace[nskey],":","")&'="'&nskey&'"'>
							</cfloop>
						</cfif>
						
						<!--- check and get xml attributes and join with key --->
						<cfif structKeyExists(stXML,"xmlattributes")>
							<cfset startTag="<"&nsprefix&key&stXML.xmlattributes&namespace&">">
						<cfelse>
							<cfset startTag="<"&nsprefix&key&namespace&">">
						</cfif>
						
						<cfset closingTag="</"&nsprefix&key&">">
						
						<cfoutput>#startTag##stXML.rawxml##closingTag#</cfoutput>
												
					<cfelseif not isArray(variables["instance"][key]) and propMetaData.type eq "string[]" and listLen(variables["instance"][key]) gt 0>
						
						<cfloop index="value" list="#variables["instance"][key]#">
							<cfset startTag="<"&nsprefix&key&namespace&">">
							<cfset closingTag="</"&nsprefix&key&">">
							<cfoutput>#startTag##value##closingTag#</cfoutput>
						</cfloop>
					
					<cfelseif structKeyExists(propMetaData,"xmlattribute") and trim(propMetaData['xmlattribute']) neq "">
						
						<!--- patch for xml attributes and namespaces --->
						<cfif structKeyExists(propMetaData,"xmlnamespace") and trim(propMetaData['xmlnamespace']) neq "">
							<cfset stReturn.xmlattributes=' #propMetaData['xmlattribute']#="#trim(variables['instance'][key])#" #propMetaData['xmlnamespace']#'>
						<cfelse>
							<cfset stReturn.xmlattributes=' #propMetaData['xmlattribute']#="#trim(variables['instance'][key])#"'>
						</cfif>
					
					<cfelseif isArray(variables["instance"][key])>
					
						<cfif ArrayLen(variables["instance"][key]) gt 0>
						
							<cfloop from="1" to="#ArrayLen(variables["instance"][key])#" index="i">
							
								<cfif isObject(variables["instance"][key][i])>
									
									<!--- use recursion to get properties inside the object instance --->
									<cfset stXML=variables["instance"][key][i].getDataAsXML(stNamespace=lNamespace)>									<!--- check and get xml attributes and join with key --->
									
									<cfset lNamespace=stXML.lNamespace>
									
									<cfif structCount(stNamespace) eq 0>
										<cfloop collection="#lNamespace#" item="nskey">
											<cfset namespace=namespace&' xmlns:'&replace(lNamespace[nskey],":","")&'="'&nskey&'"'>
										</cfloop>
									</cfif>
									
									<cfif structKeyExists(stXML,"xmlattributes")>
										<cfset startTag="<"&nsprefix&key&stXML.xmlattributes&namespace&">">
									<cfelse>
										<cfset startTag="<"&nsprefix&key&namespace&">">
									</cfif>
									
									<cfset closingTag="</"&nsprefix&key&">">
									
									<cfoutput>#startTag##stXML.rawxml##closingTag#</cfoutput>
									
								<cfelse>
								
									<cfif structCount(stNamespace) eq 0>
										<cfloop collection="#lNamespace#" item="nskey">
											<cfset namespace=namespace&' xmlns:'&replace(lNamespace[nskey],":","")&'="'&nskey&'"'>
										</cfloop>
									</cfif>
									
									<cfset startTag="<"&nsprefix&key&namespace&">">
									<cfset closingTag="</"&nsprefix&key&">">
									
									<cfoutput>#startTag##trim(variables["instance"][key][i])##closingTag#</cfoutput>
									
								</cfif>
							</cfloop>
						</cfif>
					
					<cfelse>
						
						<cfif structCount(stNamespace) eq 0>
							<cfloop collection="#lNamespace#" item="nskey">
								<cfset namespace=namespace&' xmlns:'&replace(lNamespace[nskey],":","")&'="'&nskey&'"'>
							</cfloop>
						</cfif>
						
						<cfset startTag="<"&nsprefix&key&namespace&">">
						<cfset closingTag="</"&nsprefix&key&">">
									
						<cfoutput>#startTag##trim(variables["instance"][key])##closingTag#</cfoutput>
									
					
					</cfif>
				</cfif>
			</cfloop>
		</cfif>
	</cfsavecontent>
	
		<cfset stReturn.rawxml=innerxml>
		<cfset stReturn.lNamespace=lNamespace>
		
		<!--- returns the structure stReturn --->
		<cfreturn stReturn>

	<cfcatch>
		<cfrethrow />
	</cfcatch>
	
	</cftry>
	
</cffunction>

<cffunction name="ConvertXmlToStruct" access="public" returntype="struct" output="false" hint="Parse raw XML response body into ColdFusion structs and arrays and return it.">
<cfargument name="xmlNode" type="string" required="true" />
<cfargument name="str" type="struct" required="true" />

<!---Setup local variables for recurse: --->
<cfset var i = 0 />
<cfset var axml = arguments.xmlNode />
<cfset var astr = arguments.str />
<cfset var n = "" />
<cfset var tmpContainer = "" />
<cfset var stAttribs = "">
<cfset var stReturnAttribs=structNew()>
<cfset var key ="">
<cfset var stXmlNS = StructNew()>
	
	<!--- get the first node --->
	<cfset axml = XmlSearch(XmlParse(arguments.xmlNode),"/node()")>
	<cfset axml = axml[1] />
	
	<!--- get attributes of the root element --->
	<cfset stAttribs = Duplicate(axml[1].XmlAttributes)/>
	<!--- loop through attributes --->
	<cfloop collection="#stAttribs#" item="key">
		<!--- check for namespace(xmlns) attributes only --->
		<cfif key contains "xmlns:">
			<!--- store any namespace attributes inside stXmlNS--->
			<cfset StructInsert(stXmlNS,key,stAttribs[key])>
		</cfif>
		<cfset StructInsert(stReturnAttribs,key,stAttribs[key])>
	</cfloop>
		
	<!--- For each children of context node: --->
	<cfloop from="1" to="#arrayLen(axml.XmlChildren)#" index="i">
		
		<!--- inherit namespace attributes --->
		<cfloop collection="#stXmlNS#" item="key">
			<cfset structInsert(axml.XmlChildren[i].XmlAttributes,key,stXmlNS[key],"No")>
		</cfloop>
		
		<!--- Read XML node name without namespace: --->
		<cfset n = replace(axml.XmlChildren[i].XmlName, axml.XmlChildren[i].XmlNsPrefix&":", "") />
		<!--- If key with that name exists within output struct ... --->
		<cfif structKeyExists(astr, n)>
			<!--- ... and is not an array... --->
			<cfif not isArray(astr[n])>
				<!--- ... get this item into temp variable, ... --->
				<cfset tmpContainer = astr[n] />
				<!--- ... setup array for this item beacuse we have multiple items with same name, ... --->
				<cfset astr[n] = arrayNew(1) />
				<!--- ... and reassing temp item as a first element of new array: --->
				<cfset astr[n][1] = tmpContainer />
			<cfelse>
				<!--- Item is already an array: --->
				
			</cfif>
			<cfif arrayLen(axml.XmlChildren[i].XmlChildren) gt 0>
					<!--- recurse call: get complex item: --->
					<cfset astr[n][arrayLen(astr[n])+1] = ConvertXmlToStruct(axml.XmlChildren[i], structNew()) />
				<cfelse>
					<!--- else: assign node value as last element of array: --->
					<cfset astr[n][arrayLen(astr[n])+1] = axml.XmlChildren[i].XmlText />
			</cfif>
		<cfelse>
			<!---
				This is not a struct. This may be first tag with some name.
				This may also be one and only tag with this name.
			--->
			<!---
					If context child node has child nodes (which means it will be complex type): --->
			<cfif arrayLen(axml.XmlChildren[i].XmlChildren) gt 0>
				<!--- recurse call: get complex item: --->
				<cfset astr[n] = ConvertXmlToStruct(axml.XmlChildren[i], structNew()) />
			<cfelse>
				<!--- else: assign node value as last element of array: --->
				<!--- if there are any attributes on this element--->
				<cfif IsStruct(aXml.XmlChildren[i].XmlAttributes) AND StructCount(aXml.XmlChildren[i].XmlAttributes) GT 0>
					<!--- assign the text --->
					<cfset astr[n] = axml.XmlChildren[i].XmlText />
						<!--- check if there are no attributes with xmlns: , we dont want namespaces to be in the response--->
					 <cfset attrib_list = StructKeylist(axml.XmlChildren[i].XmlAttributes) />
					 <cfloop from="1" to="#listLen(attrib_list)#" index="attrib">
						 <cfif ListgetAt(attrib_list,attrib) CONTAINS "xmlns:">
							 <!--- remove any namespace attributes--->
							<cfset Structdelete(axml.XmlChildren[i].XmlAttributes, listgetAt(attrib_list,attrib))>
						 </cfif>
					 </cfloop>
					 <!--- if there are any atributes left, append them to the response--->
					 <cfif StructCount(axml.XmlChildren[i].XmlAttributes) GT 0>
						 <cfset astr[n&'_attributes'] = axml.XmlChildren[i].XmlAttributes />
					</cfif>
				<cfelse>
					 <cfset astr[n] = axml.XmlChildren[i].XmlText />
				</cfif>
			</cfif>
		</cfif>
	</cfloop>
	<!--- setting attributes --->
	<cfif not structIsEmpty(stReturnAttribs)>
		<cfset astr['XMLAttributes']=Duplicate(stReturnAttribs)>
	</cfif>
	<!--- return struct: --->
	<cfreturn astr />
</cffunction>

<cffunction name="getPropMetaDataFromSuper" access="public" returntype="any" output="false" hint="I return all property meta data along the inheritance chain.">
<cfargument name="stMetaData" required="yes" type="struct">
<cfargument name="aPropMetaDataFromSuper" required="no" default="#ArrayNew(1)#" type="array">
<cfset var i=0>
	<cfif structKeyExists(stMetaData,"extends") and isStruct(stMetaData.extends)>
		<cfset aPropMetaDataFromSuper=getPropMetaDataFromSuper(stMetaData.extends,aPropMetaDataFromSuper)>
	</cfif>
	<cfif structKeyExists(stMetaData,"properties") and isArray(stMetaData.properties)>
		<cfloop from="1" to="#ArrayLen(stMetaData.properties)#" index="i">
			<cfset ArrayAppend(aPropMetaDataFromSuper,stMetaData.properties[i])>
		</cfloop>
	</cfif>
	<cfreturn aPropMetaDataFromSuper />
</cffunction>

<cffunction name="getPropMetaData" access="public" returntype="any" hint="I return the meta data for a given property. If not defined I will return false." output="false">
<cfargument name="propname" required="Yes" type="string" hint="Name of the property.">
<cfargument name="metaData" required="Yes" type="struct">
<cfset var PropertyMetaData=false>
<cfset var i="">

<!--- check if the current class has any properties defined --->
<cfif StructKeyExists(metaData,"PROPERTIES")>
	<!--- loop through the array of properties --->
	<cfloop from="1" to="#ArrayLen(metaData["PROPERTIES"])#" index="i">
		<!--- check if the properties name is equal to propname --->
		<cfif trim(metaData["PROPERTIES"][i]["NAME"]) eq trim(propname)>
			<!--- return the properties metaData --->
			<cfreturn metaData["PROPERTIES"][i]>
		</cfif>
	</cfloop>
</cfif>

<!--- return false if no metaData was found --->
<cfreturn PropertyMetaData>
</cffunction>

<cffunction name="arrayOfStructsSort" access="public" returntype="array" output="false" hint="With this method it is possible to sort an array of structures by key.">
<cfargument name="aOfS" required="Yes" type="array" hint="I am an array of structures.">
<cfargument name="key" required="Yes" type="string" hint="I am the keyname.">
<cfargument name="sortorder" required="no" type="string" default="asc">
<cfargument name="sorttype" required="no" type="string" default="textnocase">
<cfargument name="delim" required="no" type="string" default=".">
<cfset var sortArray=arraynew(1)>
<cfset var returnArray=arraynew(1)>
<cfset var count=arrayLen(aOfS)>
<cfset var ii=1>
<cftry>
	<cfloop from="1" to="#count#" index="ii">
		<cfset sortArray[ii]=aOfS[ii][key]&delim&ii>
	</cfloop>
	<cfset arraySort(sortArray,sortType,sortOrder)>
	<cfloop from="1" to="#count#" index="ii">
		<cfset returnArray[ii]=aOfS[listLast(sortArray[ii],delim)]>
	</cfloop>
	<cfcatch><cfdump var="#aOfS#"></cfcatch>
	</cftry>
	<cfreturn returnArray>
		
</cffunction>

<cffunction name="_getMetaData" access="private" returntype="any" output="No">
<cfargument name="obj" required="true" type="any">
<cfargument name="injectionData" required="false" type="struct" default="#structNew()#"> 
<cfset var metaData="">
<cfset metaData=getMetaData(obj)>
<cfif not structIsEmpty(injectionData)>
	<cfset structAppend(metaData,injectionData)>	
</cfif>
<cfreturn metaData>
</cffunction>

<cffunction name="getInjectionData" access="private" returntype="any" output="No">
	
	<cfparam name="variables['instance']['injectiondata']" default="#structNew()#">
	<cfreturn variables["instance"]["injectiondata"]>
	
</cffunction>

<cffunction name="setInjectionData" access="private" returntype="void" output="No">
<cfargument name="injectiondata" required="Yes" type="any">
	
	<cfset variables["instance"]["injectiondata"]=arguments["injectiondata"]>
		
</cffunction>

<cffunction name="tagTextCompressor" access="public" returntype="any" output="false">
<cfargument name="sInput" required="true" type="string">	
<cfargument name="level" default="2" required="false" type="numeric">

   
	<!--- just take off the useless stuff --->
	<cfset sInput=trim(sInput)>
	<cfswitch expression="#arguments.level#">
		
		<cfcase value="3">
			
			<!--- extra compression can screw up a few little pieces of HTML or XML --->        
			<cfset sInput=reReplace(sInput,"[[:space:]]{2,}"," ","all")>
			<cfset sInput=replace(sInput,"> <", "><","all")>
			<cfset sInput=reReplace(sInput,"<!--[^>]+>","","all")>
			
		</cfcase>

		<cfcase value="2">
			
			<cfset sInput=reReplace(sInput,"[[:space:]]{2,}",chr(13),"all")>
			<cfset sInput=replace(sInput,chr(10),"","All")>
			<cfset sInput=replace(sInput,chr(13),"","All")>
			
		</cfcase>
		
		<cfcase value="1">
			
			<!--- only compresses after a line break --->
			<cfset sInput=reReplace(sInput,"("&chr(10)&"|"&chr(13)&")+[[:space:]]{2,}",chr(13),"all")>
		
		</cfcase>
		
	</cfswitch>
		
	<cfreturn sInput>

</cffunction>

<cffunction name="array" access="public" returntype="Array">
<cfargument name="item" required="false" type="any" default="">
	<cfset var listItem="">		
	<cfset var aRet=arrayNew(1)>
	
	<cfif IsSimpleValue(item)>
		<cfif trim(item) eq "">
			<cfreturn aRet>
		</cfif>
		<cfloop list="item" index="listItem">
			<cfset arrayAppend(aRet,listItem)>
		</cfloop>
	<cfelse>
		<cfset arrayAppend(aRet,item)>
	</cfif>
	
	<cfreturn aRet>	 
</cffunction>

</cfcomponent>