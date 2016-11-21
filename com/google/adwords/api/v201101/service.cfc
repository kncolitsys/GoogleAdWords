<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2011 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
--->
<cfcomponent displayname="Service" extends="utils">

<!--- create empty structure instance to store property data ---> 
<cfset variables.instance=StructNew()>

<cffunction name="callWebService" access="public" returntype="any" output="No">
<cfargument name="ServiceName" required="Yes" type="string">
<cfargument name="oServiceObject" required="yes" type="any">
<cfset var AdwordsServiceUrl="">
<cfset var response="">
<cfset var key="">
<cfset var logdata="">
<cfset var stResponse=StructNew()>
<cfset var stTemp=StructNew()>
<cfset var stAdwordsUser="">
<cfset var stAttributeCollection=structNew()>
<cfset var SoapRequestXML="">
<cfset var stLogSettings=getLoggingSettings()>
<cfset var stDefaultLogSettings=structNew()>
<cfset var oSOAP=createObject("component","soap")>
<cfset var oSOAPHeader=createObject("component","soapheader")>
<cfset var oSOAPEnvelope=createObject("component","soapenvelope")>
<cfset var oRequestHeader=createObject("component","requestheader")>
	
	<cfset oSOAPHeader.setObjectData(oServiceObject.getAdwordsuser().getObjectData())>
	<cfset oRequestHeader.setRequestHeader(oSOAPHeader)>
	<cfset oRequestHeader.setNamespace(oServiceObject.getNamespace())>
	<cfset oSOAPEnvelope.setHeader(oRequestHeader)>
	<cfset oSOAPEnvelope.setBody(oServiceObject)>
	<cfset oSOAP.setEnvelope(oSOAPEnvelope)>
	
	<!--- get the xml --->
	<cfset SoapRequestXML=oSOAP.getDataAsXML().rawxml>
	
	<!--- check for sandbox usage and get the adwordsServiceUrl --->
	<cfif oServiceObject.getUseSandbox()>
		<!--- use the sandbox --->
		<cfset AdwordsServiceUrl=oServiceObject.getSandboxUrl()>
	<cfelse>
		<!--- production settings --->
		<cfset AdwordsServiceUrl=oServiceObject.getServiceUrl()>
	</cfif>
	
	<!--- save raw SOAPRequest for debugging --->
	<cfset this.SOAPRequest=SoapRequestXML>
	
	<!--- check to use default logging --->
	<cfif oServiceObject.getUseDefaultLogging() and structIsEmpty(stLogSettings)>
		<cfset stDefaultLogSettings['bEnableLogging']=true>
		<cfset stDefaultLogSettings['bLogSOAPRequests']=true>
		<cfset stDefaultLogSettings['bLogSOAPResponse']=true>
		<cfset stDefaultLogSettings['folder']="./logs">
		<cfset stDefaultLogSettings['extension']="txt">
		<cfset setLoggingSettings(stDefaultLogSettings)>
	</cfif>
	
	<cfset stLogSettings=getLoggingSettings()>
	
	<!--- check if SOAPRequest should be logged --->
	<cfif structKeyExists(stLogSettings,"bLogSOAPRequests") and stLogSettings['bLogSOAPRequests'] eq true>
		<cfset logdata=this.SOAPRequest>
	</cfif>
	
	<!--- setting the default attributes for cfhttp --->
	<cfset stAttributeCollection.url=AdwordsServiceUrl>
	<cfset stAttributeCollection.method="post">
	
	<!--- check for external cfhttp attributes --->
	<cfif not structIsEmpty(getCFHTTPAttributes())>
		<cfset stTemp=getCFHTTPAttributes()>
		<cfloop collection="#stTemp#" item="key">
			<cfset stAttributeCollection[key]=stTemp[key]>
		</cfloop>
	</cfif>
	
	<cfhttp attributecollection="#stAttributeCollection#">
		<!--- SOAPAction --->
		<cfhttpparam name="SOAPAction" type="header" value=""/>
		<!--- The actual SOAP request --->
		<cfhttpparam type="xml" value="#SoapRequestXML#"/>
	</cfhttp> 
	
	<!--- save raw SOAPResponse for debugging --->
	<cfset this.SOAPResponse=cfhttp.filecontent>
	
	<!--- check if SOAPResponse should be logged --->
	<cfif structKeyExists(stLogSettings,"bLogSOAPResponse") and stLogSettings['bLogSOAPResponse'] eq true>
		<cfset logdata=logdata&this.SOAPResponse>
	</cfif>
	
	<!--- check if logging is enabled --->
	<cfif structKeyExists(stLogSettings,"bEnableLogging") and stLogSettings['bEnableLogging'] eq true>
		<cfset logger(logdata,stLogSettings.folder,stLogSettings.extension)>
	</cfif>

	<cfif not isXML(SoapRequestXML)>
		<cfthrow message="No valid XML was sent to the adwords api." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oCampaignServie.getService().SOAPRequest. Please also check the coldfusion administrator and turn on whitespace management.">
	</cfif>
	
	<cfif not isXML(cfhttp.filecontent)>
		<cfthrow message="The google adwords api did not return valid xml." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oCampaignServie.getService().SOAPRequest. Please also check your network configuration.">
	</cfif>
	
	<!--- parse the xml response --->
	<cfset response=xmlparse(cfhttp.filecontent)>
	
	<!--- convert xml data to a coldfusion structure --->
	<cfset stResponse=ConvertXmlToStruct(response,stResponse)>
	
	<!--- check for api errors --->
	<cfset checkApiError(stResponse,oServiceObject)>
	
	<!--- set the responseHeader --->
	<cfset setResponseHeader(stResponse)>
	
	<cfreturn stResponse> 

