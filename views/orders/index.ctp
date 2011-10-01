<?php
// =================================================================
// Master : Orders
// =================================================================
$gridIdMaster       = 'company_master';
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
?>
Order
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
    var customerAutoComplete = function (elem) {

        $(elem).autocomplete(customer_code_params).data( "autocomplete" )._renderItem = function( ul, item ) {
            return $( "<li></li>" )
                .data( "item.autocomplete", item )
                .append( "<a>" + item.name + "</a>" )
                .appendTo( ul );
        };
    }
    // =========================================================================
    // Master Script
    // =========================================================================
    var companyGrid = $("#"+gridIdMaster).jqGrid({
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
                'name'          : 'data[Order][debtor]',
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
                'name'          : 'data[Order][creditor]',
                'editable'      : true,
                'label'         : 'Creditor',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            }
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
            }
    });
    
    var companyGrid = $("#"+gridIdMaster).jqGrid(
        'navGrid', 
        "#"+gridIdMasterPager,
        {
            "add": true,
            "edit": true,
            "del": true,
            "search": true
        },{},{},{},{multipleSearch:true}
    );
    
//    var customerNameAutoComplete =  function customerNameAutoComplete (elem) {
//        jQuery(elem).datepicker();
//    }
        //]]>
</script>
