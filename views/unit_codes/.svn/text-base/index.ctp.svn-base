<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array("fields" => array(
                "name" => array(
                    'title' => __("Name", true), 
                    'sortable' => true
                ),
                "code" => array(
                    'title' => __("Code", true),
                    'sortable' => true
                ),
                "created_by" => array(
                    'title' => __("Created By", true),
                    'sortable' => false
                ),
                "created" => array(
                    'title' => __("Created On", true),
                    'sortable' => false
                )
              ),
              "editable"  => "name",
              "assoc" => array(
                'created_by' => array(
                    'field' => 'name',
                    'model' => 'User'
                )
              ),
              "displayedAs" => array(
                'created' => 'datetime'
              )
        ));
?>
</div>