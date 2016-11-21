<cfscript>
	
	bUseSandBox = true; // true use the sandbox , false for production environment
	bUseLogging  = false; // change to true to turn on default logging requests and responses
	
	if(bUseSandBox eq true){
		// sandbox config
		adwords_api_email_account = "";
		adwords_api_password      = "";
		adwords_api_useragent     = "ColdFusion Google Adwords Management Software";
		developer_token           = "";
		customerId				  = "";
		client_email              = "";
	}else{
		// production config
		adwords_api_email_account = "";
		adwords_api_password      = "";
		adwords_api_useragent     = "ColdFusion Google Adwords Management Software";
		developer_token           = "";
		customerId				  = "";
		client_email              = "";
	}
</cfscript>
