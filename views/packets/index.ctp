<?php
// =================================================================
// Master : Trucking Companies
// =================================================================
$gridIdMaster       = 'packet_master';
$masterPrimaryKey   = "Packet.id";
$urlMaster          = Router::url(array(
        'controller'    => 'packets',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'packets',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

// =================================================================
// Detail : Trucks
// =================================================================
$gridIdDetail       = 'packet_service';
$detailPrimaryKey   = "Packet.id";
$urlDetail = Router::url(array(
        'controller'    => 'packet_services',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
	)
);
$editUrlDetail = Router::url(array(
        'controller'    => 'packet_services',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Packet
<table id="<?php echo $gridIdMaster;?>"></table>
<div id="<?php echo $gridIdMaster;?>_pager"></div> 
<br/> 

<div id="truck_detail_container">
    Packet Service
    <table id="<?php echo $gridIdDetail;?>"></table>
    <div id="<?php echo $gridIdDetail;?>_pager"></div>
    <a href="javascript:void(0)" id="ms1">Get Selected id's</a>
</div>

<div id='formdialog' style='display:none;'>
    <?php echo $form->create('Packet',array('id'=>'packethead'));?>
	<fieldset>
        <?
			echo $form->input('id',array('disabled'=>true));
			echo $form->input('name',array('disabled'=>true));
        ?>
	</fieldset>
	</form>
    <div id="packet_service">
    Packet Service
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
            $( "#formdialog" ).dialog();
            $("#"+gridIdMaster).jqGrid('GridToForm', ids, "#packethead" );
			jQuery("#"+gridIdDetail).jqGrid('setCaption', "Packet Service: " + ids).trigger('reloadGrid');
            console.log(jQuery("#"+gridIdDetail).jqGrid('getGridParam', 'records'));
    }
    
    var packetButton = function(){
         
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
  
    var packetGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Packets",
        'width'         : 800,
        "gridModel"     : true,
        "gridComplete"  : packetButton,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Packet.id',
                'name'          : 'data[Packet][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'Packet.id',
                'name'          : 'data[Packet][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Packet.name',
                'name'          : 'data[Packet][name]',
                'editable'      : true,
                'hidden'        : true,
                'label'         : 'Packet Name' 
            },
            {
                'width'         : 50,
                'index'         : 'Packet.name',
                'name'          : 'data[Packet][name]',
                'editable'      : true, 
                'label'         : 'Packet Name',
                'editoptions'   : 
                    {
                        'size'          : 10,
					},
                'editrules': { required: true},
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
                        jQuery("#"+gridIdDetail).jqGrid('setCaption', "Packet Service: " + ids).trigger('reloadGrid');
                    }
                } else {
                    jQuery("#"+gridIdDetail).jqGrid('setGridParam', {
                        url: urlDetail+"?"+masterPrimaryKey+"=" + ids,
                        page: 1
                    });
                    jQuery("#"+gridIdDetail).jqGrid('setCaption', "Service Detail: " + ids).trigger('reloadGrid');
                }  
            }
        },
        "beforeCheckValues": 
            function (id,name,val,iRow,iCol) {
			}
    });
    
    var packetGrid = $("#"+gridIdMaster).jqGrid(
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
    
    var packetServiceGrid = $("#"+gridIdDetail).jqGrid({
        'caption'       : "Packet Service",
        'width'         : 500,
        "gridModel"     : true,
        'url'           : urlDetail,
        'datatype'      : 'json',
        'editurl'       : editUrlDetail,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'PacketService.id',
                'name'          : 'data[PacketService][id]',
                'label'         : 'Id'
            },
            {
                'width'         : 50,
                'index'         : 'PacketService.id',
                'name'          : 'data[PacketService][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
            },            
            {
                'width'         : 50,
                'index'         : 'Service.id',
                'name'          : 'data[Service][id]',
                'editable'      : true,
                'hidden'        : true,                
                'label'         : 'Service Id',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Service.name',
                'name'          : 'data[Service][name]',
                'editable'      : true,
                'label'         : 'Service Name',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'name':'act',
                'index':'act', 
                'width':75,
                'sortable':false
            }
            
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdDetailPager, 
        'sortname'      : 'PacketService.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            }
    });
    
    var packetServiceGrid = $("#"+gridIdDetail).jqGrid(
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