</cffunction>

<cffunction name="checkApiError" access="public" output="true" returntype="boolean">
<cfargument name="stResponse" required="Yes" type="any">
<cfargument name="oServiceObject" required="yes" type="any">
<cfset var aError="">
<cfset var stError="">

	<!--- check for api errors --->
	<cfset aError=StructFindKey(stResponse,"Fault")>
	<cfif ArrayLen(aError) gt 0>
		<cfset stError=Evaluate("stResponse#aError[1].path#")>
		<cfset oServiceObject.setError(stError)>
		<cfthrow type="adwordsapi" detail="The google adwords api raised an error." errorcode="GoogleAdwordAPIError" message="Use method getError() to get a detailed api error message.">
	</cfif>

	<cfreturn true>
</cffunction>

<cffunction name="getResponseHeader" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['responseHeader']" default="#createObject('component','soapresponseheader')#">
	<cfreturn variables.instance.responseHeader>
	
</cffunction>

<cffunction name="setResponseHeader" access="private" returntype="void" output="No">
<cfargument name="stResponse" required="Yes" type="any">
<cfset var aResponse="">
<cfset var oTemp="">

	<!--- get the responseHeader from stResponse --->
	<cfset aResponse=StructFindKey(stResponse,"ResponseHeader")>

	<!--- check for response --->
	<cfif ArrayLen(aResponse) gt 0>
	
		<!--- handle the response --->
		
		<!--- get the data --->
		<cfset aResponse=Evaluate("stResponse#aResponse[1].path#")>
		
		<cfif isStruct(aResponse) and not structIsEmpty(aResponse)>
			<!--- create empty instance of an soapresponseheader object --->
			<cfset oTemp=createObject("component","soapresponseheader")>
			<cfset oTemp.setObjectData(aResponse)>
			<cfset variables.instance["responseHeader"]=oTemp>
		<cfelse>
			<cfthrow message="The api returned an empty ResponseHeader." detail="You can check the SOAPRequest and SOAPResponse data through the variables SOAPRequest and SOAPResponse. e.g. oCampaignService.getService().SOAPRequest">
		</cfif>
	
	</cfif>
	
</cffunction>

<cffunction name="getCFHTTPAttributes" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['cfhttpattributes']" default="#structNew()#">
	<cfreturn variables["instance"]["cfhttpattributes"]>
	
</cffunction>

<cffunction name="setCFHTTPAttributes" access="public" returntype="void" output="No">
<cfargument name="cfhttpattributes" required="Yes" type="struct">
	
	<cfset variables["instance"]["cfhttpattributes"]=arguments["cfhttpattributes"]>
		
</cffunction>

<cffunction name="getLoggingSettings" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['loggingsettings']" default="#structNew()#">
	<cfreturn variables["instance"]["loggingsettings"]>
	
</cffunction>

<cffunction name="setLoggingSettings" access="public" returntype="void" output="No">
<cfargument name="loggingsettings" required="Yes" type="struct">
	
	<cfset variables["instance"]["loggingsettings"]=arguments["loggingsettings"]>
		
</cffunction>

<cffunction name="logger" access="private" returntype="void">
<cfargument name="output" type="string" required="true" />
<cfargument name="folder" type="string" required="false" default="./logs" />
<cfargument name="extension" type="string" required="false" default="txt" />

	<cfset var stLocal=structNew()>
	<cfset stLocal.dateStamp = DateFormat(Now(), "yyyy-mm-dd")>
	<cfset stLocal.timeStamp = TimeFormat(Now(), "HH:mm:ss:l")>
	<cfset stLocal.absoluteFolder = ExpandPath(arguments.folder)>
	<cfset stLocal.relativeFile =  ListAppend(arguments.folder, ListAppend(stLocal.dateStamp, arguments.extension, "."), "/")>
	<cfset stLocal.absoluteFile = ExpandPath(stLocal.relativeFile)>
	<cfset stLocal.threadId = CreateUUID()>
	
	
	<cfthread action="run" name="#stLocal.threadId#" arguments="#arguments#" stLocal="#stLocal#">
	
	        <cfif not DirectoryExists(attributes.stLocal.absoluteFolder)>
	                <cfdirectory action="create" directory="#attributes.stLocal.absoluteFolder#" mode="755" />
	        </cfif>
	
	        <cfif not FileExists(attributes.stLocal.absoluteFile)>
	                <cffile action="write" file="#attributes.stLocal.absoluteFile#" output="" />
	        </cfif>
	
	        <cffile action="append" file="#attributes.stLocal.absoluteFile#" output="#attributes.stLocal.dateStamp# #attributes.stLocal.timeStamp# #tagTextCompressor(attributes.arguments.output)#" />
	</cfthread>

	<cfreturn  />
</cffunction>


</cfcomponent>