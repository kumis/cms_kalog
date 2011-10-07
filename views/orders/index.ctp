<?php
// =================================================================
// Master : Trucking Companies
// =================================================================
$gridIdMaster       = 'order_master';
$masterPrimaryKey   = "Order.id";
$urlMaster          = Router::url(array(
        'controller'    => 'orders',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'orders',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

// =================================================================
// Detail : Trucks
// =================================================================
$gridIdDetail       = 'order_packet';
$detailPrimaryKey   = "Order.id";
$urlDetail = Router::url(array(
        'controller'    => 'orders_packets',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
	)
);
$editUrlDetail = Router::url(array(
        'controller'    => 'orders_packets',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Order
<table id="<?php echo $gridIdMaster;?>"></table>
<div id="<?php echo $gridIdMaster;?>_pager"></div> 
<br/> 

<div id="truck_detail_container">
    Order Packet 
    <table id="<?php echo $gridIdDetail;?>"></table>
    <div id="<?php echo $gridIdDetail;?>_pager"></div>
    <a href="javascript:void(0)" id="ms1">Get Selected id's</a>
</div>

<div id='formdialog' style='display:none;'>
    <?php echo $form->create('Order',array('id'=>'orderhead'));?>
	<fieldset>
        <?
		echo $form->input('id',array('disabled'=>true));
        echo $form->input('Order.date',array('disabled'=>true, 'type'=>'text','label' => 'Date'));
        echo $form->input('Debtor.name',array('disabled'=>true,'type'=>'text', 'label' => 'Debtor Name'));
        echo $form->input('Creditor.name',array('disabled'=>true,'type'=>'text', 'label' => 'Creditor Name'));
        
        ?>
	</fieldset>
	</form>
    <div id="truck_detail_container">
    Order Packet 
    <table id="<?php echo $gridIdDetail;?>"></table>
    <div id="<?php echo $gridIdDetail;?>_pager"></div>
    <a href="javascript:void(0)" id="ms1">Get Selected id's</a>
</div>
</div>
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
    
    // =========================================================================
    // Detail Vars
    // =========================================================================
    var gridIdDetail        = "<?php echo $gridIdDetail;?>";
    var detailPrimaryKey    = "<?php echo $detailPrimaryKey;?>";
    var gridIdDetailPager   = "<?php echo $gridIdDetail;?>_pager";
    var urlDetail           = "<?php echo $urlDetail;?>";
    var editUrlDetail       = "<?php echo $editUrlDetail;?>";
    //==========================================================================
    //
    //==========================================================================
    
    
    // =========================================================================
    // Dialog
    // =========================================================================
    
    var detailDialog = $("#"+gridIdDetail).dialog({
        autoOpen    : false,
        height      : 400,
        width       : 600,
        modal       : true
    });
    
    var opendialog  = function opendialog(ids){
            $("#formdialog" ).dialog();
            $("#"+gridIdMaster).jqGrid('GridToForm', ids, "#orderhead" );
            
            $("#"+gridIdDetail).jqGrid('setCaption', "Order Packate: " + ids).trigger('reloadGrid');			
    }
    
    var orderButton = function(){
         
        var ids = jQuery("#"+gridIdMaster).jqGrid('getDataIDs'); 
        
        for(var i=0;i < ids.length;i++){ 
            var cl = ids[i];
             
            be = "<input style='height:22px;width:20px;' type='button' value='E' onclick=\"opendialog('"+cl+"');\" />";
            jQuery("#"+gridIdMaster).jqGrid('setRowData',ids[i],{'act':be}); 
            } 
        }
    
    // =========================================================================
    // Master Script
    // =========================================================================
    /*dt_autocomplete**/
    <?php
        if ( isset($autocompleteData) && !empty($autocompleteData) ):
            foreach ($autocompleteData as $acd):
                    echo 'var ' . $acd . '_codes = ' . ${$acd . '_names'} . ';';
                    echo
                        'var ' . $acd . '_code_params = {
                            minLength:0, source:' . $acd . '_codes,
                            focus:function(e, ui){
                                
                                $(e.target).val( ui.item.name );
                                return false;
                                },
                            select:function(e, ui){
                                var row = $(e.target).parent().parent();
                                
                                $(e.target).val( ui.item.name );
                                $("input[name*=' . $acd . '_id]").val( ui.item.id );
                                //$(".' . $acd . '_description", row).val( ui.item.description );
                                return false;
                            }
                        };';    
            endforeach;
        endif;
    ?>
    
        customerAutoComplete = function (elem) {
            
            $(elem).autocomplete(customer_code_params).data( "autocomplete" )._renderItem = function( ul, item ) {
                return $( "<li></li>" )
				.data( "item.autocomplete", item )
				.append( "<a>" + item.name + "</a>" )
				.appendTo( ul );
		};
        }
  
    var orderGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Orders",
        'width'         : 800,
        "gridModel"     : true,
        "gridComplete"  : orderButton,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Order.id',
                'name'          : 'data[Order][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'Order.id',
                'name'          : 'data[Order][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Debtor.name',
                'name'          : 'data[Debtor][name]',
                'editable'      : true,
                'label'         : 'Debtor Name' 
            },
            
            {
                'width'         : 50,
                'index'         : 'Creditor.name',
                'name'          : 'data[Creditor][name]',
                'editable'      : true, 
                'label'         : 'Creditor Name',
                'editoptions'   : 
                    {
                        'size'          : 10                       
                    }, 
                'editrules': { required: true}
                
                            
            },
            {
                'width'         : 50,
                'index'         : 'Order.date',
                'name'          : 'data[Order][date]',
                'editable'      : true,
                'label'         : 'date',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit':function(el){ $(el).datepicker({dateFormat:'yy-mm-dd'}); }
                    }                    
            },
            {
                'name':'act',
                'index':'act', 
                'width':75,
                'label':'Action',
                'sortable':false
            }
            
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdMasterPager, 
        'sortname'      : 'id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
      //  'postData'      :{'oper':'grid'},
        'prmNames'      :{
                                'deloper':'del',"excel":"excel","subgrid":"subgrid","totalrows":"totalrows",
                                'autocomplete':'autocmpl'
                        },
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            },
        "onCellSelect" : function (ids, cellId) {
            // the cellId points to the first cell defined in colModel
            if(cellId == 1) {
                detailDialog.dialog("open");
                if (ids == null) {
                    ids = 0;
                    if (jQuery("#"+gridIdDetail).jqGrid('getGridParam', 'records') > 0) {
                        jQuery("#"+gridIdDetail).jqGrid('setGridParam', {
                            url: urlDetail+"?"+masterPrimaryKey+"=" + ids,
                            page: 1
                        });
                        jQuery("#"+gridIdDetail).jqGrid('setCaption', "Order Packate: " + ids).trigger('reloadGrid');
                    }
                } else {
                    jQuery("#"+gridIdDetail).jqGrid('setGridParam', {
                        url: urlDetail+"?"+masterPrimaryKey+"=" + ids,
                        page: 1
                    });
                    jQuery("#"+gridIdDetail).jqGrid('setCaption', "Invoice Detail: " + ids).trigger('reloadGrid');
                }  
                              
            }
        },
        "beforeCheckValues": 
            function (id,name,val,iRow,iCol){
                   // alert(jQuery("#"+iRow+"_start_date","#celltbl")); 
                    //if(name=='start_date') { 
                        
                    //    jQuery("#"+iRow+"_start_date","#celltbl").datepicker({dateFormat:"yy-mm-dd"}); 
                    //} 
                }
    });
    
    var orderGrid = $("#"+gridIdMaster).jqGrid(
        'navGrid', 
        "#"+gridIdMasterPager,
        {
            "add": true,
            "edit": true,
            "del": true,
            "search": true
        }
    );


     
    // =========================================================================
    // Detail Script
    // =========================================================================
    var gridIdDetail        = "<?php echo $gridIdDetail;?>";
    var gridIdDetailPager   = "<?php echo $gridIdDetail;?>_pager";
    var urlDetail           = "<?php echo $urlDetail;?>";
    var editUrlDetail       = "<?php echo $editUrlDetail;?>";
    
    var orderPacketGrid = $("#"+gridIdDetail).jqGrid({
        'caption'       : "Order Packet",
        'width'         : 500,
        "gridModel"     : true,
        'url'           : urlDetail,
        'datatype'      : 'json',
        'editurl'       : editUrlDetail,
        'colNames'      : [],
        'colModel'      : [
            
            {
                'width'         : 50,
                'index'         : 'OrdersPacket.id',
                'name'          : 'data[OrdersPacket][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'OrdersPacket.id',
                'name'          : 'data[OrdersPacket][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },            
            {
                'width'         : 50,
                'index'         : 'Packet.id',
                'name'          : 'data[Packet][id]',
                'editable'      : true,
                'hidden'        : true,                
                'label'         : 'packet id',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Packet.name',
                'name'          : 'data[Packet][name]',
                'editable'      : true,
                'label'         : 'Packet Name',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'OrdersPacket.quantity',
                'name'          : 'data[OrdersPacket][quantity]',
                'editable'      : true,
                'label'         : 'Quantity',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            }
            
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdDetailPager, 
        'sortname'      : 'OrdersPacket.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            }
    });
    
    var orderPacketGrid = $("#"+gridIdDetail).jqGrid(
        'navGrid', 
        "#"+gridIdDetailPager,
        {
            "add": true,
            "edit": true,
            "del": true,
            "search": true
        }
    );

    //]]>
</script>
