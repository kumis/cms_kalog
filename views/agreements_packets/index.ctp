tes
<?php
// =================================================================
// Trucks
// =================================================================
$gridId       = 'agrements_packet';
$primaryKey   = "AgreementsPacket.id";
$url = Router::url(array(
        'controller'    => 'agrements_packets',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
	)
);
$editUrl = Router::url(array(
        'controller'    => 'agrements_packets',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

?>

<div id="Agreements_packets">
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
                'index'         : 'AgreementsPacket.charge',
                'name'          : 'data[AgreementsPacket][charge]',
                'editable'      : true,
                'label'         : 'Charge',
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
                'label'         : 'Freetime',
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
            },{
                'width'         : 50,
                'index'         : 'AgreementsPacket.Deposit',
                'name'          : 'data[AgreementsPacket][deposit]',
                'editable'      : true,
                'label'         : 'Charge',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            
        ],
        'rowNum'        : 10, 
        'rowList'       : [10,20,30], 
        'pager'         : gridIdDetailPager, 
        'sortname'      : 'AgreementsPacket.id',
        'viewrecords'   : true, 
        'sortorder'     : "asc",
        'multiselect'   : false ,
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
        },{},{},{},{multipleSearch:true}
    );
    
    //]]>
</script>
