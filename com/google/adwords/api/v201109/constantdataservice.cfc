<!--- 
LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
License: http://www.cfsolutions.de/coldfusion_adwords_api/
---> 
<cfcomponent displaname="ConstantDataService" hint="A service to return constant data." extends="utils">

<!--- create empty structure instance to store property data ---> 
<cfset variables["instance"]=StructNew()>

<style>


	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}

</style> <script language="javascript">


// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}

</script> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">Detail</td>
					<td>
					[empty string] 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ErrNumber</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">Message</td>
					<td>
					The element at position 1 cannot be found. 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">StackTrace</td>
					<td>
					coldfusion.runtime.CfJspPage$ArrayBoundException: The element at position 1 cannot be found.
	at coldfusion.runtime.CfJspPage.ArrayGetAt(CfJspPage.java:912)
	at coldfusion.runtime.CfJspPage._arrayGetAt(CfJspPage.java:972)
	at coldfusion.runtime.CfJspPage._arrayGetAt(CfJspPage.java:967)
	at cfwsdl2ecfc1390464133$funcGETSERVICEMETHODCFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:710)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:472)
	at coldfusion.runtime.UDFMethod$ReturnTypeFilter.invoke(UDFMethod.java:405)
	at coldfusion.runtime.UDFMethod$ArgumentCollectionFilter.invoke(UDFMethod.java:368)
	at coldfusion.filter.FunctionAccessFilter.invoke(FunctionAccessFilter.java:55)
	at coldfusion.runtime.UDFMethod.runFilterChain(UDFMethod.java:321)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:220)
	at coldfusion.runtime.CfJspPage._invokeUDF(CfJspPage.java:2582)
	at cfwsdl2ecfc1390464133$funcGETSERVICECFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:452)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:472)
	at coldfusion.filter.SilentFilter.invoke(SilentFilter.java:47)
	at coldfusion.runtime.UDFMethod$ReturnTypeFilter.invoke(UDFMethod.java:405)
	at coldfusion.runtime.UDFMethod$ArgumentCollectionFilter.invoke(UDFMethod.java:368)
	at coldfusion.filter.FunctionAccessFilter.invoke(FunctionAccessFilter.java:55)
	at coldfusion.runtime.UDFMethod.runFilterChain(UDFMethod.java:321)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:220)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:491)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:337)
	at coldfusion.runtime.CfJspPage._invoke(CfJspPage.java:2360)
	at cfcreateFromWSDL2ecfm1085877717.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\createFromWSDL.cfm:29)
	at coldfusion.runtime.CfJspPage.invoke(CfJspPage.java:231)
	at coldfusion.tagext.lang.IncludeTag.doStartTag(IncludeTag.java:416)
	at coldfusion.runtime.CfJspPage._emptyTcfTag(CfJspPage.java:2722)
	at cfv2011092ecfm367670730.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\v201109.cfm:141)
	at coldfusion.runtime.CfJspPage.invoke(CfJspPage.java:231)
	at coldfusion.tagext.lang.IncludeTag.doStartTag(IncludeTag.java:416)
	at coldfusion.filter.CfincludeFilter.invoke(CfincludeFilter.java:65)
	at coldfusion.filter.ApplicationFilter.invoke(ApplicationFilter.java:381)
	at coldfusion.filter.RequestMonitorFilter.invoke(RequestMonitorFilter.java:48)
	at coldfusion.filter.MonitoringFilter.invoke(MonitoringFilter.java:40)
	at coldfusion.filter.PathFilter.invoke(PathFilter.java:94)
	at coldfusion.filter.LicenseFilter.invoke(LicenseFilter.java:27)
	at coldfusion.filter.ExceptionFilter.invoke(ExceptionFilter.java:70)
	at coldfusion.filter.ClientScopePersistenceFilter.invoke(ClientScopePersistenceFilter.java:28)
	at coldfusion.filter.BrowserFilter.invoke(BrowserFilter.java:38)
	at coldfusion.filter.NoCacheFilter.invoke(NoCacheFilter.java:46)
	at coldfusion.filter.GlobalsFilter.invoke(GlobalsFilter.java:38)
	at coldfusion.filter.DatasourceFilter.invoke(DatasourceFilter.java:22)
	at coldfusion.filter.CachingFilter.invoke(CachingFilter.java:62)
	at coldfusion.CfmServlet.service(CfmServlet.java:200)
	at coldfusion.bootstrap.BootstrapServlet.service(BootstrapServlet.java:89)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:86)
	at coldfusion.monitor.event.MonitoringServletFilter.doFilter(MonitoringServletFilter.java:42)
	at coldfusion.bootstrap.BootstrapFilter.doFilter(BootstrapFilter.java:46)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:94)
	at jrun.servlet.FilterChain.service(FilterChain.java:101)
	at jrun.servlet.ServletInvoker.invoke(ServletInvoker.java:106)
	at jrun.servlet.JRunInvokerChain.invokeNext(JRunInvokerChain.java:42)
	at jrun.servlet.JRunRequestDispatcher.invoke(JRunRequestDispatcher.java:286)
	at jrun.servlet.ServletEngineService.dispatch(ServletEngineService.java:543)
	at jrun.servlet.jrpp.JRunProxyService.invokeRunnable(JRunProxyService.java:203)
	at jrunx.scheduler.ThreadPool$DownstreamMetrics.invokeRunnable(ThreadPool.java:320)
	at jrunx.scheduler.ThreadPool$ThreadThrottle.invokeRunnable(ThreadPool.java:428)
	at jrunx.scheduler.ThreadPool$UpstreamMetrics.invokeRunnable(ThreadPool.java:266)
	at jrunx.scheduler.WorkerThread.run(WorkerThread.java:66) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TagContext</td>
					<td>
					
				<table class="cfdump_array">
				<tr><th class="array" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">array
				</th></tr>
				
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">1</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					?? 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					710 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfwsdl2ecfc1390464133$funcGETSERVICEMETHODCFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:710) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">2</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					CF_UDFMETHOD 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					452 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfwsdl2ecfc1390464133$funcGETSERVICECFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:452) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">3</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					CF_TEMPLATEPROXY 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					29 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfcreateFromWSDL2ecfm1085877717.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\createFromWSDL.cfm:29) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\createFromWSDL.cfm 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">4</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					CFINCLUDE 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					141 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfv2011092ecfm367670730.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\v201109.cfm:141) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\v201109.cfm 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
			</table>
		
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">Type</td>
					<td>
					Expression 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">aDimension</td>
					<td>
					-1 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">aIndex</td>
					<td>
					1 
					</td>
					</tr>
					
			</table>
		<style>


	table.cfdump_wddx,
	table.cfdump_xml,
	table.cfdump_struct,
	table.cfdump_varundefined,
	table.cfdump_array,
	table.cfdump_query,
	table.cfdump_cfc,
	table.cfdump_object,
	table.cfdump_binary,
	table.cfdump_udf,
	table.cfdump_udfbody,
	table.cfdump_udfarguments {
		font-size: xx-small;
		font-family: verdana, arial, helvetica, sans-serif;
		cell-spacing: 2px;
	}

	table.cfdump_wddx th,
	table.cfdump_xml th,
	table.cfdump_struct th,
	table.cfdump_varundefined th,
	table.cfdump_array th,
	table.cfdump_query th,
	table.cfdump_cfc th,
	table.cfdump_object th,
	table.cfdump_binary th,
	table.cfdump_udf th,
	table.cfdump_udfbody th,
	table.cfdump_udfarguments th {
		text-align: left;
		color: white;
		padding: 5px;
	}

	table.cfdump_wddx td,
	table.cfdump_xml td,
	table.cfdump_struct td,
	table.cfdump_varundefined  td,
	table.cfdump_array td,
	table.cfdump_query td,
	table.cfdump_cfc td,
	table.cfdump_object td,
	table.cfdump_binary td,
	table.cfdump_udf td,
	table.cfdump_udfbody td,
	table.cfdump_udfarguments td {
		padding: 3px;
		background-color: #ffffff;
		vertical-align : top;
	}

	table.cfdump_wddx {
		background-color: #000000;
	}
	table.cfdump_wddx th.wddx {
		background-color: #444444;
	}


	table.cfdump_xml {
		background-color: #888888;
	}
	table.cfdump_xml th.xml {
		background-color: #aaaaaa;
	}
	table.cfdump_xml td.xml {
		background-color: #dddddd;
	}

	table.cfdump_struct {
		background-color: #0000cc ;
	}
	table.cfdump_struct th.struct {
		background-color: #4444cc ;
	}
	table.cfdump_struct td.struct {
		background-color: #ccddff;
	}

	table.cfdump_varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined th.varundefined {
		background-color: #CC3300 ;
	}
	table.cfdump_varundefined td.varundefined {
		background-color: #ccddff;
	}

	table.cfdump_array {
		background-color: #006600 ;
	}
	table.cfdump_array th.array {
		background-color: #009900 ;
	}
	table.cfdump_array td.array {
		background-color: #ccffcc ;
	}

	table.cfdump_query {
		background-color: #884488 ;
	}
	table.cfdump_query th.query {
		background-color: #aa66aa ;
	}
	table.cfdump_query td.query {
		background-color: #ffddff ;
	}


	table.cfdump_cfc {
		background-color: #ff0000;
	}
	table.cfdump_cfc th.cfc{
		background-color: #ff4444;
	}
	table.cfdump_cfc td.cfc {
		background-color: #ffcccc;
	}


	table.cfdump_object {
		background-color : #ff0000;
	}
	table.cfdump_object th.object{
		background-color: #ff4444;
	}

	table.cfdump_binary {
		background-color : #eebb00;
	}
	table.cfdump_binary th.binary {
		background-color: #ffcc44;
	}
	table.cfdump_binary td {
		font-size: x-small;
	}
	table.cfdump_udf {
		background-color: #aa4400;
	}
	table.cfdump_udf th.udf {
		background-color: #cc6600;
	}
	table.cfdump_udfarguments {
		background-color: #dddddd;
		cell-spacing: 3;
	}
	table.cfdump_udfarguments th {
		background-color: #eeeeee;
		color: #000000;
	}

