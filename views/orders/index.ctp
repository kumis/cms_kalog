	<style>
		label, input { display:block; }
		input.text { margin-bottom:12px; width:95%; padding: .4em; }
		fieldset { padding:0; border:0; margin-top:25px; }
		h1 { font-size: 1.2em; margin: .6em 0; }
		div#users-contain { width: 350px; margin: 20px 0; }
		div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
		div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
		.ui-dialog .ui-state-error { padding: .3em; }
		.validateTips { border: 1px solid transparent; padding: 0.3em; }
	</style>

<?php
// =================================================================
// Master : Orders
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
$detailPrimaryKey   = "OrderPacket.id";
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
<div id="dialog" style='display:none;'>
    <?php echo $form->create('Order',array('id'=>'orderDetail'));?>
	<fieldset>
        <?
		echo $form->input('Order.id',array('disabled'=>true));
        echo $form->input('Debtor.name',array('disabled'=>true));
        echo $form->input('Creditor.name',array('disabled'=>true));
        ?>
	</fieldset>
	</form>
    
    Order Packet 
    <table id="<?php echo $gridIdDetail;?>"></table>
    <div id="<?php echo $gridIdDetail;?>_pager"></div>
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
 <?php
        if ( isset($autocompleteData) && !empty($autocompleteData) ):
            foreach ($autocompleteData as $acd):
                    echo 'var ' . $acd . '_codes = ' . ${$acd . '_names'} . ';';
                    echo
                        'var ' . $acd . '_code_params = {
                            minLength:0, source:' . $acd . '_codes,
                            focus:function(e, ui){
                                
                                $(e.target).val( ui.item.name );
                                //alert($(e.target).val( ));
                                return false;
                                },
                            select:function(e, ui){
                                alert($(e.target));
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
    var detailDialog = $("#"+gridIdDetail).dialog({
        autoOpen    : false,
        height      : 400,
        width       : 600,
        modal       : true
    });
    
    var editDetailDialog = function editDetailDialog(rowId) {
        $( "#dialog" ).dialog();
        $("#"+gridIdMaster).jqGrid('GridToForm', rowId, "#orderDetail" );
        
        $("#"+gridIdDetail).jqGrid('setCaption', "Order Details : " + rowId).trigger('reloadGrid');
    }
    
    var customerAutoComplete = function (elem) {

        $(elem).autocomplete(customer_code_params).data( "autocomplete" )._renderItem = function( ul, item ) {
            return $( "<li></li>" )
                .data( "item.autocomplete", item )
                .append( "<a>" + item.name + "</a>" )
                .appendTo( ul );
        };
    }
    
    var orderCustomButton = function(){ 
        var ids = $("#"+gridIdMaster).jqGrid('getDataIDs');
        for(var i=0;i < ids.length;i++){ 
            var cl = ids[i]; 
            be = "<input style='height:22px;width:20px;' type='button' value='E' onclick=\"editDetailDialog('"+cl+"');\" />";
            $("#"+gridIdMaster).jqGrid('setRowData',ids[i],{Action:be}); 
        } 
    }
    // =========================================================================
    // Master Script
    // =========================================================================
    var orderGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Orders",
        'width'         : 500,
        "gridModel"     : true,
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
                'index'         : 'Order.debtor',
                'name'          : 'data[Debtor][name]',
                'label'         : 'Debtor',
                'editable'      : true,
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }  
                
            },
            {
                'width'         : 50,
                'index'         : 'Order.creditor',
                'name'          : 'data[Creditor][name]',
                'editable'      : true,
                'label'         : 'Creditor',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                name            : 'Action',
                index           : 'action', 
                width           : 75,
                sortable        : false
            },
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdMasterPager, 
        'sortname'      : 'Company.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            },
        'gridComplete' : orderCustomButton
    });
    
    var orderGridNav = $("#"+gridIdMaster).jqGrid(
        'navGrid', 
        "#"+gridIdMasterPager,
        {
            "add": true,
            "edit": true,
            "del": true,
            "search": true
        },{},{},{},{multipleSearch:true}
    );
    
    // =========================================================================
    // Detail Script
    // =========================================================================
    var gridIdDetail        = "<?php echo $gridIdDetail;?>";
    var gridIdDetailPager   = "<?php echo $gridIdDetail;?>_pager";
    var urlDetail           = "<?php echo $urlDetail;?>";
    var editUrlDetail       = "<?php echo $editUrlDetail;?>";
    
    var orderGridDetail = $("#"+gridIdDetail).jqGrid({
        'caption'       : "Orders",
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
                'index'         : 'OrdersPacket.quantity',
                'name'          : 'data[OrdersPacket][quantity]',
                'editable'      : true,
                'label'         : 'packet id',
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
    
    var orderGridDetailNav = $("#"+gridIdDetail).jqGrid(
        'navGrid', 
        "#"+gridIdDetailPager,
        {
            "add": true,
            "edit": true,
            "del": true,
            "search": true
        }
    );
//    var customerNameAutoComplete =  function customerNameAutoComplete (elem) {
//        jQuery(elem).datepicker();
//    }
        //]]>
</script>
