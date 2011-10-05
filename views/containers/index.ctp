<?php
$gridIdMaster       = 'container';
$masterPrimaryKey   = "Container.id";
$urlMaster          = Router::url(array(
        'controller'    => 'containers',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'containers',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Container
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
    
    
        var containerGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Containers",
        'width'         : 800,
        "gridModel"     : true,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Container.id',
                'name'          : 'data[Container][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'Container.id',
                'name'          : 'data[Container][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'ContainerType.id',
                'name'          : 'data[ContainerType][Container_type_id]',
                'editable'      : true,
                'hidden'        : true,
                'label'         : 'ContainerTypeId' 
            },
            
            {
                'width'         : 50,
                'index'         : 'Container.container_no',
                'name'          : 'data[Container][container_no]',
                'editable'      : true,
                'label'         : 'Container No',
                'editoptions'   : 
                    {
                        'size'          : 10//,
                        //'dataInit':function(el){ $(el).datepicker({}); },
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'ContainerType.id',
                'name'          : 'data[ContainerType][id]',
                'editable'      : true, 
                'label'         : 'Container Type',
                'editoptions'   : 
                    {
                        'size'          : 10//,
                       // 'dataInit'      : containerAutoComplete
                        
                                         
                        }, 
                'editrules': { required: true},
                
                            
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
            },
    /*    "onCellSelect" : function (ids, cellId) {
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
    
    var containerGrid = $("#"+gridIdMaster).jqGrid(
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