</style> <script language="javascript">


// for queries we have more than one td element to collapse/expand
	var expand = "open";

	dump = function( obj ) {
		var out = "" ;
		if ( typeof obj == "object" ) {
			for ( key in obj ) {
				if ( typeof obj[key] != "function" ) out += key + ': ' + obj[key] + '<br>' ;
			}
		}
	}


	cfdump_toggleRow = function(source) {
		//target is the right cell
		if(document.all) target = source.parentElement.cells[1];
		else {
			var element = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>0;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					element = source.parentNode.childNodes[i];
					break;
				}
			}
			if(element == null)
				target = source.parentNode.lastChild;
			else
				target = element;
		}
		//target = source.parentNode.lastChild ;
		cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
	}

	cfdump_toggleXmlDoc = function(source) {

		var caption = source.innerHTML.split( ' [' ) ;

		// toggle source (header)
		if ( source.style.fontStyle == 'italic' ) {
			// closed -> short
			source.style.fontStyle = 'normal' ;
			source.innerHTML = caption[0] + ' [short version]' ;
			source.title = 'click to maximize' ;
			switchLongToState = 'closed' ;
			switchShortToState = 'open' ;
		} else if ( source.innerHTML.indexOf('[short version]') != -1 ) {
			// short -> full
			source.innerHTML = caption[0] + ' [long version]' ;
			source.title = 'click to collapse' ;
			switchLongToState = 'open' ;
			switchShortToState = 'closed' ;
		} else {
			// full -> closed
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			source.innerHTML = caption[0] ;
			switchLongToState = 'closed' ;
			switchShortToState = 'closed' ;
		}

		// Toggle the target (everething below the header row).
		// First two rows are XMLComment and XMLRoot - they are part
		// of the long dump, the rest are direct children - part of the
		// short dump
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				if ( i < 3 ) cfdump_toggleTarget( target, switchLongToState ) ;
				else cfdump_toggleTarget( target, switchShortToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			var row = 1;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if( target.style ) {
					if ( row < 3 ) {
						cfdump_toggleTarget( target, switchLongToState ) ;
					} else {
						cfdump_toggleTarget( target, switchShortToState ) ;
					}
					row++;
				}
			}
		}
	}

	cfdump_toggleTable = function(source) {

		var switchToState = cfdump_toggleSource( source ) ;
		if(document.all) {
			var table = source.parentElement.parentElement ;
			for ( var i = 1; i < table.rows.length; i++ ) {
				target = table.rows[i] ;
				cfdump_toggleTarget( target, switchToState ) ;
			}
		}
		else {
			var table = source.parentNode.parentNode ;
			for ( var i = 1; i < table.childNodes.length; i++ ) {
				target = table.childNodes[i] ;
				if(target.style) {
					cfdump_toggleTarget( target, switchToState ) ;
				}
			}
		}
	}

	cfdump_toggleSource = function( source ) {
		if ( source.style.fontStyle == 'italic' || source.style.fontStyle == null) {
			source.style.fontStyle = 'normal' ;
			source.title = 'click to collapse' ;
			return 'open' ;
		} else {
			source.style.fontStyle = 'italic' ;
			source.title = 'click to expand' ;
			return 'closed' ;
		}
	}

	cfdump_toggleTarget = function( target, switchToState ) {
		if ( switchToState == 'open' )	target.style.display = '' ;
		else target.style.display = 'none' ;
	}

	// collapse all td elements for queries
	cfdump_toggleRow_qry = function(source) {
		expand = (source.title == "click to collapse") ? "closed" : "open";
		if(document.all) {
			var nbrChildren = source.parentElement.cells.length;
			if(nbrChildren > 1){
				for(i=nbrChildren-1;i>0;i--){
					target = source.parentElement.cells[i];
					cfdump_toggleTarget( target,expand ) ;
					cfdump_toggleSource_qry(source);
				}
			}
			else {
				//target is the right cell
				target = source.parentElement.cells[1];
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
		else{
			var target = null;
			var vLen = source.parentNode.childNodes.length;
			for(var i=vLen-1;i>1;i--){
				if(source.parentNode.childNodes[i].nodeType == 1){
					target = source.parentNode.childNodes[i];
					cfdump_toggleTarget( target,expand );
					cfdump_toggleSource_qry(source);
				}
			}
			if(target == null){
				//target is the last cell
				target = source.parentNode.lastChild;
				cfdump_toggleTarget( target, cfdump_toggleSource( source ) ) ;
			}
		}
	}

	cfdump_toggleSource_qry = function(source) {
		if(expand == "closed"){
			source.title = "click to expand";
			source.style.fontStyle = "italic";
		}
		else{
			source.title = "click to collapse";
			source.style.fontStyle = "normal";
		}
	}

</script> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">Detail</td>
					<td>
					[empty string] 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ErrNumber</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">Message</td>
					<td>
					The element at position 1 cannot be found. 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">StackTrace</td>
					<td>
					coldfusion.runtime.CfJspPage$ArrayBoundException: The element at position 1 cannot be found.
	at coldfusion.runtime.CfJspPage.ArrayGetAt(CfJspPage.java:912)
	at coldfusion.runtime.CfJspPage._arrayGetAt(CfJspPage.java:972)
	at coldfusion.runtime.CfJspPage._arrayGetAt(CfJspPage.java:967)
	at cfwsdl2ecfc1390464133$funcGETSERVICEMETHODCFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:710)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:472)
	at coldfusion.runtime.UDFMethod$ReturnTypeFilter.invoke(UDFMethod.java:405)
	at coldfusion.runtime.UDFMethod$ArgumentCollectionFilter.invoke(UDFMethod.java:368)
	at coldfusion.filter.FunctionAccessFilter.invoke(FunctionAccessFilter.java:55)
	at coldfusion.runtime.UDFMethod.runFilterChain(UDFMethod.java:321)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:220)
	at coldfusion.runtime.CfJspPage._invokeUDF(CfJspPage.java:2582)
	at cfwsdl2ecfc1390464133$funcGETSERVICECFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:452)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:472)
	at coldfusion.filter.SilentFilter.invoke(SilentFilter.java:47)
	at coldfusion.runtime.UDFMethod$ReturnTypeFilter.invoke(UDFMethod.java:405)
	at coldfusion.runtime.UDFMethod$ArgumentCollectionFilter.invoke(UDFMethod.java:368)
	at coldfusion.filter.FunctionAccessFilter.invoke(FunctionAccessFilter.java:55)
	at coldfusion.runtime.UDFMethod.runFilterChain(UDFMethod.java:321)
	at coldfusion.runtime.UDFMethod.invoke(UDFMethod.java:220)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:491)
	at coldfusion.runtime.TemplateProxy.invoke(TemplateProxy.java:337)
	at coldfusion.runtime.CfJspPage._invoke(CfJspPage.java:2360)
	at cfcreateFromWSDL2ecfm1085877717.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\createFromWSDL.cfm:29)
	at coldfusion.runtime.CfJspPage.invoke(CfJspPage.java:231)
	at coldfusion.tagext.lang.IncludeTag.doStartTag(IncludeTag.java:416)
	at coldfusion.runtime.CfJspPage._emptyTcfTag(CfJspPage.java:2722)
	at cfv2011092ecfm367670730.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\v201109.cfm:141)
	at coldfusion.runtime.CfJspPage.invoke(CfJspPage.java:231)
	at coldfusion.tagext.lang.IncludeTag.doStartTag(IncludeTag.java:416)
	at coldfusion.filter.CfincludeFilter.invoke(CfincludeFilter.java:65)
	at coldfusion.filter.ApplicationFilter.invoke(ApplicationFilter.java:381)
	at coldfusion.filter.RequestMonitorFilter.invoke(RequestMonitorFilter.java:48)
	at coldfusion.filter.MonitoringFilter.invoke(MonitoringFilter.java:40)
	at coldfusion.filter.PathFilter.invoke(PathFilter.java:94)
	at coldfusion.filter.LicenseFilter.invoke(LicenseFilter.java:27)
	at coldfusion.filter.ExceptionFilter.invoke(ExceptionFilter.java:70)
	at coldfusion.filter.ClientScopePersistenceFilter.invoke(ClientScopePersistenceFilter.java:28)
	at coldfusion.filter.BrowserFilter.invoke(BrowserFilter.java:38)
	at coldfusion.filter.NoCacheFilter.invoke(NoCacheFilter.java:46)
	at coldfusion.filter.GlobalsFilter.invoke(GlobalsFilter.java:38)
	at coldfusion.filter.DatasourceFilter.invoke(DatasourceFilter.java:22)
	at coldfusion.filter.CachingFilter.invoke(CachingFilter.java:62)
	at coldfusion.CfmServlet.service(CfmServlet.java:200)
	at coldfusion.bootstrap.BootstrapServlet.service(BootstrapServlet.java:89)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:86)
	at coldfusion.monitor.event.MonitoringServletFilter.doFilter(MonitoringServletFilter.java:42)
	at coldfusion.bootstrap.BootstrapFilter.doFilter(BootstrapFilter.java:46)
	at jrun.servlet.FilterChain.doFilter(FilterChain.java:94)
	at jrun.servlet.FilterChain.service(FilterChain.java:101)
	at jrun.servlet.ServletInvoker.invoke(ServletInvoker.java:106)
	at jrun.servlet.JRunInvokerChain.invokeNext(JRunInvokerChain.java:42)
	at jrun.servlet.JRunRequestDispatcher.invoke(JRunRequestDispatcher.java:286)
	at jrun.servlet.ServletEngineService.dispatch(ServletEngineService.java:543)
	at jrun.servlet.jrpp.JRunProxyService.invokeRunnable(JRunProxyService.java:203)
	at jrunx.scheduler.ThreadPool$DownstreamMetrics.invokeRunnable(ThreadPool.java:320)
	at jrunx.scheduler.ThreadPool$ThreadThrottle.invokeRunnable(ThreadPool.java:428)
	at jrunx.scheduler.ThreadPool$UpstreamMetrics.invokeRunnable(ThreadPool.java:266)
	at jrunx.scheduler.WorkerThread.run(WorkerThread.java:66) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TagContext</td>
					<td>
					
				<table class="cfdump_array">
				<tr><th class="array" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">array
				</th></tr>
				
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">1</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					?? 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					710 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfwsdl2ecfc1390464133$funcGETSERVICEMETHODCFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:710) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">2</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					CF_UDFMETHOD 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					452 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfwsdl2ecfc1390464133$funcGETSERVICECFMLCODE.runFunction(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc:452) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\wsdl.cfc 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">3</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					CF_TEMPLATEPROXY 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					29 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfcreateFromWSDL2ecfm1085877717.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\createFromWSDL.cfm:29) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\createFromWSDL.cfm 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
					<tr><td class="array" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">4</td>
					<td> 
			<table class="cfdump_struct">
			<tr><th class="struct" colspan="2" onClick="cfdump_toggleTable(this);" style="cursor:pointer;" title="click to collapse">struct</th></tr> 
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">COLUMN</td>
					<td>
					0 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">ID</td>
					<td>
					CFINCLUDE 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">LINE</td>
					<td>
					141 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">RAW_TRACE</td>
					<td>
					at cfv2011092ecfm367670730.runPage(C:\webdev\projects\localhost\wwwroot\adwords_api\utils\v201109.cfm:141) 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TEMPLATE</td>
					<td>
					C:\webdev\projects\localhost\wwwroot\adwords_api\utils\v201109.cfm 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">TYPE</td>
					<td>
					CFML 
					</td>
					</tr>
					
			</table>
		</td></tr> 
			</table>
		
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">Type</td>
					<td>
					Expression 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">aDimension</td>
					<td>
					-1 
					</td>
					</tr>
					
					<tr>
					<td class="struct" onClick="cfdump_toggleRow(this);" style="cursor:pointer;" title="click to collapse">aIndex</td>
					<td>
					1 
					</td>
					</tr>
					
			</table>
		
