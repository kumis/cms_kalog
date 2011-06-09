<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array("fields" => array(
                "param" => array(
                    'title' => __("Name", true), 
                    'sortable' => true
                ),
                "value" => array(
                    'title' => __("Code", true),
                    'sortable' => true
                )
              ),
              "editable"  => "param"
        ));
?>
</div>