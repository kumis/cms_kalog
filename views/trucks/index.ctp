<?php
// =================================================================
// Trucks
// =================================================================
$gridId       = 'truck';
$primaryKey   = "Truck.id";
$url = Router::url(array(
        'controller'    => 'trucks',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
	)
);
$editUrl = Router::url(array(
        'controller'    => 'trucks',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

?>

<div id="truck_container">
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
    
    var truckGrid = $("#"+gridId).jqGrid({
        'caption'       : "Trucks",
        'width'         : 500,
        "gridModel"     : true,
        'url'           : url,
        'datatype'      : 'json',
        'editurl'       : editUrl,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Truck.id',
                'name'          : 'data[Truck][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'TruckingCompany.id',
                'name'          : 'data[Truck][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Truck.plate_number',
                'name'          : 'data[Truck][plate_number]',
                'editable'      : true,
                'label'         : 'Plate Number',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Driver.id',
                'name'          : 'data[Driver][id]',
                'editable'      : true,
                'hidden'        : true,                
                'label'         : 'Plate Number',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Driver.first_name',
                'name'          : 'data[Driver][first_name]',
                'editable'      : true,
                'label'         : 'Driver Name',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            }
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdPager, 
        'sortname'      : 'Truck.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            }
    });
    
    var truckGrid = $("#"+gridId).jqGrid(
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