<cffunction name="getService" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['service']" default="#createObject('component','service')#">
	<cfreturn variables["instance"]["service"]>
	
</cffunction>

<cffunction name="setService" access="public" returntype="void" output="No">
<cfargument name="service" required="Yes" type="any">
	
	<cfset variables["instance"]["service"]=arguments["service"]>
		
</cffunction>

<cffunction name="getAdwordsUser" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['adwordsUser']" default="">
	<cfreturn variables["instance"]["adwordsUser"]>
	
</cffunction>

<cffunction name="setAdwordsUser" access="public" returntype="void" output="No">
<cfargument name="adwordsUser" required="Yes" type="any">
	
	<cfset variables["instance"]["adwordsUser"]=arguments["adwordsUser"]>
		
</cffunction>

<cffunction name="getServiceUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['serviceUrl']" default="https://adwords.google.com/api/adwords/cm/v201109/ConstantDataService">
	<cfreturn variables["instance"]["serviceUrl"]>
	
</cffunction>

<cffunction name="setServiceUrl" access="public" returntype="void" output="No">
<cfargument name="serviceUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["serviceUrl"]=arguments["serviceUrl"]>
		
</cffunction>

<cffunction name="getSandboxUrl" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['sandboxUrl']" default="https://adwords-sandbox.google.com/api/adwords/cm/v201109/ConstantDataService">
	<cfreturn variables["instance"]["sandboxUrl"]>
	
