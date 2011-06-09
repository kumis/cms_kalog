<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "name" => array(
                    'title' => __('Name', true),
                    'sortable' => true
                ),
                "other_name" => array(
                    'title' => __('Other Name', true),
                    'sortable' => true
                ),
                "province_id" => array(
                    'title' => __('Province', true),
                    'sortable' => true
                )
            ),
            "editable"  => "name",
            "assoc" => array(
                "province_id" => array(
                    'model' => 'Province',
                    'field' => 'name'
                )
            )
        ));
?>
</div>
