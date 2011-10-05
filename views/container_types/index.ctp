<?php
$gridIdMaster       = 'container_types';
$masterPrimaryKey   = "ContainerTypes.id";
$urlMaster          = Router::url(array(
        'controller'    => 'container_types',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'container_types',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Container Type
<table id="<?php echo $gridIdMaster;?>"></table>
<div id="<?php echo $gridIdMaster;?>_pager"></div> 
<br/> 
<script type="text/javascript">
    //<![CDATA[    
    // =========================================================================
    // Master Vars
    // =========================================================================
    var gridIdMaster        = "<?php echo $gridIdMaster;?>";
    var masterPrimaryKey    = "<?php echo $masterPrimaryKey;?>";
    var gridIdMasterPager   = "<?php echo $gridIdMaster;?>_pager";
    var urlMaster           = "<?php echo $urlMaster;?>";
    var editUrlMaster       = "<?php echo $editUrlMaster;?>";
    
        var agreementGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Agreements",
        'width'         : 800,
        "gridModel"     : true,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Agreement.id',
                'name'          : 'data[Agreement][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'Agreement.id',
                'name'          : 'data[Agreement][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Customer.name',
                'name'          : 'data[Agreement][customer_id]',
                'editable'      : true,
                'hidden'        : true,
                'label'         : 'Customer Name' 
            },
            
            {
                'width'         : 50,
                'index'         : 'Customer.name',
                'name'          : 'data[Customer][name]',
                'editable'      : true, 
                'label'         : 'Customer Name',
                'editoptions'   : 
                    {
                        'size'          : 10,
                      //  'dataInit'      : customerAutoComplete
                        
                                         
                        }, 
                'editrules': { required: true},
                
                            
            },
            {
                'width'         : 50,
                'index'         : 'Agreement.start_date',
                'name'          : 'data[Agreement][start_date]',
                'editable'      : true,
                'label'         : 'Start date',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit':function(el){ $(el).datepicker({dateFormat:'yy-mm-dd'}); },
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Agreement.expired_date',
                'name'          : 'data[Agreement][expired_date]',
                'editable'      : true,
                'label'         : 'Expired Date',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit':function(el){ $(el).datepicker({dateFormat:'yy-mm-dd'}); },
                    }                    
            }
            
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdMasterPager, 
        'sortname'      : 'id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : false ,
      //  'postData'      :{'oper':'grid'},
        'prmNames'      :{
                                'deloper':'del',"excel":"excel","subgrid":"subgrid","totalrows":"totalrows",
                                'autocomplete':'autocmpl'
                        },
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            },/*
        "onCellSelect" : function (ids, cellId) {
            // the cellId points to the first cell defined in colModel
            if(cellId == 0) {
                detailDialog.dialog("open");
                if (ids == null) {
                    ids = 0;
                    if (jQuery("#"+gridIdDetail).jqGrid('getGridParam', 'records') > 0) {
                        jQuery("#"+gridIdDetail).jqGrid('setGridParam', {
                            url: urlDetail+"?"+masterPrimaryKey+"=" + ids,
                            page: 1
                        });
                        jQuery("#"+gridIdDetail).jqGrid('setCaption', "Invoice Detail: " + ids).trigger('reloadGrid');
                    }
                } else {
                    jQuery("#"+gridIdDetail).jqGrid('setGridParam', {
                        url: urlDetail+"?"+masterPrimaryKey+"=" + ids,
                        page: 1
                    });
                    jQuery("#"+gridIdDetail).jqGrid('setCaption', "Invoice Detail: " + ids).trigger('reloadGrid');
                }  
                              
            }
        },*/
        "beforeCheckValues": 
            function (id,name,val,iRow,iCol){
                    alert(jQuery("#"+iRow+"_start_date","#celltbl")); 
                    //if(name=='start_date') { 
                        
                    //    jQuery("#"+iRow+"_start_date","#celltbl").datepicker({dateFormat:"yy-mm-dd"}); 
                    //} 
                }
    });
    
    var agreementGrid = $("#"+gridIdMaster).jqGrid(
        'navGrid', 
        "#"+gridIdMasterPager,
        {
            "add": true,
            "edit": true,
            "del": true,
            "search": true
        }
    );
    //]]>
</script>
