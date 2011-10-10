<?php
// =================================================================
// Master : Trucking Companies
// =================================================================
$gridIdMaster       = 'service_master';
$masterPrimaryKey   = "Service.id";
$urlMaster          = Router::url(array(
        'controller'    => 'services',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'services',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Service
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

    // =========================================================================
    // Master Script
    // =========================================================================
    var companyGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Services",
        'width'         : 500,
        "gridModel"     : true,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Service.id',
                'name'          : 'data[Service][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'Service.id',
                'name'          : 'data[Service][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Service.name',
                'name'          : 'data[Service][name]',
                'label'         : 'Name',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Service.charge',
                'name'          : 'data[Service][charge]',
                'label'         : 'Charge',
                'editable'      : true
                
            },
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdMasterPager, 
        'sortname'      : 'Service.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
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
        //]]>
</script>
