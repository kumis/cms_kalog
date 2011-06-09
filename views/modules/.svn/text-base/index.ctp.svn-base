<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "name" => array(
                    'title' => __('name', true),
                    'sortable' => true
                ),
                "controller" => array(
                    'title' => __('Controller', true),
                    'sortable' => true
                ),
                "created_by" => array(
                    'title' => __('Created By', true),
                    'sortable' => true
                ),
                "created" => array(
                    'title' => __('Created On', true),
                    'sortable' => true
                )
            ),
            "assoc" => array(
                'created_by' => array(
                    'field' => 'name',
                    'model' => 'User'
                )
            ),
            'displayedAs' => array(
                'created' => 'date'
            ),
            "editable"  => "name"
        ));
?>
</div>
