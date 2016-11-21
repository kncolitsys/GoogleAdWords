/*
 LEGAL: Copyright: M.Orth , Orth u. Pilatzki GbR, 2012 http://www.cfsolutions.de
 License: http://www.cfsolutions.de/coldfusion_adwords_api/
 */
Ext.override(Ext.tree.TreeLoader, {
    getParams: function(node){
        var bp = Ext.apply({}, this.baseParams), np = this.nodeParameter, po = this.paramOrder, xy = 'node.attributes.' + this.nodeParameter;
        
        if (this.nodeParameter !== 'node' && typeof eval(xy) !== 'undefined') {
            np && (bp[np] = eval(xy));
        }
        else {
            np && (bp[np] = node.id);
        }
        
        if (this.directFn) {
            var buf = [node.id];
            if (po) {
                // reset 'buf' if the nodeParameter was included in paramOrder
                if (np && po.indexOf(np) > -1) {
                    buf = [];
                }
                
                for (var i = 0, len = po.length; i < len; i++) {
                    buf.push(bp[po[i]]);
                }
            }
            else 
                if (this.paramsAsHash) {
                    buf = [bp];
                }
            return buf;
        }
        else {
            return bp;
        }
    }
});

Ext.onReady(function(){

    Ext.BLANK_IMAGE_URL = "ext/resources/images/default/s.gif";
    Ext.QuickTips.init();
    
    function getNewWindow(title){
        var window = new Ext.Window({
            autoScroll: true,
            title: title,
            layout: 'fit',
            width: 400,
            height: 240,
            deferredRender: false,
            plain: true
        });
        return window;
    }
    
    
    function getEmptyForm(buttonText, formButtonHandler, scope){
        var form = new Ext.form.FormPanel({
            bodyStyle: 'padding: 6px',
            border: false,
            labelWidth: 126,
            defaultType: 'textfield',
            defaults: {
                msgTarget: 'side',
                anchor: '-20'
            },
            bbar: {
                buttonAlign: 'center',
                items: [{
                    text: buttonText,
                    cls: 'x-toolbar-standardbutton',
                    handler: formButtonHandler,
                    scope: scope
                }, {
                    xtype: 'tbspacer',
                    width: 5
                }, {
                    text: 'Cancel',
                    cls: 'x-toolbar-standardbutton',
                    handler: formButtonHandler,
                    scope: scope
                }]
            }
        });
        return form;
    }
    
    
    // setter for clientCustomerID
    function setClientCustomerId(customerId){
        clientCustomerID = customerId;
    };
    
    // getter for clientCustomerID
    function getClientCustomerId(){
        if (typeof clientCustomerID === 'undefined') {
            clientCustomerID = 0;
        }
        return clientCustomerID;
    };
    
    // setter for bHideDeletedCampaigns
    function setHideDeletedCampaigns(bHide){
        bHideDeletedCampaigns = bHide;
    };
    
    // getter for bHideDeletedCampaigns
    function getHideDeletedCampaigns(){
        if (typeof bHideDeletedCampaigns === 'undefined') {
            bHideDeletedCampaigns = 0;
        }
        return bHideDeletedCampaigns;
    };
    
    var addCampaignButton = new Ext.Button({
        icon: 'icons/fam/add.gif',
        text: 'Add Campaign'
    });
    var addHideDeletedCampaignsButton = new Ext.Button({
        icon: 'icons/fam/hide.png',
        text: 'Hide deleted Campaigns'
    });
    
    // handler for the add campaign button
    addCampaignButton.on('click', function(){
        // open a window and show form to add a campaign
        var newCampaignWindow = getNewWindow('Add new Campaign');
        var newCampaignForm = getEmptyForm('Add Campaign', newCampaignFormButtonHandler, this);
        newCampaignForm.add({
            xtype: 'hidden',
            name: 'clientCustomerId',
            value: getClientCustomerId()
        });
        newCampaignForm.add({
            fieldLabel: 'Campaign Name',
            name: 'campaignName',
            allowBlank: false
        });
        newCampaignWindow.add(newCampaignForm);
        newCampaignWindow.show();
    }, this);
    
    // handler for the hide/show deleted campaigns button
    addHideDeletedCampaignsButton.on('click', function(button, event){
        // check if the button displays the hide or show icon
        if (getHideDeletedCampaigns()) {
            // show deleted campaigns
            var root = campaigns.getRootNode();
            // loop through the campaign nodes from the campaigns tree
            for (var i = 0; i < root.childNodes[0].childNodes.length; i++) {
                if (root.childNodes[0].childNodes[i].attributes.status == 'DELETED') {
                    root.childNodes[0].childNodes[i].getUI().show();
                }
            }
            setHideDeletedCampaigns(0);
            button.setIcon('icons/fam/hide.png');
            button.setText('Hide deleted Campaigns');
        }
        else {
            // hide deleted campaigns
            var root = campaigns.getRootNode();
            // loop through the campaign nodes from the campaigns tree
            for (var i = 0; i < root.childNodes[0].childNodes.length; i++) {
                if (root.childNodes[0].childNodes[i].attributes.status == 'DELETED') {
                    root.childNodes[0].childNodes[i].getUI().hide();
                }
            }
            setHideDeletedCampaigns(1);
            button.setIcon('icons/fam/eye.png');
            button.setText('Show deleted Campaigns');
        }
        
    }, this);
    
    // create new toolbar for the campaign tree
    var toolbar = new Ext.Toolbar({});
    
    // add the previously created buttons to the toolbar
    toolbar.add(addCampaignButton);
    toolbar.add(addHideDeletedCampaignsButton);
    
    // handler for newCampaignForm
    function newCampaignFormButtonHandler(button, event){
        switch (button.text) {
            case "Add Campaign":
                // create new campaign on the server
                var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                formPanel.el.mask('Please wait', 'x-mask-loading');
                formPanel.getForm().submit({
                    url: 'data.cfm',
                    method: 'post',
                    params: {
                        method: 'addCampaign'
                    },
                    success: function(form, action){
                        var data = form.getValues();
                        var response = Ext.util.JSON.decode(action.response.responseText);
                        var targetNodeID = 'tHeCaMpAiGn';
                        var targetNode = campaigns.getNodeById(targetNodeID);
                        // load previosly added campaign to the campaign tree
                        targetNode.reload();
                        // load campaign data into the propertyGrid
                        propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                            text: 'campaign',
                            draggable: false,
                            campaignID: response.campaignid,
                            loader: getPropGridLoader('getCampaigns', 'properties', 'campaignID')
                        }));
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        // unmask the form panel
                        formPanel.el.unmask();
                        // get and close the form window
                        Ext.WindowMgr.getActive().destroy();
                    },
                    failure: function(form, action){
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        if (action.failureType !== 'client') {
                            var response = Ext.util.JSON.decode(action.response.responseText);
                            var errorMessage = Ext.decode(action.response.statusText).message || 'Unexpected Error. Please try again later.';
                            // unmask the form panel
                            formPanel.el.unmask();
                            // get and close the form window
                            Ext.WindowMgr.getActive().destroy();
                            // display error message
                            Ext.Msg.alert('Google API Error', errorMessage);
                            // display error data inside property grid
                            propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                                text: 'error'
                            }));
                            propertyGrid.getRootNode().appendChild(response.data);
                            propertyGrid.expandAll();
                        }
                        else {
                            // unmask the form panel
                            formPanel.el.unmask();
                        }
                    }
                });
                break;
                
            case "Cancel":
                Ext.WindowMgr.getActive().destroy();
                break;
        }
    }
    
    // handler for newAdGroupForm
    function newAdGroupCMHandler(button, event){
        switch (button.text) {
            case "Add AdGroup":
                // create new adGroup on the server
                var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                formPanel.el.mask('Please wait', 'x-mask-loading');
                formPanel.getForm().submit({
                    url: 'data.cfm',
                    method: 'post',
                    params: {
                        method: 'addAdGroup'
                    },
                    success: function(form, action){
                        var data = form.getValues();
                        var response = Ext.util.JSON.decode(action.response.responseText);
                        var campaignNodeID = 'campaign-' + response.campaignid;
                        campaigns.getNodeById(campaignNodeID).expand();
                        // load adGroup data into the propertyGrid
                        propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                            text: 'adgroup',
                            draggable: false,
                            adGroupID: response.adgroupid,
                            loader: getPropGridLoader('getAdGroups', 'properties', 'adGroupID')
                        }));
                        var targetNodeID = 'adgroups-' + response.campaignid;
                        var targetNode = campaigns.getNodeById(targetNodeID);
                        // load previosly added adGroup to the campaign tree
                        targetNode.reload();
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        // unmask the form panel
                        formPanel.el.unmask();
                        // get and close the form window
                        Ext.WindowMgr.getActive().destroy();
                    },
                    failure: function(form, action){
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        if (action.failureType !== 'client') {
                            var response = Ext.util.JSON.decode(action.response.responseText);
                            var errorMessage = Ext.decode(action.response.statusText).message || 'Unexpected Error. Please try again later.';
                            // unmask the form panel
                            formPanel.el.unmask();
                            // get and close the form window
                            Ext.WindowMgr.getActive().destroy();
                            // display error message
                            Ext.Msg.alert('Google API Error', errorMessage);
                            // display error data inside property grid
                            propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                                text: 'error'
                            }));
                            propertyGrid.getRootNode().appendChild(response.data);
                            propertyGrid.expandAll();
                        }
                        else {
                            // unmask the form panel
                            formPanel.el.unmask();
                        }
                    }
                });
                break;
                
            case "Cancel":
                Ext.WindowMgr.getActive().destroy();
                break;
        }
    }
    
    // handler for newTextAdForm
    function newTextAdCMHandler(button, event){
        switch (button.text) {
            case "Add TextAd":
                // create new TextAd on the server
                var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                formPanel.el.mask('Please wait', 'x-mask-loading');
                formPanel.getForm().submit({
                    url: 'data.cfm',
                    method: 'post',
                    params: {
                        method: 'addTextAd'
                    },
                    success: function(form, action){
                        var response = Ext.util.JSON.decode(action.response.responseText);
                        var adGroupNodeID = 'adgroup-' + response.adgroupid;
                        campaigns.getNodeById(adGroupNodeID).expand();
                        // load ad data into the propertyGrid
                        propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                            text: 'ad',
                            draggable: false,
                            adID: response.adid,
                            loader: getPropGridLoader('getAdGroupAds', 'properties', 'adID')
                        }));
                        var targetNodeID = 'ads-' + response.adgroupid;
                        var targetNode = campaigns.getNodeById(targetNodeID);
                        // load previosly added ad to the campaign tree
                        targetNode.reload();
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        // unmask the form panel
                        formPanel.el.unmask();
                        // get and close the form window
                        Ext.WindowMgr.getActive().destroy();
                    },
                    failure: function(form, action){
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        if (action.failureType !== 'client') {
                            var response = Ext.util.JSON.decode(action.response.responseText);
                            var errorMessage = Ext.decode(action.response.statusText).message || 'Unexpected Error. Please try again later.';
                            // unmask the form panel
                            formPanel.el.unmask();
                            // get and close the form window
                            Ext.WindowMgr.getActive().destroy();
                            // display error message
                            Ext.Msg.alert('Google API Error', errorMessage);
                            // display error data inside property grid
                            propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                                text: 'error'
                            }));
                            propertyGrid.getRootNode().appendChild(response.data);
                            propertyGrid.expandAll();
                        }
                        else {
                            // unmask the form panel
                            formPanel.el.unmask();
                        }
                    }
                });
                break;
                
            case "Cancel":
                Ext.WindowMgr.getActive().destroy();
                break;
        }
    }
    
    // handler for newKeywordForm
    function newKeywordCMHandler(button, event){
        switch (button.text) {
            case "Add Keyword":
                // create new keyword on the server
                var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                formPanel.el.mask('Please wait', 'x-mask-loading');
                formPanel.getForm().submit({
                    url: 'data.cfm',
                    method: 'post',
                    params: {
                        method: 'addKeyword'
                    },
                    success: function(form, action){
                        var response = Ext.util.JSON.decode(action.response.responseText);
                        var adGroupNodeID = 'adgroup-' + response.adgroupid;
                        campaigns.getNodeById(adGroupNodeID).expand();
                        // load keyword data into the propertyGrid
                        propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                            text: 'criterion',
                            draggable: false,
                            criterionID: response.criterionid,
                            loader: getPropGridLoader('getAdGroupCriteria', 'properties', 'criterionID')
                        }));
                        var targetNodeID = 'criteria-' + response.adgroupid;
                        var targetNode = campaigns.getNodeById(targetNodeID);
                        // load previosly keyword ad to the campaign tree
                        targetNode.reload();
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        // unmask the form panel
                        formPanel.el.unmask();
                        // get and close the form window
                        Ext.WindowMgr.getActive().destroy();
                    },
                    failure: function(form, action){
                        // get the form panel
                        var formPanel = Ext.WindowMgr.getActive().getComponent(0);
                        if (action.failureType !== 'client') {
                            var response = Ext.util.JSON.decode(action.response.responseText);
                            var errorMessage = Ext.decode(action.response.statusText).message || 'Unexpected Error. Please try again later.';
                            // unmask the form panel
                            formPanel.el.unmask();
                            // get and close the form window
                            Ext.WindowMgr.getActive().destroy();
                            // display error message
                            Ext.Msg.alert('Google API Error', errorMessage);
                            // display error data inside property grid
                            propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                                text: 'error'
                            }));
                            propertyGrid.getRootNode().appendChild(response.data);
                            propertyGrid.expandAll();
                        }
                        else {
                            // unmask the form panel
                            formPanel.el.unmask();
                        }
                    }
                });
                break;
                
            case "Cancel":
                Ext.WindowMgr.getActive().destroy();
                break;
        }
    }
    
    // create an instance of the campaignPanel; the campaignPanel holds all campaign data
    var campaigns = new Ext.tree.TreePanel({
        id: 'campaign-tree',
        title: 'Campaigns',
        region: 'center',
        rootVisible: false,
        lines: false,
        border: false,
        containerScroll: true,
        autoScroll: true,
        tbar: toolbar,
        layoutConfig: {
            deferredRender: true
        },
        selModel: new Ext.tree.DefaultSelectionModel(),
        root: new Ext.tree.TreeNode('rootCampaignNode'),
        expandable: true,
        expanded: true
    });
    
    // this function provides a context menu for the campaign 
    // tree nodes depending on the type of the node
    function getCampaignNodeContextMenu(node){
        var cmID = node.id, addText = '', deleteText = '';
        
        var treeContextMenu = new Ext.menu.Menu({
            itemId: cmID
        });
        
        if (node.attributes.type == 'cmp' && typeof node.attributes.campaignID !== 'undefined') {
        
            // the user has rightclicked a campaign node with a campaignID
            
            if (node.attributes.status !== 'DELETED') {
            
                treeContextMenu.add({
                    text: 'Set Campaign Status to DELETED',
                    icon: 'icons/fam/delete.gif',
                    itemId: cmID + '-del-campaign',
                    handler: campaignTreeCMHandler,
                    node: node,
                    method: 'setCampaignStatus',
                    status: 'DELETED'
                });
                
            }
            else {
            
                treeContextMenu.add({
                    text: 'Set Campaign Status to ACTIVE',
                    icon: 'icons/fam/run.png',
                    itemId: cmID + '-run-campaign',
                    handler: campaignTreeCMHandler,
                    node: node,
                    method: 'setCampaignStatus',
                    status: 'ACTIVE'
                });
                
            }
            treeContextMenu.add({
                text: 'Add AdGroup to Campaign',
                icon: 'icons/fam/add.gif',
                itemId: cmID + '-add-addgroup',
                handler: campaignTreeCMHandler,
                node: node,
                method: 'addAdGroup'
            });
            
        }
        else 
            if (node.attributes.type == 'adg' && typeof node.attributes.adGroupID !== 'undefined') {
            
                // the user has rightclicked an adgroup node with an adGroupID
                
                if (node.attributes.status !== 'DELETED') {
                
                    treeContextMenu.add({
                        text: 'Set AddGroup Status to DELETED',
                        icon: 'icons/fam/delete.gif',
                        itemId: cmID + '-del-adgroup',
                        handler: campaignTreeCMHandler,
                        node: node,
                        method: 'setAdGroupStatus',
                        status: 'DELETED'
                    });
                    
                }
                else {
                
                    treeContextMenu.add({
                        text: 'Set AddGroup Status to ENABLED',
                        icon: 'icons/fam/run.png',
                        itemId: cmID + '-run-adgroup',
                        handler: campaignTreeCMHandler,
                        node: node,
                        method: 'setAdGroupStatus',
                        status: 'ENABLED'
                    });
                    
                }
                treeContextMenu.add({
                    text: 'Add TextAd to AdGroup',
                    icon: 'icons/fam/add.gif',
                    itemId: cmID + '-add-textad',
                    handler: campaignTreeCMHandler,
                    node: node,
                    method: 'addTextAd'
                });
                treeContextMenu.add({
                    text: 'Add Keyword to AdGroup',
                    icon: 'icons/fam/add.gif',
                    itemId: cmID + '-add-keyword',
                    handler: campaignTreeCMHandler,
                    node: node,
                    method: 'addKeyword'
                });
                
            }
            else 
                if (node.attributes.type == 'adg' && typeof node.attributes.adGroupID === 'undefined') {
                
                    // the user has rightclicked an adgroup node without an adGroupId
                    
                    treeContextMenu.add({
                        text: 'Add AdGroup',
                        icon: 'icons/fam/add.gif',
                        itemId: cmID + '-add-adgroup',
                        handler: campaignTreeCMHandler,
                        node: node,
                        method: 'addAdGroup'
                    });
                    
                }
                else 
                    if (node.attributes.type == 'ads' && typeof node.attributes.adID !== 'undefined') {
                    
                        // the user has rightclicked an ads node with an adID
                        
                        treeContextMenu.add({
                            text: 'Delete this Ad',
                            icon: 'icons/fam/delete.gif',
                            itemId: cmID + '-del-ad',
                            handler: campaignTreeCMHandler,
                            node: node,
                            method: 'delAd'
                        });
                        
                    }
                    else 
                        if (node.attributes.type == 'ads' && typeof node.attributes.adID === 'undefined') {
                        
                            // the user has rightclicked an ads node without an adID
                            
                            treeContextMenu.add({
                                text: 'Add TextAd to AdGroup',
                                icon: 'icons/fam/add.gif',
                                itemId: cmID + '-add-textad',
                                handler: campaignTreeCMHandler,
                                node: node,
                                method: 'addTextAd'
                            });
                            
                        }
                        else 
                            if (node.attributes.type == 'crit' && typeof node.attributes.criterionID !== 'undefined') {
                            
                                // the user has rightclicked a criteria node with a criterionID	
                                
                                treeContextMenu.add({
                                    text: 'Delete this Criterion',
                                    icon: 'icons/fam/delete.gif',
                                    itemId: cmID + '-del-criterion',
                                    handler: campaignTreeCMHandler,
                                    node: node,
                                    method: 'delCriterion'
                                });
                                
                            }
                            else 
                                if (node.attributes.type == 'crit' && typeof node.attributes.criterionID === 'undefined') {
                                
                                    // the user has rightclicked a criteria node without a criterionID
                                    
                                    treeContextMenu.add({
                                        text: 'Add Keyword to Adgroup',
                                        icon: 'icons/fam/add.gif',
                                        itemId: cmID + '-add-keyword',
                                        handler: campaignTreeCMHandler,
                                        node: node,
                                        method: 'addKeyword'
                                    });
                                    
                                }
        
        return treeContextMenu
    }
    
    // handler for the campaign tree context menus
    function campaignTreeCMHandler(menuitem, event){
        switch (menuitem.method) {
        
            case "setCampaignStatus":
                var options = {
                    method: menuitem.method,
                    'clientCustomerID': getClientCustomerId()
                };
                options['campaignID'] = menuitem.node.attributes.campaignID;
                options['status'] = menuitem.status;
                // change the campaign status on the server side
                callAjax(options, function(opt, success, response){
                    if (success) {
                        var campaignRoot = campaigns.getRootNode();
                        opt.node.attributes.status = opt.params.status;
                        opt.node.setTooltip('Status:&nbsp;' + opt.params.status);
                        var aNodes = Ext.util.JSON.decode(response.responseText);
                        var root = propertyGrid.setRootNode(new Ext.tree.TreeNode());
                        root.appendChild(aNodes);
                    }
                }, menuitem.node);
                break;
                
            case "setAdGroupStatus":
                var options = {
                    method: menuitem.method,
                    'clientCustomerID': getClientCustomerId()
                };
                options['adGroupID'] = menuitem.node.attributes.adGroupID;
                options['status'] = menuitem.status;
                // change the adGroup status on the server side
                callAjax(options, function(opt, success, response){
                    if (success) {
                        var campaignRoot = campaigns.getRootNode();
                        opt.node.attributes.status = opt.params.status;
                        opt.node.setTooltip('Status:&nbsp;' + opt.params.status);
                        var aNodes = Ext.util.JSON.decode(response.responseText);
                        var root = propertyGrid.setRootNode(new Ext.tree.TreeNode());
                        root.appendChild(aNodes);
                    }
                }, menuitem.node);
                break;
                
            case "delAd":
                var options = {
                    method: menuitem.method,
                    'clientCustomerID': getClientCustomerId()
                };
                options['adGroupID'] = menuitem.node.attributes.adGroupID;
                options['adID'] = menuitem.node.attributes.adID;
                // delete the node on the server side
                callAjax(options, function(opt, success, response){
                    if (success) {
                        opt.node.remove();
                    }
                }, menuitem.node);
                break;
                
            case "delCriterion":
                var options = {
                    method: menuitem.method,
                    'clientCustomerID': getClientCustomerId()
                };
                options['adGroupID'] = menuitem.node.attributes.adGroupID;
                options['criterionID'] = menuitem.node.attributes.criterionID;
                // delete the node on the server side
                callAjax(options, function(opt, success, response){
                    if (success) {
                        opt.node.remove();
                    }
                }, menuitem.node);
                break;
                
            case "addAdGroup":
                // open a window and show form to add an adGroup
                var newAdGroupWindow = getNewWindow('Add new AdGroup');
                var newAdGroupForm = getEmptyForm('Add AdGroup', newAdGroupCMHandler, this);
                newAdGroupForm.add({
                    xtype: 'hidden',
                    name: 'clientCustomerId',
                    value: getClientCustomerId()
                });
                newAdGroupForm.add({
                    xtype: 'hidden',
                    name: 'campaignID',
                    value: menuitem.node.attributes.campaignID
                });
                newAdGroupForm.add({
                    fieldLabel: 'AdGroup Name',
                    name: 'adGroupName',
                    allowBlank: false
                });
                newAdGroupWindow.add(newAdGroupForm);
                newAdGroupWindow.show();
                break;
                
            case "addTextAd":
                // open a window and show form to add a TextAd
                // How much text can I have in my ads?
                // http://adwords.google.com/support/aw/bin/answer.py?hl=en-uk&answer=6095
                var newTextAdWindow = getNewWindow('Add new TextAd');
                var newTextAdForm = getEmptyForm('Add TextAd', newTextAdCMHandler, this);
                newTextAdForm.add({
                    xtype: 'hidden',
                    name: 'clientCustomerId',
                    value: getClientCustomerId()
                });
                newTextAdForm.add({
                    xtype: 'hidden',
                    name: 'adGroupID',
                    value: menuitem.node.attributes.adGroupID
                });
                newTextAdForm.add({
                    fieldLabel: 'Headline',
                    name: 'headline',
                    allowBlank: false,
                    maxLength: 25
                });
                newTextAdForm.add({
                    fieldLabel: 'Description 1',
                    name: 'desc1',
                    allowBlank: false,
                    maxLength: 35
                });
                newTextAdForm.add({
                    fieldLabel: 'Description 2',
                    name: 'desc2',
                    allowBlank: false,
                    maxLength: 35
                });
                newTextAdForm.add({
                    fieldLabel: 'Display URL',
                    name: 'dspurl',
                    allowBlank: false,
                    maxLength: 35
                });
                newTextAdForm.add({
                    fieldLabel: 'URL',
                    name: 'url',
                    allowBlank: false,
                    vtype: 'url'
                });
                newTextAdWindow.add(newTextAdForm);
                newTextAdWindow.show();
                break;
                
            case "addKeyword":
                // open a window and show form to add a Keyword
                var newKeywordWindow = getNewWindow('Add new Keyword');
                var newKeywordForm = getEmptyForm('Add Keyword', newKeywordCMHandler, this);
                newKeywordForm.add({
                    xtype: 'hidden',
                    name: 'clientCustomerId',
                    value: getClientCustomerId()
                });
                newKeywordForm.add({
                    xtype: 'hidden',
                    name: 'adGroupID',
                    value: menuitem.node.attributes.adGroupID
                });
                newKeywordForm.add({
                    fieldLabel: 'Keyword',
                    name: 'keyword',
                    allowBlank: false
                });
                newKeywordWindow.add(newKeywordForm);
                newKeywordWindow.show();
                break;
        }
    };
    
    function callAjax(options, callback, node){
        Ext.Ajax.request({
            waitMsg: "connecting server ...",
            url: "data.cfm",
            method: "POST",
            node: node,
            params: options,
            callback: callback
        });
    };
    
    
    // register right click contextmenu for the campaignPanel
    campaigns.on('contextmenu', function(node, event){
        var menu = '';
        if (typeof node.attributes.type !== 'undefined') {
            event.stopEvent();
            menu = getCampaignNodeContextMenu(node);
            menu.showAt(event.getXY());
        }
    }, this);
    
    // dataStore witch holds the clientData
    var clientData = new Ext.data.JsonStore({
        autoLoad: false,
        url: "data.cfm",
        fields: ["login", "customerId"],
        baseParams: {
            method: "getClientData"
        },
        dummy: true
    });
    
    // function deffinition to load data inside campaignPanel
    function loadCampaignTree(){
    
        var treeloader = '';
        
        // create a new treeLoader instance	
        treeLoader = new Ext.tree.TreeLoader({
            url: "data.cfm",
            clearOnLoad: false,
            nodeParameter: 'campaignID',
            baseParams: {
                method: 'getCampaigns',
                clientCustomerID: getClientCustomerId(), // get the clientCustomerID
                targetJSONFormat: 'tree'
            }
        });
        
        // handle server side errors
        treeLoader.on('loadexception', function(loader, node, response){
            // show error message
            var errorMessage = Ext.decode(response.statusText).message || 'Unexpected Error. Please try again later.';
            Ext.Msg.alert('Google API Error', errorMessage);
            window.setTimeout(function(){
                // unload the clicked node
                node.collapse(false, false);
                while (node.firstChild) {
                    node.removeChild(node.firstChild);
                }
                node.childrenRendered = false;
                node.loaded = false;
                node.ui.updateExpandIcon();
            }, 1000);
        });
        
        // replace the existing root node of the campaignPanel with a empty one
        campaigns.setRootNode(new Ext.tree.TreeNode('rootCampaignNode'));
        
        // append a new async tree node with previously defined treeLoader as the loader
        campaigns.root.appendChild(new Ext.tree.AsyncTreeNode({
            text: 'Campaigns',
            id: 'tHeCaMpAiGn',
            iconCls: 'campaign-icon',
            cls: 'campaigns-node',
            draggable: false,
            loader: treeLoader,
            expanded: true
        }));
        
        // depending on the nodes type we change the baseParams of the coresponding treeloader
        treeLoader.on('beforeload', function(trl, node){
            if (typeof node.attributes.type === 'undefined') {
                trl.nodeParameter = 'campaignID';
                trl.baseParams = {
                    method: 'getCampaigns',
                    clientCustomerID: getClientCustomerId(),
                    targetJSONFormat: 'tree'
                };
            }
            else {
                if (node.attributes.type == 'cmp') {
                    // the user has opened a campaign node
                    trl.nodeParameter = 'campaignID';
                    trl.baseParams = {
                        method: 'getCampaigns',
                        clientCustomerID: getClientCustomerId(),
                        targetJSONFormat: 'tree'
                    };
                }
                else 
                    if (node.attributes.type == 'adg') {
                        // the user has opened an adgroup node
                        trl.nodeParameter = 'campaignID';
                        trl.baseParams = {
                            method: 'getAdGroups',
                            clientCustomerID: getClientCustomerId(),
                            targetJSONFormat: 'tree'
                        };
                    }
                    else 
                        if (node.attributes.type == 'ads') {
                            // the user has opened an ads node
                            trl.nodeParameter = 'adGroupID';
                            trl.baseParams = {
                                method: 'getAdGroupAds',
                                clientCustomerID: getClientCustomerId(),
                                targetJSONFormat: 'tree'
                            };
                        }
                        else 
                            if (node.attributes.type == 'crit') {
                                // the user has opened a criteria node
                                trl.nodeParameter = 'adGroupID';
                                trl.baseParams = {
                                    method: 'getAdGroupCriteria',
                                    clientCustomerID: getClientCustomerId(),
                                    targetJSONFormat: 'tree'
                                };
                            }
            }
        }, this);
        
        treeLoader.on('load', function(){
            campaigns.el.unmask();
            
            campaigns.on('expandnode', function(node){
                node.select();
            }, this);
            
        }, this);
        
    }
    
    // ad a listener for the load event of jsonDataStore client Data
    clientData.on('load', function(st, rec, opt){
        // set clientCustomerID to the first value of the store clientData
        setClientCustomerId(st.getAt(0).data.customerId);
        // select the first entry of the combobox clientCombo
        clientCombo.setValue(getClientCustomerId());
        // mask the campaigns panel 
        campaigns.el.mask('Please wait', 'x-mask-loading');
        // load campaign data belonging to the currently selected client inside the campaignPanel
        loadCampaignTree();
    }, this);
    
    // comboBox with a client account listing
    var clientCombo = new Ext.form.ComboBox({
        editable: false,
        region: 'north',
        border: false,
        mode: 'local',
        store: clientData,
        triggerAction: 'all',
        valueField: 'customerId',
        displayField: 'login',
        selectOnFocus: true
    });
    
    // load the client data inside the comboBox when it is rendered
    clientCombo.on('render', function(combo){
        combo.getStore().load();
    });
    
    // change campaign data inside campaignPanel if user changes client account selection
    clientCombo.on('select', function(cb, r, i){
        setClientCustomerId(r.data.customerId);
        // mask the campaigns panel 
        campaigns.el.mask('Please wait', 'x-mask-loading');
        loadCampaignTree();
    }, this);
    
    function getPropGridLoader(method, targetJSONFormat, nodeParameter){
    
        var propertyGridLoader = new Ext.ux.tree.TreeGridLoader({
            border: false,
            url: "data.cfm",
            clearOnLoad: true,
            nodeParameter: nodeParameter,
            baseParams: {
                method: method,
                targetJSONFormat: targetJSONFormat,
                clientCustomerId: getClientCustomerId()
            }
        });
        
        propertyGridLoader.on('loadexception', function(loader, node, response){
            var errorMessage = Ext.decode(response.statusText).message || 'Unexpected Error. Please try again later.';
            Ext.Msg.alert('Google API Error', errorMessage);
            window.setTimeout(function(){
                node.collapse(false, false);
                while (node.firstChild) {
                    node.removeChild(node.firstChild);
                }
                node.childrenRendered = false;
                node.loaded = false;
                node.ui.updateExpandIcon();
            }, 1000);
        });
        
        return propertyGridLoader;
    };
    
    
    var propertyGrid = new Ext.ux.tree.TreeGrid({
        enableDD: false,
        singleExpand: false,
        border: false,
        columns: [{
            header: 'Field',
            width: 400,
            dataIndex: 'text'
        }, {
            header: 'Value',
            width: 400,
            dataIndex: 'value'
        }],
        autoExpandColumn: 'Value'
    });
    
    campaigns.selModel.on('selectionchange', function(selModel, node){
        var tabpanel = Ext.getCmp('tabpanel');
        tabpanel.activate('detailspanel');
        if (typeof node.attributes.type !== 'undefined') {
            if (node.attributes.type == 'cmp' && typeof node.attributes.campaignID !== 'undefined') {
            
                propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                    text: 'campaign',
                    draggable: false,
                    campaignID: node.attributes.campaignID,
                    loader: getPropGridLoader('getCampaigns', 'properties', 'campaignID')
                }));
                
            }
            else 
                if (node.attributes.type == 'adg' && typeof node.attributes.adGroupID !== 'undefined') {
                
                    propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                        text: 'adgroup',
                        draggable: false,
                        adGroupID: node.attributes.adGroupID,
                        loader: getPropGridLoader('getAdGroups', 'properties', 'adGroupID')
                    }));
                    
                }
                else 
                    if (node.attributes.type == 'ads' && typeof node.attributes.adID !== 'undefined') {
                    
                        propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                            text: 'ad',
                            draggable: false,
                            adID: node.attributes.adID,
                            loader: getPropGridLoader('getAdGroupAds', 'properties', 'adID')
                        }));
                    }
                    else 
                        if (node.attributes.type == 'tar' && typeof node.attributes.campaignID !== 'undefined') {
                        
                            propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                                text: 'target',
                                draggable: false,
                                campaignID: node.attributes.campaignID,
                                loader: getPropGridLoader('getTargetList', 'properties', 'campaignID')
                            }));
                            
                        }
                        else 
                            if (node.attributes.type == 'crit' && typeof node.attributes.criterionID !== 'undefined') {
                            
                                propertyGrid.setRootNode(new Ext.tree.AsyncTreeNode({
                                    text: 'criterion',
                                    draggable: false,
                                    criterionID: node.attributes.criterionID,
                                    loader: getPropGridLoader('getAdGroupCriteria', 'properties', 'criterionID')
                                }));
                                
                            }
        }
        
    }, this);
    
    var viewport = new Ext.Viewport({
        layout: 'border',
        items: [new Ext.BoxComponent({
            region: 'north',
            el: 'header',
            html: '<div class="appTitle">Google Adwords Account Viewer</div>',
            height: 32
        }), {
            region: 'west',
            split: true,
            collapsible: true,
            collapseFirst: false,
            title: "Clients",
            width: 400,
            minSize: 175,
            border: true,
            margins: '0 5 10 10',
            layout: 'fit',
            items: [{
                layout: 'border',
                items: [clientCombo, campaigns],
                border: false,
                margins: '0 0 0 0'
            }]
        }, {
            xtype: 'tabpanel',
            region: 'center',
            id: 'tabpanel',
            margins: '0 10 10 0',
            activeTab: 0,
            frame: true,
            items: [{
                title: 'Details',
                id: 'detailspanel',
                layout: 'fit',
                items: [propertyGrid]
            }, {
                title: 'Help',
                id: 'helppanel',
                autoScroll: true,
                padding: 4,
                autoLoad: 'help.cfm'
            }]
        }]
    });
});