</cffunction>

<cffunction name="setSandboxUrl" access="public" returntype="void" output="No">
<cfargument name="sandboxUrl" required="Yes" type="any">
	
	<cfset variables["instance"]["sandboxUrl"]=arguments["sandboxUrl"]>
		
</cffunction>

<cffunction name="getUseSandbox" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['useSandbox']" default="false">
	<cfreturn variables["instance"]["useSandbox"]>
	
</cffunction>

<cffunction name="setUseSandbox" access="public" returntype="void" output="No">
<cfargument name="useSandbox" required="Yes" type="boolean">
	
	<cfset variables["instance"]["useSandbox"]=arguments["useSandbox"]>
		
</cffunction>

<cffunction name="getUseDefaultLogging" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['useDefaultLogging']" default="false">
	<cfreturn variables["instance"]["useDefaultLogging"]>
	
</cffunction>

<cffunction name="setUseDefaultLogging" access="public" returntype="void" output="No">
<cfargument name="useDefaultLogging" required="Yes" type="boolean">
	
	<cfset variables["instance"]["useDefaultLogging"]=arguments["useDefaultLogging"]>
		
</cffunction>

<cffunction name="getError" access="public" returntype="any" output="No">
	
	<cfparam name="variables['instance']['error']" default="#structNew()#">
	<cfreturn variables["instance"]["error"]>
	
</cffunction>

<cffunction name="setError" access="public" returntype="void" output="No">
<cfargument name="error" required="Yes" type="any">
	
	<cfset variables["instance"]["error"]=arguments["error"]>
		
</cffunction>

<cffunction name="getNamespace" access="public" returntype="string" output="No">
	
	<cfreturn "https://adwords.google.com/api/adwords/cm/v201109">
	
</cffunction>	

</cfcomponent>