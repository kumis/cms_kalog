<?php
// =================================================================
// Master : Contact people
// =================================================================
$gridIdMaster       = 'contactPerson_master';
$masterPrimaryKey   = "ContactPerson.id";
$urlMaster          = Router::url(array(
        'controller'    => 'contactPeople',
        'action'        => 'jqgrid_list',
        'ext'           => 'json',
    )
);
$editUrlMaster = Router::url(array(
        'controller'    => 'contactPeople',
        'action'        => 'jqgrid_edit',
        'ext'           => 'json',
	)
);

?>

<table id="<?php echo $gridIdMaster;?>"></table>
<div id="<?php echo $gridIdMaster;?>_pager"></div> 
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
    
    var contactPersonGrid = $("#"+gridIdMaster).jqGrid({
        'caption'       : "ContactPeople",
        'width'         : 800,
        "gridModel"     : true,
        'url'           : urlMaster,
        'datatype'      : 'json',
        'editurl'       : editUrlMaster,
        'colNames'      : [],
        'colModel'      : [
            {
                'width'         : 50,
                'index'         : 'ContactPerson.id',
                'name'          : 'data[ContactPerson][id]',
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
                'editable'      : true,
                'label'         : 'First Name' 
            },
            
            {
                'width'         : 50,
                'index'         : 'ContactPerson.middle_name',
                'name'          : 'data[ContactPerson][middle_name]',
                'editable'      : true, 
                'label'         : 'Middle Name',
                'editoptions'   : 
                    {
                        'size'          : 10
                        }, 
                'editrules': { required: true},
                
                            
            },
            {
                'width'         : 50,
                'index'         : 'ContactPerson.last_name',
                'name'          : 'data[ContactPerson][last_name]',
                'editable'      : true,
                'label'         : 'Last Name',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'ContactPerson.email',
                'name'          : 'data[ContactPerson][email]',
                'editable'      : true,
                'label'         : 'Email',
                'editoptions'   : 
                    {
                        'size'          : 10
                    }                    
            },
            {
                'width'         : 50,
                'index'         : 'ContactPerson.mobile_phone_number',
                'name'          : 'data[ContactPerson][mobile_phone_number]',
                'editable'      : true,
                'label'         : 'Mobile Phone Number',
                'editoptions'   : 
                    {
                        'size'          : 10
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
                        jQuery("#"+gridIdDetail).jqGrid('setCaption', "ContactPerson Packate: " + ids).trigger('reloadGrid');
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
    
    var contactPersonGrid = $("#"+gridIdMaster).jqGrid(
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
