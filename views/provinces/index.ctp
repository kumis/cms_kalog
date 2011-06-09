<div class="<?php echo $this->params['controller']; ?> index">
<?php echo $this->element('tablegrid',
        array(
            "fields" => array(
                "code" => array(
                    'title' => __('Code', true),
                    'sortable' => true
                ),
                "name" => array(
                    'title' => __('Name', true),
                    'sortable' => false
                )
            ),
            "editable"  => "code"
        ));
?>
</div>
