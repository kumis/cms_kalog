<?php

// =================================================================
// Master : Trucking Companies
// =================================================================
$gridIdMaster       = 'trucking_company_master';
$masterPrimaryKey   = "TruckingCompany.id";
$urlMaster          = Router::url(array(
        'controller'    => 'trucking_companies',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'trucking_companies',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

// =================================================================
// Detail : Trucks
// =================================================================
$gridIdDetail       = 'truck_detail';
$detailPrimaryKey   = "Truck.id";
$urlDetail = Router::url(array(
        'controller'    => 'trucks',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
	)
);
$editUrlDetail = Router::url(array(
        'controller'    => 'trucks',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Trucking Company
<table id="<?php echo $gridIdMaster;?>"></table>
<div id="<?php echo $gridIdMaster;?>_pager"></div> 
<br/> 

<div id="truck_detail_container">
    Truck 
    <table id="<?php echo $gridIdDetail;?>"></table>
    <div id="<?php echo $gridIdDetail;?>_pager"></div>
    <a href="javascript:void(0)" id="ms1">Get Selected id's</a>
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

    // =========================================================================
    // Dialog
    // =========================================================================
    var detailDialog = $("#"+gridIdDetail).dialog({
        autoOpen    : false,
        height      : 400,
        width       : 600,
        modal       : true
    });

    // =========================================================================
    // Master Script
    // =========================================================================
    var truckingCompanyGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Trucking Companies",
        'width'         : 500,
        "gridModel"     : true,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'TruckingCompany.id',
                'name'          : 'data[TruckingCompany][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'TruckingCompany.id',
                'name'          : 'data[TruckingCompany][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'TruckingCompany.name',
                'name'          : 'data[TruckingCompany][name]',
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
        'pager'         : gridIdMasterPager, 
        'sortname'      : 'id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : false ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            },
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
        }
    });
    
    var truckingCompanyGrid = $("#"+gridIdMaster).jqGrid(
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
    
    var truckGrid = $("#"+gridIdDetail).jqGrid({
        'caption'       : "Trucks",
        'width'         : 500,
        "gridModel"     : true,
        'url'           : urlDetail,
        'datatype'      : 'json',
        'editurl'       : editUrlDetail,
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
        'pager'         : gridIdDetailPager, 
        'sortname'      : 'Truck.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : false ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            }
    });
    
    var truckGrid = $("#"+gridIdDetail).jqGrid(
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