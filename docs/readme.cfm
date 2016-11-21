<script type="text/javascript">
	titleBar_setSubTitle(" ");
</script>
<div class="detailSectionHeader">
	Welcome to the world of ColdFusion and Google Adwords
</div>
<div>
	<strong>
		Version: 1.02 of v201101
	</strong>
</div>
<br/>
<strong>
	About
</strong>

<p>
	With the ColdFusion Adwords API Client Library it is possible to get access to the 
	<a href="http://www.google.com/apis/adwords/" target="_blank">
		Google Adwords API
	</a>
	(V201101) to start new campaigns, adding ads, to add keywords and so on. All with the help of a
	simple and robust set of coldfusion components accessing the google adwords api. More at 
	<a href="http://www.cfsolutions.de/coldfusion_adwords_api/" target="_blank">
		http://www.cfsolutions.de/coldfusion_adwords_api/
	</a>
	. 
</p>
<hr>
<table border="0">
	<tr>
		<td width="80%" valign="top">
			<strong>
				Install
			</strong>
			<p>
				The downloadable Zip consits of the following directories:
			</p>
			<p>
				adwords_api
				<br>
				- com
				<br>
				- docs
				<br>
				- examples
			</p>
			<p>
				To install the ColdFusion Adwords API Client Library you have to extract the zip file to your
				webroot directory. After doing that you have to move the com folder from webroot/adwords_api/com 
				to
				webroot/com. Requires: ColdFusion 8
			</p>
			<p>
				All examples are connecting to the sandbox. You need a google account to get access to the 
				sandbox.
				Go to the examples dir and change the user settings inside config.cfm to a valid google account 
				and
				the examples should work. Once you get your api account you can change the settings inside
				config.cfm again.
				I suggest using the included coldfusion and extjs based 
				<a href="http://www.cfsolutions.de/coldfusion_adwords_api/simple_adwords_app/" target="_blank">
					Google Adwords Account Viewer
				</a>
				or the 
				<a href="http://code.google.com/p/google-api-adwords-java/wiki/SandboxAccountViewer" 
				   target="_blank">
					Sandbox Account Viewer (Java based GUI for the Adwords API Sandbox)
				</a>
				during developement.
			</p>
		</td>
		<td width="20%" valign="top">
			
			<div class="detailSectionHeader">Donations</div>
			
			<p>
				You like the library and its usage saved you a lot of time? Have you ever thought about a 
				donation?
				<br>
				<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
					<input type="hidden" name="cmd" value="_s-xclick">
					<input type="hidden" name="hosted_button_id" value="HEYQWXC22CW44">
					<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" 
					       border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
					<img alt="" border="0" src="https://www.paypalobjects.com/de_DE/i/scr/pixel.gif" width="1"
					     height="1">
				</form>
			</p>
		</td>
	</tr>
</table>

<hr>
<strong>
	Requirements:
</strong>
<p>
	<ul>
		<li>
			works with ColdFusion 8.01, ColdFusion 9, Railo 3.2
			<br>
			(Do you need a CF7 version of the library? m.orth@cfsolutions.de)
		</li>
	</ul>
</p>
<hr>
<strong>
	Extra Documentation
</strong>
<p>
	I have written an extra documentation beside this class documentation. You will find it 
	<a href="../ColdFusion_Adwords_API_Library_Documentation.pdf" target="_blank">
		here
	</a>
	.
</p>
<hr>
<strong>
	I want your feedback.
</strong>
<p>
	<ul>
		<li>
			This is the first code library I have published so far and because of this it is very important
			for me to get any feedback about the library. Did you looked at the code? Does the examples work
			with your Google Account? Did you looked at getObjectData() and setObjectData()? Realy any
			feedback is appreciated.
		</li>
		<li>
			If you have any feedback, questions, feature requests, bugs to report, please send an eMail to
			m.orth@cfsolutions.de. This is the prefered way to contact me.
		</li>
	</ul>
</p>
<hr>

<strong>
	Licensing & Support
