<?php
// =================================================================
// Trucks
// =================================================================
$gridId       = 'cusutomer';
$primaryKey   = "Customer.id";
$url = Router::url(array(
        'controller'    => 'customers',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
	)
);
$editUrl = Router::url(array(
        'controller'    => 'customers',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

?>

<div id="customer_container">
    <table id="<?php echo $gridId;?>"></table>
    <div id="<?php echo $gridId;?>_pager"></div>
</div>

<script type="text/javascript">
    //<![CDATA[   
    // =========================================================================
    // Vars
    // =========================================================================
    var gridId        = "<?php echo $gridId;?>";
    var primaryKey    = "<?php echo $primaryKey;?>";
    var gridIdPager   = "<?php echo $gridId;?>_pager";
    var url           = "<?php echo $url;?>";
    var editUrl       = "<?php echo $editUrl;?>";
    
    // =========================================================================
    //  Script
    // =========================================================================
    
    var customerGrid = $("#"+gridId).jqGrid({
        'caption'       : "Customer",
        'width'         : 500,
        'url'           : url,
        'datatype'      : 'json',
        'editurl'       : editUrl,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Customer.id',
                'name'          : 'data[Customer][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'ContactPerson.id',
                'name'          : 'data[ContactPerson][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
            },
            {
                'width'         : 50,
                'index'         : 'ContactPerson.first_name',
                'name'          : 'data[ContactPerson][first_name]',
                'label'         : 'Contact Person',
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
                        'size'          : 10
                    }                    
            }
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdPager, 
        'sortname'      : 'Customer.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            }
    });
    
    var CustomerGridNav = $("#"+gridId).jqGrid(
        'navGrid', 
        "#"+gridIdPager,
        {
            "add": true,
            "edit": true,
            "del": true,
            "search": true
        },{},{},{},{multipleSearch:true}
    );    
    //]]>
</script>
