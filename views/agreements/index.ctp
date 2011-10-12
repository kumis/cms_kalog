<style>
label {
    margin-right:40px;
    
} 
</style>
<?php
// =================================================================
// Master : Trucking Companies
// =================================================================
$gridIdMaster       = 'agreement_master';
$masterPrimaryKey   = "Agreement.id";
$urlMaster          = Router::url(array(
        'controller'    => 'agreements',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'agreements',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

// =================================================================
// Detail : Trucks
// =================================================================
$gridIdDetail       = 'agreement_packet';
$detailPrimaryKey   = "Agreement.id";
$urlDetail = Router::url(array(
        'controller'    => 'agreements_packets',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
	)
);
$editUrlDetail = Router::url(array(
        'controller'    => 'agreements_packets',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);
?>
Agreement
<table id="<?php echo $gridIdMaster;?>"></table>
<div id="<?php echo $gridIdMaster;?>_pager"></div> 
<br/> 

<div id="truck_detail_container">
    Agreement Packet 
    <table id="<?php echo $gridIdDetail;?>"></table>
    <div id="<?php echo $gridIdDetail;?>_pager"></div>
    <a href="javascript:void(0)" id="ms1">Get Selected id's</a>
</div>

<div id='formdialog' style='display:none;'>
    <?php echo $form->create('Agreement',array('id'=>'agreementhead'));?>
	<fieldset>
        <?
		echo $form->input('id',array('disabled'=>true));
        echo $form->input('Customer.name',array('disabled'=>true,'label'=>'Customer','span'=>true));
        echo $form->input('start_date',array('disabled'=>true,'type'=>'text','label'=>'Start date','span'=>true));
        echo $form->input('expired_date',array('disabled'=>true,'type'=>'text','label'=>'Expired Date','span'=>true));
        
        ?>
	</fieldset>
	</form>
    <div id="truck_detail_container">
    Agreement Packet 
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
            $( "#formdialog" ).dialog(
            {
                modal  : true,
                height : 500,
                width  : 700
            }
            );
            $("#"+gridIdMaster).jqGrid('GridToForm', ids, "#agreementhead" );
            
                        jQuery("#"+gridIdDetail).jqGrid('setCaption', "Agreement Packate: " + ids).trigger('reloadGrid');
                
                
            console.log(jQuery("#"+gridIdDetail).jqGrid('getGridParam', 'records'));
			
    }
    
    var agreementButton = function(){
         
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
  
    var agreementGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "Agreements",
        'width'         : 800,
        'height'        : 300,
        "gridModel"     : true,
        "gridComplete"  : agreementButton,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'Agreement.id',
                'name'          : 'data[Agreement][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'Agreement.id',
                'name'          : 'data[Agreement][id]',
                'hidden'        : true,
                'label'         : 'Id',
                'editable'      : true
                
            },
            {
                'width'         : 50,
                'index'         : 'Customer.name',
                'name'          : 'data[Agreement][customer_id]',
                'editable'      : true,
                'hidden'        : true,
                'label'         : 'Customer Name' 
            },
            
            {
                'width'         : 50,
                'index'         : 'Customer.name',
                'name'          : 'data[Customer][name]',
                'editable'      : true, 
                'label'         : 'Customer Name',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit'      : customerAutoComplete
                        
                                         
                        }, 
                'editrules': { required: true},
                
                            
            },
            {
                'width'         : 50,
                'index'         : 'Agreement.start_date',
                'name'          : 'data[Agreement][start_date]',
                'editable'      : true,
                'label'         : 'Start date',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit':function(el){ $(el).datepicker({dateFormat:'yy-mm-dd'}); },
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'Agreement.expired_date',
                'name'          : 'data[Agreement][expired_date]',
                'editable'      : true,
                'label'         : 'Expired Date',
                'editoptions'   : 
                    {
                        'size'          : 10,
                        'dataInit':function(el){ $(el).datepicker({dateFormat:'yy-mm-dd'}); },
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
                        jQuery("#"+gridIdDetail).jqGrid('setCaption', "Agreement Packate: " + ids).trigger('reloadGrid');
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
    
    var agreementGrid = $("#"+gridIdMaster).jqGrid(
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
    
    var agreementPacketGrid = $("#"+gridIdDetail).jqGrid({
        'caption'       : "Agreement Packet",
        'width'         : 500,
        "gridModel"     : true,
        'url'           : urlDetail,
        'datatype'      : 'json',
        'editurl'       : editUrlDetail,
        'colNames'      : [],
        'colModel'      : [
            
            {
                'width'         : 50,
                'index'         : 'AgreementsPacket.id',
                'name'          : 'data[AgreementsPacket][id]',
                'label'         : 'Id'
                
            },
            {
                'width'         : 50,
                'index'         : 'AgreementsPacket.id',
                'name'          : 'data[AgreementsPacket][id]',
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
                'index'         : 'AgreementsPacket.freetime',
                'name'          : 'data[AgreementsPacket][freetime]',
                'editable'      : true,
                'label'         : 'Free Time',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'AgreementsPacket.penalty',
                'name'          : 'data[AgreementsPacket][penalty]',
                'editable'      : true,
                'label'         : 'Penalty',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'AgreementsPacket.deposit',
                'name'          : 'data[AgreementsPacket][deposit]',
                'editable'      : true,
                'label'         : 'Deposit',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'name'      :'data[AgreementsPacket][charge]',
                'index'     :'AgreementsPacket.charge',
                'editable'  :true,  
                'label'     : 'Charge',
                'width':75,
                'sortable':false
            }
            
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdDetailPager, 
        'sortname'      : 'AgreementsPacket.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : true ,
        "jsonReader"    : {
                "repeatitems": false,
                "id": "id"
            }
    });
    
    var agreementPacketGrid = $("#"+gridIdDetail).jqGrid(
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