</strong>
<p>
	<a href="http://www.cfsolutions.de">
		cfsolutions
	</a>
	offers the ColdFusion Adwords API Client Library under flexible licenses designed to meet the usage
	and distribution requirements of different users:
	<br>
	
	<ul>
		<li>
			<p>
				<strong>
					Open Source Projects
				</strong>
				- Open Source developers developing and distributing open source applications under the 
				<a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html">
					GNU General Public License (GPL) v2.0
				</a>
				are free to use the ColdFusion Adwords API Client Library consistent with its terms. Although
				the 
				<a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html">
					GPL license
				</a>
				provides GPL users no direct legal relationship with 
				<a href="http://www.cfsolutions.de">
					cfsolutions
				</a>
				, cfsolutions does offer paid specific support benefits for open source projects.
			</p>
		</li>
		<li>
			<p>
				<strong>
					OEM and Enterprise Use of the ColdFusion Adwords API Client Library
				</strong>
				- For those organizations that plan to use the ColdFusion Adwords API Client Library for their
				enterprise environment, cfsolutions provides a commercial license that includes technical
				support, product warranties, intellectual property indemnification and other assurances from
				cfsolutions. The commercial license is cfsolutions private license, and provides a direct legal
				relationship with cfsolutions.
			</p>
			<p>
				The end-user commercial license is the most common alternative for OEMs, allowing them the
				flexibility to embed and redistribute all or a targeted portion of the ColdFusion Adwords API
				Client Library software with their solution. A second option for OEM or Resellers is to use the
				open source license, provided they abide by the rules of the GNU General Public License (GPL)
				v2.0 . For example, the GPL license stipulates that if a "ColdFusion Adwords API Client Library�
				project or application is redistributed, the complete source code for this application must be
				open source and available for redistribution.
			</p>
		</li>
	</ul>
</p>
<hr>
<strong>
	Release History
</strong>
<br/>
<small>
	* = changed&nbsp;&nbsp;- = removed&nbsp;&nbsp;+ = added
</small>
<p>
	<i>
		May 18,2011 - Version 1.02 of v201101
	</i>
	<br>
	<ul>
		<li>
			+ supports railo 3.2
		</li>
		<li>
			+ new example getTrafficEstimates.cfm
		</li>
		<li>
			+ new example getGeoLocation.cfm
		</li>
		<li>
			+ new example getOperationCount.cfm
		</li>
		<li>
			+ new example getAllAccountChanges.cfm
		</li>
	</ul>
</p>
<p>
	<i>
		May 15,2011 - Version 1.01 of v201101
	</i>
	<br>
	<ul>
		<li>
			+ new example getTargetingIdeas.cfm
		</li>
		<li>
			+ # removed from cfc descriptions and hints
		</li>
		<li>
			+ improved Adwords Account Viewer
		</li>
	</ul>
</p>
<p>
	<i>
		May 11,2011 - Version 1.0 of v201101
	</i>
	<br>
	<ul>
		<li>
			+ new logging
		</li>
		<li>
			+ new proxy support
		</li>
		<li>
			+ better error handling
		</li>
		<li>
			+ example app 
			<a href="http://www.cfsolutions.de/coldfusion_adwords_api/simple_adwords_app/">
				http://www.cfsolutions.de/coldfusion_adwords_api/simple_adwords_app/
			</a>
		</li>
	</ul>
</p>
<p>
	<i>
		April 18,2011 - Version Beta 0.5 of v201101
	</i>
	<br>
	<ul>
		<li>
			adaption of new google adwords api v201101 with all services, still beta while not tested with
			all services in a production environment
		</li>
		<li>
			new examples for working with campaigns, adgroups, ads and keywords(criterions).
		</li>
	</ul>
</p>
<p>
	<i>
		May 13,2008 - Version Beta 0.4
	</i>
	<br>
	<ul>
		<li>
			improved error handling; use call getApiException() to get a detailed error message from the
			adwords api as a coldfusion structure
		</li>
		<li>
			new addCampaign example
		</li>
	</ul>
</p>
<p>
	<i>
		May 04,2008 - Version Beta 0.3
	</i>
	<br>
	<ul>
		<li>
			changed returntype and datatype for array of objects(eg. campaign[] or string[]) to array for
			backward compatibility, look into docs(hints) for returntypes
		</li>
		<li>
			development of a simple example application based on the api(still at the beginning)
		</li>
	</ul>
</p>
<p>
	<i>
		April 26,2008 - Version Beta 0.2
	</i>
	<br>
	<ul>
		<li>
			finished implementation of all classes, not yet tested
		</li>
	</ul>
</p>
<hr>
<strong>
	Notes:
</strong>
<p>
	<ul>
		<li>
			This documentation is made with 
			<a href="http://cfcdoc.riaforge.org" target="_blank">
				CFCDoc
			</a>
			.
		</li>
	</ul>
</p>