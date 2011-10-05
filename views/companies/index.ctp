<?php
// =================================================================
// Master : Companies
// =================================================================
$gridIdMaster       = 'company_master';
$masterPrimaryKey   = "Company.id";
$urlMaster          = Router::url(array(
        'controller'    => 'companies',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'companies',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Company
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
        'caption'       : "Companies",
        'width'         : 900,
        "gridModel"     : true,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 10,
                'index'         : 'Company.id',
                'name'          : 'data[Company][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'Company.id',
                'name'          : 'data[Company][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
            },
            {
                'width'         : 50,
                'index'         : 'Customer.id',
                'name'          : 'data[Customer][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true                
            },
            {
                'width'         : 50,
                'index'         : 'Company.region',
                'name'          : 'data[Company][region]',
                'label'         : 'Region',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Customer.name',
                'name'          : 'data[Customer][name]',
                'editable'      : true,
                'label'         : 'Name',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.code',
                'name'          : 'data[Customer][code]',
                'editable'      : true,
                'label'         : 'Code',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.address',
                'name'          : 'data[Customer][address]',
                'editable'      : true,
                'label'         : 'Adress',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.country',
                'name'          : 'data[Customer][country]',
                'editable'      : true,
                'label'         : 'Country',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.zipcode',
                'name'          : 'data[Customer][zipcode]',
                'editable'      : true,
                'label'         : 'Zipcode',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.phone_number',
                'name'          : 'data[Customer][phone_number]',
                'editable'      : true,
                'label'         : 'Phone Number',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.fax_number',
                'name'          : 'data[Customer][fax_number]',
                'editable'      : true,
                'label'         : 'Fax Number',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.email',
                'name'          : 'data[Customer][email]',
                'editable'      : true,
                'label'         : 'Email',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.npwp',
                'name'          : 'data[Customer][npwp]',
                'editable'      : true,
                'label'         : 'NPWP',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Customer.vat',
                'name'          : 'data[Customer][vat]',
                'editable'      : true,
                'label'         : 'VAT',
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
<form id="test_form" name="test_form">
    data[Company][id] : <input type="text" name="data[Company][id]" id ="data[Company][id]"/><br>
    data[Company][region] : <input type="text" name="data[Company][region]" id ="data[Company][region]"/><br>
    data[Customer][id] : <input type="text" name="data[Customer][id]" id ="data[Customer][id]"/><br>
    data[Customer][name] : <input type="text" name="data[Customer][name]" id ="data[Customer][name]"/><br>
    data[Customer][code] : <input type="text" name="data[Customer][code]" id ="data[Customer][code]"/><br>
    data[Customer][address] : <input type="text" name="data[Customer][address]" id ="data[Customer][address]"/><br>
    data[Customer][country] : <input type="text" name="data[Customer][country]" id ="data[Customer][country]"/><br>
    data[Customer][zipcode] : <input type="text" name="data[Customer][zipcode]" id ="data[Customer][zipcode]"/><br>
    data[Customer][phone_number] : <input type="text" name="data[Customer][phone_number]" id ="data[Customer][phone_number]"/><br>
    data[Customer][fax_number] : <input type="text" name="data[Customer][fax_number]" id ="data[Customer][fax_number]"/><br>
    data[Customer][email] : <input type="text" name="data[Customer][email]" id ="data[Customer][email]"/><br>
</form>